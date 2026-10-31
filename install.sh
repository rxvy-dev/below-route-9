#!/usr/bin/env bash
# BELOW ROUTE 9 installer — builds and installs the game on any mainstream Linux distro.
#
#   unzip Below-Route-9-linux.zip && cd Below-Route-9 && ./install.sh
#   curl -fsSL https://raw.githubusercontent.com/rxvy-dev/below-route-9/main/install.sh | bash
#
# Options:
#   --prefix DIR   install under DIR (default: ~/.local, or /usr/local when run as root)
#   --system       install to /usr/local (uses sudo/doas)
#   --no-deps      don't install build dependencies with the package manager
#   --uninstall    remove an installed copy (honours --prefix/--system)
#   -y, --yes      don't ask before installing packages
#   -h, --help     show this help
set -euo pipefail

REPO_URL="https://github.com/rxvy-dev/below-route-9"
APP="below-route-9"

# ---------------------------------------------------------------- output
if [ -t 1 ]; then
  B=$'\033[1m'; R=$'\033[31m'; G=$'\033[32m'; Y=$'\033[33m'; D=$'\033[2m'; N=$'\033[0m'
else
  B=""; R=""; G=""; Y=""; D=""; N=""
fi
say()  { printf '%s==>%s %s\n' "$B" "$N" "$*"; }
ok()   { printf '%s ok%s %s\n' "$G" "$N" "$*"; }
warn() { printf '%swarn%s %s\n' "$Y" "$N" "$*" >&2; }
die()  { printf '%serror%s %s\n' "$R" "$N" "$*" >&2; exit 1; }

usage() {
  if [ -f "$0" ]; then sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'
  else echo "usage: install.sh [--prefix DIR] [--system] [--no-deps] [--uninstall] [-y]"; fi
  exit 0
}

# ---------------------------------------------------------------- args
PREFIX=""
SYSTEM=0
DEPS=1
UNINSTALL=0
ASSUME_YES=0
while [ $# -gt 0 ]; do
  case "$1" in
    --prefix) [ $# -ge 2 ] || die "--prefix needs a directory"; PREFIX="$2"; shift 2 ;;
    --prefix=*) PREFIX="${1#*=}"; shift ;;
    --system) SYSTEM=1; shift ;;
    --no-deps) DEPS=0; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    -y|--yes) ASSUME_YES=1; shift ;;
    -h|--help) usage ;;
    *) die "unknown option: $1 (try --help)" ;;
  esac
done

if [ -z "$PREFIX" ]; then
  if [ "$SYSTEM" = 1 ] || [ "$(id -u)" = 0 ]; then PREFIX="/usr/local"; else PREFIX="${HOME}/.local"; fi
fi

# ---------------------------------------------------------------- privilege helper
SUDO=""
if [ "$(id -u)" != 0 ]; then
  if command -v sudo >/dev/null 2>&1; then SUDO="sudo"
  elif command -v doas >/dev/null 2>&1; then SUDO="doas"
  fi
fi
as_root() {
  if [ "$(id -u)" = 0 ]; then "$@"
  elif [ -n "$SUDO" ]; then $SUDO "$@"
  else die "need root for: $* (install sudo or doas, or rerun as root)"; fi
}
# Install step needs root only if the prefix isn't writable by us.
prefix_cmd() {
  local probe="$PREFIX"
  while [ ! -e "$probe" ]; do probe="$(dirname "$probe")"; done
  if [ -w "$probe" ]; then "$@"; else as_root "$@"; fi
}

# ---------------------------------------------------------------- uninstall
if [ "$UNINSTALL" = 1 ]; then
  say "Removing BELOW ROUTE 9 from ${PREFIX}"
  for f in "bin/${APP}" "share/applications/${APP}.desktop" "share/icons/hicolor/scalable/apps/${APP}.svg"; do
    if [ -e "${PREFIX}/${f}" ]; then prefix_cmd rm -f "${PREFIX}/${f}"; ok "removed ${PREFIX}/${f}"; fi
  done
  printf '%sSaves and settings were kept in %s and %s.%s\n' "$D" \
    "${XDG_DATA_HOME:-$HOME/.local/share}/below-route-9" "${XDG_CONFIG_HOME:-$HOME/.config}/below-route-9" "$N"
  exit 0
