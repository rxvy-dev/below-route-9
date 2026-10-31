# BELOW ROUTE 9

![BELOW ROUTE 9](docs/logo.png)

A first-person Backrooms horror game for **Linux**. (Windows has its own repo: [Below-Route-9-Windows](https://github.com/rxvy-dev/Below-Route-9-Windows).)

> **Formerly LIMINAL SHIFT.** Same game, new name. Saves from the old version live in a `liminal-shift` folder; rename it to `below-route-9` to keep your progress (see [Saves](#saving)).

You're Dana, working the last closing shift of the week at the Quik-Stop on Route 9. Ring people up, restock, mop. At 10:00 the power dies. You call Ray, the late-night electrician, and take him down to the basement panel. The wiring doesn't go anywhere. Then the floor lets go, and when you land, Ray is gone.

Below: yellow offices, a flooded parking garage, an abandoned office that counts on you, steam tunnels, the Poolrooms, a ball pit the size of a warehouse, a level where every light has died, a suburb of identical houses. Levels never repeat. Get to the bottom and get out.

No combat. You survive by listening, staying quiet, finding your own way out, and running when something finds you.

| | |
|---|---|
| ![Night shift at the Quik-Stop](docs/screenshots/storecustomers.jpg) | ![The power goes out](docs/screenshots/storeout.jpg) |
| ![Ray at the basement panel](docs/screenshots/storebasement.jpg) | ![Ending: his daughter](docs/screenshots/endingA4.jpg) |
| ![Ending: home, but wrong](docs/screenshots/endingB5.jpg) | ![Ending: sunrise](docs/screenshots/endingB16.jpg) |
| ![Level 0](docs/screenshots/play.jpg) | ![A dark zone](docs/screenshots/dark.jpg) |
| ![The Tenant](docs/screenshots/tenant.jpg) | ![The Hound](docs/screenshots/hound.jpg) |
| ![The Grin](docs/screenshots/grin.jpg) | ![Survey camp](docs/screenshots/camp.jpg) |
| ![Underground Parking](docs/screenshots/parking.jpg) | ![Pipe Dreams](docs/screenshots/level2.jpg) |
| ![The Poolrooms](docs/screenshots/level3.jpg) | ![Lights Out](docs/screenshots/level4.jpg) |
| ![Clues on the walls](docs/screenshots/clue.jpg) | ![Falling into the next level](docs/screenshots/transition.jpg) |
| ![Count On Me](docs/screenshots/countonme.jpg) | ![The Playplace](docs/screenshots/playplace.jpg) |
| ![The Suburbs](docs/screenshots/suburbs.jpg) | ![EXIT signs near the way out](docs/screenshots/exitsign.jpg) |
| ![The pit floor](docs/screenshots/pits.jpg) | ![The closing-down bookstore](docs/screenshots/bookstore.jpg) |
| ![Stairs to nowhere](docs/screenshots/stairs.jpg) | ![NightShot in Lights Out](docs/screenshots/nightshot.jpg) |
| ![The trail: footprints, tape and the cord](docs/screenshots/trail.jpg) | ![Somebody's living room](docs/screenshots/livingroom.jpg) |

## Install

You need a GPU with OpenGL 3.3 (anything from roughly 2010 on).

### Linux

Works on Ubuntu, Debian, Mint, Pop!_OS, Fedora, Arch, Manjaro, EndeavourOS, openSUSE, Void, Alpine, Gentoo, Solus and NixOS, on X11 or Wayland, with Nvidia, AMD or Intel graphics.

**From the release zip:**

```sh
unzip Below-Route-9-linux.zip
cd Below-Route-9
./install.sh
```

**Or from git:**

```sh
wget https://github.com/rxvy-dev/below-route-9/raw/refs/heads/main/Below-Route-9-linux.zip
unzip Below-Route-9-linux.zip
cd Below-Route-9
./install.sh
```

`install.sh` detects your package manager, asks before installing the build dependencies (a C++17 compiler, CMake, pkg-config and SDL2), builds the game, and installs it to `~/.local` with a desktop entry and icon. No root needed except for the package install.

Then open **BELOW ROUTE 9** from your app menu, or run `below-route-9`. If your shell can't find it, add `~/.local/bin` to your `PATH` (the installer tells you if it's missing).

**One-line install** (does all of the above):

```sh
curl -fsSL https://raw.githubusercontent.com/rxvy-dev/Below-Route-9/main/install.sh | bash
```

**Update:** `git pull && ./install.sh` from the folder. **Uninstall:** `./install.sh --uninstall` (your saves are kept).

| Installer option | What it does |
|---|---|
| `--prefix DIR` | Install somewhere else |
| `--system` | Install to `/usr/local` for all users |
| `--no-deps` | Skip the package manager step |
| `--uninstall` | Remove the game (saves are kept) |
| `-y` | Don't ask before installing packages |

### Building by hand

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
./build/below-route-9
```

The only dependency is SDL2. All textures, models and sounds are generated at startup, so the binary is self-contained.

## Controls

| Action | Keyboard / mouse | Gamepad |
|---|---|---|
| Move | WASD | Left stick |
| Look | Mouse | Right stick |
| Run | Shift | L3 / LT |
| Jump | Space | X |
| Crouch (quiet) | Ctrl or C | B (hold) |
| NightShot (flashlight in the store) | F or right mouse | LB |
| Use / read / hide | E or left mouse | A |
| Put Ray down | G | Y |
| Pause | Esc | Start |

## The levels

Every level is big, but it ends: walk far enough and you hit its edge. And no level is one pattern copied over and over: each is split into districts that look and play differently (a huge pillared hall, a tight maze, an older wing with darker walls and lights that won't settle, a stretch where most of the lights are dead, an abandoned office floor of desks, long parallel corridors, a closing-down bookstore of emptied wooden shelving with FOR SALE posters on the pillars, and in the Lobby, Lights Out and Run, a floor that's mostly holes: a grid of narrow walkways over square pits that go down further than you can see), walled off from each other except for a few doorways, most with a landmark to steer by: a tower of boxes, somebody's living room, a ring of chairs around a lantern. Somewhere on every level an old wooden staircase climbs up into a black hole in the ceiling. Doors are set into the walls that don't open onto anything. In the rough parts, ceiling tiles are missing and water stains spread across the rest, and in the dark districts there's sometimes one lit room at the far end of a long black corridor. Step off a walkway in the pit floor and you fall; you come round back at your last checkpoint with the camcorder on the floor. Nothing points the way at first. Someone got out before you, though, and the trail they left gets harder to miss the closer you get. Fall through and you land in the next level. Only the camcorder comes down: it cracks against the floor and lies on its side, still recording, looking down the longest stretch of floor it can see. After a while, footsteps come up behind it, a shadow leans over the lens, and it's picked up from behind.

| Level | Space | Who lives there |
|---|---|---|
| Intro | **The Quik-Stop**: a ten-minute night shift with customers, restocking and spills. Then the lights go out | Customers, Ray |
| 0 | **The Lobby**: yellow wallpaper, damp carpet, humming lights | The Tenant, the Hound, the Grin, the Stilt |
| 1 | **Underground Parking**: rows of lettered concrete piers, a low ceiling full of sprinkler pipes, bare tubes, puddles that mirror every light, cars nobody came back for | Two Hounds, a Grin |
| 33 | **Count On Me**: an office somebody walked out of. Beige walls, dark carpet, a mural about customer service, and two doors onto corridors a metre wide that go on much further than the building does | The Tenant, a Grin, the Stilt |
| 2 | **Pipe Dreams**: narrow brick tunnels, rusted pipes, orange caged lights | The Tenant, a Hound, a Grin |
| 37 | **The Poolrooms**: cream tile and clear green water, round columns standing in the pools, raised walkways, sunlight falling through skylights in real shadowed beams, spiral stairs climbing up through round holes in the ceiling, tunnels half under the water. Splashing is loud | The Lifeguard |
| 62 | **The Playplace**: a dark hall filled with a sea of plastic balls you wade through, giant hourglass pillars, spiral tube slides coming down out of the ceiling | Grins, Partygoers |
| 4 | **Lights Out**: every fixture dead. Only the EXIT signs glow | The Tenant and four Grins |
| 9 | **The Suburbs**: open sky, rolling green hills, the same house over and over to the horizon. One of them has blue tape round its door | A Hound, the Stilt |
| 188 | **The Courtyard of Windows**: a hotel atrium twelve metres deep, a wall of windows, a lawn far below | ...you |
| Fun =) | **The Party**: orange and yellow rooms, a carpet covered in letters, balloon arches, a cake on every table. When it's somebody's birthday, get under a table | The Partygoers |
| ! | **Run For Your Life** | Everything |

### The night shift

The Quik-Stop is a real store with a real outside. Walk out the front door into the rain: the lot, the gas canopy, the pumps, the cars going by on Route 9. Don't wander too far, though. Customers waiting at the counter will yell after you. Customers park at the pumps or walk in off the sidewalk. Each one picks something off the shelves and carries it to the counter. Key it into the register, take their cash, and put it in the drawer. Be quick: the longer you make them wait, the ruder they get, from "Hello?" to folded arms and knuckles on the counter to storming out. After the power goes, you'll watch Ray's van pull in with its headlights on, then see him cross the lot to the door.

### The suit

There's an empty yellow hazmat suit waiting at the bottom of the fall. Put it on. From then on you see your yellow sleeves and black gloves, the edge of the visor, and your breath fogging the glass, and you hear yourself breathing through the respirator.

### Blinking

Dana blinks every few seconds, faster when she's scared. The Grin only moves when you're not looking at it, and a blink counts. You can turn blinking off in Options.

### Clues on the walls

There are no painted arrows: every level is finite, and you have to find the way out yourself, but someone went this way before you. First there are footprints (not every set of them goes somewhere good). About a third of the way along, strips of blue tape start showing up at the turns, a tab sticking out the way to go. From halfway, an orange extension cord runs along the floor, all the way to the door. Most of the way there, someone has rearranged the letters on a wall to read THE END IS NEAR. Near the end the lights along the way out burn steady while the ones around them die, and lit green **EXIT** signs hang from the ceiling and point you in. The thin place hums, too, and the hum carries. The thin place itself is a door outlined in blue tape, with **EXIT** painted above it. Dead ends still say **NOT THIS WAY**. Everything else on the walls is people who didn't make it.

### Saving

The game autosaves every 30 seconds (you'll see SAVED at the top of the screen), whenever you read a note, and whenever you fall into a new level. CONTINUE puts you back exactly where you were (and, if you went back for Ray, with him where you left him or still on your back). Finishing the story clears the save. Tapes, badges, endings and best depths live in a separate `profile.ini` and are never cleared.

### Hiding

Lockers stand against the walls on every level. Get in one without being seen and whatever is hunting you loses you. If it watched you climb in, it knows. Out in the open, switching NightShot off in a dark stretch and crouching makes you very hard to spot.

### Ray

Ray fell too, but not where you did. You won't see him on the way down. Only if you take the green EXIT at the very end do you drop into the level where he's lying hurt, calling for help. Pick him up and carry him: you'll be slower, louder and tire faster. You can put him down. You can leave him. He'll beg.

### Blood

On most levels something was dragged a few rooms and left against a wall: smears across the carpet, splatter where it turned, a pool where it stopped, and handprints sliding down the wall above it. Now and then there's a lone print by a dead end.

### Probably nothing

Every minute or two, when nothing is chasing you, something small happens. Footsteps behind you that keep your pace and stop when you stop (turn around and they're gone). The lights going out one fixture at a time, coming toward you. Somebody standing very still at the far end of the hall, gone when you get close or look away. Knocking from inside the wall. Once in a while, the tape glitches, and for two frames there's a face.

### Things caught mid-noclip

Chairs half inside walls, boxes sunk into the floor, a cooler drifting at head height, furniture upside down on the ceiling. Everything here fell through something once.

### Endings

Get out of the last level and you find three holes in a wall, scrawled over in marker: a blue one marked THIS WAY, a yellow one with question marks around it, and a green one that says EXIT :). Each one is a different ending, and none of them are what you think. Every ending is shot in-engine on Ray's camcorder.

### Lost tapes

Two VHS tapes are hidden on every Backrooms level, sixteen in all, away from the painted route. Look for a blinking red REC light on the floor. Each one plays a camcorder transcript from the Survey team, Ray, Dana and Unit 4, and together they explain what the yellow suit is. Tapes stay found across every playthrough, and you can rewatch them under **ARCHIVE** on the title screen.

### Survey badges

Sixteen badges, each with a pop-up when you earn it. Some are for story moments, some for skill (escape a level without getting caught, or in under three minutes), some for the store (serve 8 customers in one shift), and four are secret until you see the matching ending. **ARCHIVE** shows the full list, which endings you've seen, and a hint for each one you haven't.

### KEEP FALLING (endless)

See any ending and **KEEP FALLING** unlocks on the title screen. There's no store and no Ray: you just fall from one random level into the next, forever. Every depth is meaner than the last, with hunts that come sooner and more often, fewer batteries and almond water, darker halls and more things walking them. Get caught once and the run is over. Your best depth is saved.

**TODAY'S FALL** is the same run for everyone on the same day (it's seeded from the date), with its own best that resets at midnight UTC.

### Running

Sometimes something just *knows* where you are. An alarm sounds, the lights pulse red, the music kicks in, and you have to run until it gives up. And every time you get close to an exit, something comes up behind you. Save your stamina and an almond water for the last stretch.

## Level 0 in detail

- **The Tenant.** Far too tall, stooped under the ceiling. Lights dim and stutter as it gets close. It hunts by sight and sound, and it forgets you once you break line of sight.
- **The Hound.** On all fours, no eyes. It clicks to hear the room. Running near it is a death sentence; standing still is not.
- **The Grin.** Lives in the parts where every light has died. It's drawn to the camcorder's infrared lamp, and it only moves when you aren't looking at it.
- **8 notes** from Theo, the Survey and Management. Each one is a checkpoint.
- **A way out**, if you can find the wall that isn't quite solid. Listen for the static.

## Graphics

**Ray tracing** (on by default; Options → RAY TRACING). The levels are tile grids, so the world shader traces real rays through them on any OpenGL 3.3 GPU, no RT cores needed. Every pixel traces shadow rays to the ceiling fixtures around it: walls, pillars and the people and things walking around block the light, and the panels are area lights, so the shadows are soft. Each fixture gives a proper highlight, and when a light flickers or dies, everything it lit reacts. Glossy floors, wet carpet and pool water trace reflection rays that hit walls, pillars, the ceiling and the lit panels, even ones that are off screen. The baked lightmap still supplies the bounce light, tinted by the walls it bounced off, and the garage's puddles mirror everything.

The camcorder filter (on by default, toggle it in Options) makes it look like footage off a 2000s handycam: a 4:3 picture with black bars at the sides (switch to widescreen in Options), soft and warm, colour a little flat, blacks that sink, glow round the lights, colour noise in the shadows that gets worse as the camera's gain goes up in the dark, and an autofocus that hunts now and then. Somebody is holding it: it breathes (faster when they're scared or out of breath), dips and sways with each footstep, shakes when they run, trembles when something's near, rolls a little into turns and trails your look by a hair. The PLAY / SP / VCR TAPE overlay and the tape counter are recorded onto the picture.

Forward renderer on OpenGL 3.3 with:

- Sculpted creatures and people (signed-distance-field sculpts meshed with Surface Nets), skinned to skeletons and animated procedurally on the GPU. People come in four outfits (tee and jeans, suit and tie, work jacket and cap, hazmat suit) with faces, hands, belts and shoes
- First-person hands in the store: the flashlight, cash from the till, the stock box. Below, the flashlight is gone; the camcorder's NightShot mode (green, grainy, with its own infrared lamp) is how you see in the dark
- Sunlight with its own orthographic shadow map and volumetric god rays (Poolrooms), caustics under sunlit water, screen-space reflections on the pools
- Flashlight shadow maps with PCF, GGX specular, subsurface wrap lighting on skin
- Volumetric flashlight beam and fluorescent haze
- SSAO, baked per-light visibility for hundreds of flickering ceiling lights
- HDR bloom chain, ACES tonemapping and colour grade, FXAA
- Optional camcorder look: tape jitter, chroma bleed, scanlines, timestamp

Graphics presets (Low, Medium, High) are in Options. Low turns off shadows, SSAO and volumetrics and renders at 65% resolution for older integrated GPUs.

## Command line

```
below-route-9 --windowed --size 1920x1080   # window size
below-route-9 --seed 1234                   # replay a specific layout
below-route-9 --level 3                     # start in the Poolrooms
below-route-9 --quality 0                   # force Low preset
below-route-9 --no-audio
SDL_VIDEODRIVER=wayland below-route-9       # native Wayland instead of XWayland
```

Saves live in `$XDG_DATA_HOME/below-route-9` (default `~/.local/share/below-route-9`) and settings in `$XDG_CONFIG_HOME/below-route-9`.

## Troubleshooting

- **"OpenGL 3.3 is required"**: update Mesa, or install your GPU's driver. Check with `glxinfo -B`.
- **No sound**: SDL picks PipeWire, PulseAudio or ALSA automatically. Try `SDL_AUDIODRIVER=pulseaudio below-route-9` or `SDL_AUDIODRIVER=alsa below-route-9`.
- **Low frame rate**: set Graphics to Medium or Low in Options.

## Roadmap

See [docs/DESIGN.md](docs/DESIGN.md) for the full plan and [docs/LORE.md](docs/LORE.md) for the story bible. Next up: hiding spots, audio tapes, the Hotel and the Mall, and AppImage/Flatpak releases.

## License

MIT. See [LICENSE](LICENSE). The 8x8 bitmap font is public domain ([dhepper/font8x8](https://github.com/dhepper/font8x8)). The camcorder, menu and title-card text uses **VCR OSD Mono** by Riciery Leal, a free font (`assets/fonts/`), baked into `src/title_font.h` by `tools/make_title_font.py`. The "Count On Me!" mural is lettered in **Courgette** by Karolina Lach (SIL Open Font License 1.1, `assets/fonts/`) and baked into `src/mural_data.h` by `tools/make_mural.py`.