fi

# ---------------------------------------------------------------- source tree
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || pwd)"
if [ ! -f "${SRC_DIR}/CMakeLists.txt" ] || [ ! -f "${SRC_DIR}/src/game.cpp" ]; then
  # Piped through curl (or run outside the source): fetch the release zip first.
  ZIP_URL="${REPO_URL}/raw/main/Below-Route-9-linux.zip"
  command -v unzip >/dev/null 2>&1 || die "unzip is required to unpack the source"
  TMP="$(mktemp -d)"
  say "Downloading source from ${ZIP_URL}"
  if command -v curl >/dev/null 2>&1; then curl -fsSL -o "$TMP/src.zip" "$ZIP_URL"
  elif command -v wget >/dev/null 2>&1; then wget -qO "$TMP/src.zip" "$ZIP_URL"
  else die "curl or wget is required to download the source"; fi
  unzip -q "$TMP/src.zip" -d "$TMP"
  SRC_DIR="$TMP/Below-Route-9"
  [ -f "$SRC_DIR/CMakeLists.txt" ] || die "the downloaded zip didn't contain the source"
fi
cd "$SRC_DIR"

# ---------------------------------------------------------------- distro detection
ID="unknown"; ID_LIKE=""; PRETTY="Linux"
if [ -r /etc/os-release ]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  ID="${ID:-unknown}"; ID_LIKE="${ID_LIKE:-}"; PRETTY="${PRETTY_NAME:-$ID}"
fi
say "Detected ${PRETTY}"

PM=""
for c in apt-get dnf yum pacman zypper xbps-install apk emerge eopkg nix-shell; do
  if command -v "$c" >/dev/null 2>&1; then PM="$c"; break; fi
done
# NixOS ships nix-shell but no traditional package manager.
if [ "$ID" = "nixos" ]; then PM="nix-shell"; fi

confirm() {
  [ "$ASSUME_YES" = 1 ] && return 0
  [ -t 0 ] || return 0
  printf '%s [Y/n] ' "$1"
  read -r a || true
  case "${a:-y}" in y|Y|yes|YES) return 0 ;; *) return 1 ;; esac
}

pacman_sdl() {
  # Arch replaced sdl2 with sdl2-compat (SDL2 API on top of SDL3).
  if pacman -Si sdl2-compat >/dev/null 2>&1; then echo sdl2-compat; else echo sdl2; fi
}

install_deps() {
  case "$PM" in
    apt-get)
      as_root apt-get update -qq
      as_root env DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential cmake pkg-config libsdl2-dev git ;;
    dnf)
      as_root dnf install -y gcc-c++ make cmake pkgconf-pkg-config SDL2-devel git ;;
    yum)
      as_root yum install -y gcc-c++ make cmake3 pkgconfig SDL2-devel git ;;
    pacman)
      as_root pacman -S --needed --noconfirm base-devel cmake pkgconf "$(pacman_sdl)" git ;;
    zypper)
      as_root zypper --non-interactive install gcc-c++ make cmake pkg-config libSDL2-devel git ;;
    xbps-install)
      as_root xbps-install -Sy base-devel cmake pkg-config SDL2-devel git ;;
    apk)
      as_root apk add --no-cache build-base cmake pkgconf sdl2-dev git ;;
    emerge)
      as_root emerge --noreplace --quiet media-libs/libsdl2 dev-build/cmake dev-vcs/git ;;
    eopkg)
      as_root eopkg install -y -c system.devel
      as_root eopkg install -y sdl2-devel cmake git ;;
    nix-shell)
      : ;;  # handled by running the build inside nix-shell
    *)
      warn "Unknown package manager. Install these yourself: a C++17 compiler, CMake 3.16+, pkg-config, SDL2 development files."
      return 1 ;;
  esac
}

have_deps() {
  command -v cmake >/dev/null 2>&1 || return 1
  command -v c++ >/dev/null 2>&1 || command -v g++ >/dev/null 2>&1 || command -v clang++ >/dev/null 2>&1 || return 1
  pkg-config --exists sdl2 2>/dev/null && return 0
  [ -e /usr/lib/cmake/SDL2/SDL2Config.cmake ] || [ -e /usr/lib64/cmake/SDL2/SDL2Config.cmake ] \
    || ls /usr/lib/*/cmake/SDL2/SDL2Config.cmake >/dev/null 2>&1
}

if [ "$DEPS" = 1 ] && [ "$PM" != "nix-shell" ]; then
  if have_deps; then
    ok "build dependencies already present"
  elif [ -z "$PM" ]; then
    die "no supported package manager found; install a C++17 compiler, CMake, pkg-config and SDL2 dev files, then run with --no-deps"
  elif confirm "Install build dependencies with ${PM}?"; then
    say "Installing build dependencies (${PM})"
    install_deps || die "dependency install failed"
  else
    die "dependencies are required (or rerun with --no-deps if you installed them another way)"
  fi
fi

# ---------------------------------------------------------------- build
JOBS="$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)"
CMAKE="cmake"
command -v cmake >/dev/null 2>&1 || { command -v cmake3 >/dev/null 2>&1 && CMAKE="cmake3"; }
BUILD_CMD="$CMAKE -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='${PREFIX}' && $CMAKE --build build -j ${JOBS}"

say "Building BELOW ROUTE 9 (${JOBS} jobs)"
if [ "$PM" = "nix-shell" ]; then
  [ -f shell.nix ] || die "shell.nix missing from the source tree"
  nix-shell shell.nix --run "$BUILD_CMD"
else
  sh -c "$BUILD_CMD"
fi
[ -x build/below-route-9 ] || die "build failed: build/below-route-9 was not produced"
ok "built $(./build/below-route-9 --version)"

# ---------------------------------------------------------------- install
say "Installing to ${PREFIX}"
prefix_cmd "$CMAKE" --install build --prefix "$PREFIX" >/dev/null
DESKTOP="${PREFIX}/share/applications/${APP}.desktop"
if [ -f "$DESKTOP" ]; then
  # Absolute Exec path so launchers work even if PREFIX/bin isn't on PATH.
  prefix_cmd sed -i "s|^Exec=.*|Exec=${PREFIX}/bin/${APP}|" "$DESKTOP"
fi
command -v update-desktop-database >/dev/null 2>&1 && prefix_cmd update-desktop-database -q "${PREFIX}/share/applications" 2>/dev/null || true
command -v gtk-update-icon-cache >/dev/null 2>&1 && prefix_cmd gtk-update-icon-cache -q -t "${PREFIX}/share/icons/hicolor" 2>/dev/null || true
ok "installed ${PREFIX}/bin/${APP}"

# An older copy somewhere else would keep launching instead of this one.
for OLD in /usr/local/bin/${APP} /usr/bin/${APP} "${HOME}/.local/bin/${APP}"; do
  [ -x "$OLD" ] && [ "$OLD" != "${PREFIX}/bin/${APP}" ] || continue
  warn "an older copy is still installed at ${OLD} ($("$OLD" --version 2>/dev/null || echo 'unknown version'))."
  printf '      Remove it so it stops launching instead:  %s\n' "$( [ -w "$OLD" ] && echo "rm '$OLD'" || echo "sudo rm '$OLD'" )"
done
FIRST="$(command -v "$APP" 2>/dev/null || true)"
if [ -n "$FIRST" ] && [ "$FIRST" != "${PREFIX}/bin/${APP}" ]; then
  warn "typing '${APP}' runs ${FIRST}, not the copy you just installed (${PREFIX}/bin/${APP})."
fi

case ":${PATH}:" in
  *":${PREFIX}/bin:"*) ;;
  *) warn "${PREFIX}/bin is not on your PATH. Add this to your shell profile:"
     printf '      export PATH="%s/bin:$PATH"\n' "$PREFIX" ;;
esac

printf '\n%sBELOW ROUTE 9 is installed.%s Launch it from your app menu or run: %s%s%s\n' "$B" "$N" "$B" "$APP" "$N"
printf '%sWayland: SDL_VIDEODRIVER=wayland %s   Uninstall: ./install.sh --uninstall%s\n' "$D" "$APP" "$N"
