# BELOW ROUTE 9

![BELOW ROUTE 9](docs/logo.png)

A first-person Backrooms horror game for **Linux**. (Windows has its own repo: [Below-Route-9-Windows](https://github.com/rxvy-dev/Below-Route-9-Windows).)

> **Formerly LIMINAL SHIFT.** Same game, new name. Saves from the old version live in a `liminal-shift` folder; rename it to `below-route-9` to keep your progress (see [Saves](#saving)).

You're nine. It's Saturday afternoon at Route 9 Park, the trampoline park off the highway: Mom and Dad are at the tables by the front, the music's loud, other kids are bouncing all over the court. One of the beds against the back wall has a pad that's come away from the wall, and the gap behind it is dark, and cold, and humming. You get too close, and you slip down it, and you keep falling.

Below: yellow offices, a flooded parking garage, an abandoned office that counts on you, steam tunnels, the Poolrooms, a ball pit the size of a warehouse, a level where every light has died, a suburb of identical houses. Levels never repeat. Get to the bottom and get out.

No combat. You survive by listening, staying quiet, finding your own way out, and running when something finds you.

| | |
|---|---|
| ![Route 9 Park](docs/screenshots/park.jpg) | ![The gap behind the pad](docs/screenshots/parkgap.jpg) |
| ![Ending: back up through the gap, 3:14 AM](docs/screenshots/endpark.jpg) | ![Ending: Mom](docs/screenshots/endmom.jpg) |
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
| ![Stairs to nowhere](docs/screenshots/stairs.jpg) | ![Lights Out](docs/screenshots/nightshot.jpg) |
| ![The trail: footprints, tape and the cord](docs/screenshots/trail.jpg) | ![Somebody's living room](docs/screenshots/livingroom.jpg) |
| ![Knocked: the tape jumps, a tracking band tears through, the scratch from the drop](docs/screenshots/knock.jpg) | ![A worn stretch of tape](docs/screenshots/worntape.jpg) |
| ![Dad, waiting by the tables](docs/screenshots/dad.jpg) | ![Route 9 Park](docs/screenshots/park.jpg) |

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

**Or straight from the terminal:**

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

**Updating to a new version (v2.12.0 included): yes, you need to reinstall.** The game doesn't update itself. Delete the old zip and folder, download the new zip, unzip it and run `./install.sh` again. It installs right over the old version, and your saves, tapes, badges and settings are kept.

```sh
rm -rf Below-Route-9 Below-Route-9-linux.zip
wget https://github.com/rxvy-dev/below-route-9/raw/refs/heads/main/Below-Route-9-linux.zip
unzip Below-Route-9-linux.zip && cd Below-Route-9 && ./install.sh
```

Don't use `wget -c` for this. It resumes onto the old zip and leaves you with a broken one (see [Troubleshooting](#troubleshooting)).

**Uninstall:** `./install.sh --uninstall` (your saves are kept).

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
| Use / read / hide | E or left mouse | A |
| Let go of Ray | G | Y |
| Pause | Esc | Start |

## The levels

Every level is big, but it ends: walk far enough and you hit its edge. And no level is one pattern copied over and over: each is split into districts that look and play differently (a huge pillared hall, a tight maze, an older wing with darker walls and lights that won't settle, a stretch where most of the lights are dead, an abandoned office floor of desks (not in the Lobby, the garage or Count On Me, which are empty), long parallel corridors, a closing-down bookstore of emptied wooden shelving with FOR SALE posters on the pillars, and in the Lobby, Lights Out and Run, a floor that's mostly holes: a grid of narrow walkways over square pits that go down further than you can see), walled off from each other except for a few doorways, most with a landmark to steer by: a tower of boxes, somebody's living room, a ring of chairs around a lantern. The way out goes through the pit floor and the closing-down bookstore when a level has them, so you see them. Somewhere on every level an old wooden staircase climbs up into a black hole in the ceiling. Doors are set into the walls that don't open onto anything. The offices have the things real offices have: light switches, thermostats, a red fire-alarm pull now and then, sprinkler heads and smoke detectors in the ceiling, wallpaper that shows its seams, and no two fluorescent tubes quite the same colour. In the rough parts, ceiling tiles are missing and water stains spread across the rest, and in the dark districts there's sometimes one lit room at the far end of a long black corridor. Step off a walkway in the pit floor and you fall; you come round back at your last checkpoint with the camcorder on the floor. Nothing points the way at first. Someone got out before you, though, and the trail they left gets harder to miss the closer you get. Fall through and you land in the next level. Only the camcorder comes down: it cracks against the floor and lies on its side, still recording, looking down the longest stretch of floor it can see. After a while, footsteps come up behind it, a shadow leans over the lens, and it's picked up from behind.

| Level | Space | Who lives there |
|---|---|---|
| Intro | **Route 9 Park**: a Saturday with Mom and Dad. Bounce (you can't help it on a bed; jump at the bottom for a big one), wade the foam pit, and find the gap behind the pads by the back wall | Mom, Dad, other kids |
| 0 | **The Lobby**: yellow wallpaper, damp carpet, humming lights | The Tenant, the Hound, the Grin, the Stilt |
| 1 | **Underground Parking**: rows of lettered concrete piers, a low ceiling full of sprinkler pipes, bare tubes, puddles that mirror every light, cars nobody came back for | Two Hounds, a Grin |
| 33 | **Count On Me**: an office somebody walked out of, just like the urbex video: an empty room, beige walls, dark carpet, the "Count On Me!" mural, and a door at each end of it onto an unlit corridor a metre wide that doglegs away from the room and back, much further than the building goes, with one stretch where the Lobby's yellow walls and humming light come through | The Tenant, a Grin, the Stilt |
| 2 | **Pipe Dreams**: narrow brick tunnels, rusted pipes, orange caged lights | The Tenant, a Hound, a Grin |
| 37 | **The Poolrooms**: cream tile and clear green water, round columns standing in the pools, raised walkways, sunlight falling through skylights in real shadowed beams, spiral stairs climbing up through round holes in the ceiling, tunnels half under the water. Splashing is loud | The Lifeguard |
| 62 | **The Playplace**: a dark hall filled with a sea of plastic balls you wade through, giant hourglass pillars, spiral tube slides coming down out of the ceiling | Grins, Partygoers |
| 4 | **Lights Out**: every fixture dead. Only the EXIT signs glow | The Tenant and four Grins |
| 9 | **The Suburbs**: open sky, rolling green hills, the same house over and over to the horizon. One of them has blue tape round its door | A Hound, the Stilt |
| 188 | **The Courtyard of Windows**: a hotel atrium twelve metres deep, a wall of windows, a lawn far below | ...you |
| Fun =) | **The Party**: orange and yellow rooms, a carpet covered in letters, balloon arches, a cake on every table. When it's somebody's birthday, get under a table | The Partygoers |
| ! | **Run For Your Life** | Everything |

### Route 9 Park

The trampoline park is a real place on a busy Saturday: a court of beds with blue pads and yellow corner caps, a foam pit, signs high on the walls, cubbies for your shoes, tables at the front. Mom and Dad sit at one of them; Dad's on his phone half the time, Mom keeps an eye on you. Other kids bounce all over the court. You can't help bouncing on a bed, and if you jump right at the bottom of a bounce you go a lot higher. Thirty bounces earns you a badge. One of the beds against the back wall has a pad that's come away from the wall.

### The suit

There's an empty yellow hazmat suit waiting at the bottom of the fall. Put it on. From then on you see your yellow sleeves and black gloves, the edge of the visor, and your breath fogging the glass, and you hear yourself breathing through the respirator.

### Clues on the walls

There are no painted arrows: every level is finite, and you have to find the way out yourself, but someone went this way before you. First there are footprints (not every set of them goes somewhere good). About a third of the way along, strips of blue tape start showing up at the turns, a tab sticking out the way to go. From halfway, an orange extension cord runs along the floor, all the way to the door. Most of the way there, someone has rearranged the letters on a wall to read THE END IS NEAR. Near the end the lights along the way out burn steady while the ones around them die, and lit green **EXIT** signs hang from the ceiling and point you in. The thin place hums, too, and the hum carries. The thin place itself is a door outlined in blue tape, with **EXIT** painted above it. Dead ends still say **NOT THIS WAY**. Everything else on the walls is people who didn't make it.

### Saving

The game autosaves every 30 seconds (you'll see SAVED at the top of the screen), whenever you read a note, and whenever you fall into a new level. CONTINUE puts you back exactly where you were (and, if you went back for Ray, with him where you left him or still on your back). Finishing the story clears the save. Tapes, badges, endings and best depths live in a separate `profile.ini` and are never cleared.

### Hiding

Lockers stand against the walls on every level. Get in one without being seen and whatever is hunting you loses you. If it watched you climb in, it knows. Out in the open, keeping to a dark stretch and crouching makes you very hard to spot.

### Ray

Ray fixes the lights at Route 9 Park. He went missing at the park years ago, the week he was supposed to fix the pads on the back wall. You won't see him on the way down. Only if you take the green EXIT at the very end do you drop into the level where he's lying hurt, calling for help. Get him up and help him along, his arm over your shoulders: you'll be slower, louder and tire faster. You can let go. You can leave him. He'll beg.

### Blood

On most levels something was dragged a few rooms and left against a wall: smears across the carpet, splatter where it turned, a pool where it stopped, and handprints sliding down the wall above it. Now and then there's a lone print by a dead end.

### Probably nothing

Every minute or two, when nothing is chasing you, something small happens. Footsteps behind you that keep your pace and stop when you stop (turn around and they're gone). The lights going out one fixture at a time, coming toward you. Somebody standing very still at the far end of the hall, gone when you get close or look away. Knocking from inside the wall. Once in a while, the tape glitches, and for two frames there's a face.

### Things caught mid-noclip

Chairs half inside walls, boxes sunk into the floor, a cooler drifting at head height, furniture upside down on the ceiling. Everything here fell through something once.

### Endings

Get out of the last level and you find three holes in a wall, scrawled over in marker: a blue one marked THIS WAY, a yellow one with question marks around it, and a green one that says EXIT :). Each one is a different ending, and none of them are what you think. Every ending is shot in-engine on the camcorder: coming back up through the gap at Route 9 Park at 3:14 in the morning, Mom, the house that might not be your house, the next Saturday at the park, and what stands by the back wall after closing.

### Lost tapes

Two VHS tapes are hidden on every Backrooms level, sixteen in all, away from the painted route. Look for a blinking red REC light on the floor. Each one plays a camcorder transcript from the Survey team, Ray, his daughter Lily and Unit 4, and together they explain what the yellow suit is. Tapes stay found across every playthrough, and you can rewatch them under **ARCHIVE** on the title screen.

### Survey badges

Sixteen badges, each with a pop-up when you earn it. Some are for story moments, some for skill (escape a level without getting caught, or in under three minutes), some for the trampoline park (bounce thirty times), and four are secret until you see the matching ending. **ARCHIVE** shows the full list, which endings you've seen, and a hint for each one you haven't.

### KEEP FALLING (endless)

See any ending and **KEEP FALLING** unlocks on the title screen. There's no trampoline park and no Ray: you just fall from one random level into the next, forever. Every depth is meaner than the last, with hunts that come sooner and more often, less almond water, darker halls and more things walking them. Get caught once and the run is over. Your best depth is saved.

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

The camcorder filter (on by default, toggle it in Options) makes it look like footage off a 2000s handycam: a 4:3 picture with black bars at the sides (switch to widescreen in Options), captured straight off the tape with square corners (no fake TV screen), a video camera's response instead of a film curve (bright tubes clip hard to white, blacks sit just above black the way consumer video does), colour a little washed and tinted by the auto white balance, the thin bright halos camcorder edge enhancement leaves on every edge, a little glow round the lights, colour noise in the shadows that gets worse as the camera's gain goes up in the dark, an autofocus that hunts now and then, the faint vertical smear a CCD sensor gets under a bright tube, interlace combing when you pan fast, the slow dark band that rolls up the frame when you film under fluorescent lights, and dust drifting through the light close to the lens. Furniture and the things that hunt you sit in their own soft shadow under the ceiling lights, and every sculpted model has fine surface relief (pores, grain, dents) that catches the light. Light bounces: it comes off the floor onto the ceiling, fills the corners of a lit room and leaks a few metres round corners and down corridors, worked out for every level when it's built. On high quality the walls, floors and ceilings are generated at twice the resolution, and people are shaped like people: a chest wider than it is deep, shoulders, shoulder blades, a waist, knees, calves, and eyes set back under proper lids. People and the things down there move like bodies: weight that sways over each foot as they walk, knees that give as the heel lands, forearms that lag the swing, a head that stays level while the body bobs, a forward lean and pumping arms when they run, slow breathing when they stand still (fast when something has you). Floors wear the way real ones do: lanes worn pale and flat down the middle of every corridor, heaviest along the way out, and old stains with dark tide lines. Somebody is holding it: it breathes (faster when they're scared or out of breath), dips and sways with each footstep, shakes when they run, trembles when something's near, rolls a little into turns and trails your look by a hair. You walk at a walking pace now, with real step lengths, and you take a moment to get going and to stop. The PLAY / SP / VCR TAPE overlay and the tape counter are recorded onto the picture. The date and time are burned into the bottom-right corner the way camcorders stamped them: OCT.31 1998, starting from 2:47 PM at the park (turn it off in Options → DATE STAMP). Knock the camera and the tape jumps: running makes the odd footfall tear a tracking band through the picture, a hard landing or a sudden fright makes the picture skip and lose its colour for a moment, and when it cracks against the floor at the start of a level it leaves a scratch on the tape, one thin sparkling line that fades to faint and stays.

Light comes from every fixture within about eight metres (up to twelve at once), and each one throws its light downward the way a ceiling troffer does, so walls get bright arcs under the lights and go dim between them. Carpet looks like carpet: up close you see tufts and single fibres, the pile is brushed one way here and another there (vacuum stripes, the paths people walk), so it gets paler or darker as you turn and goes velvety when you look down a long hall, and damp patches dry with a brown tide line and a grey-green bloom in the middle. Walls and ceiling tiles keep their grain when you stand right at them instead of going flat, and dirt gathers along the bottom of every wall. The camera meters whatever it's pointed at, so aiming it down a dead corridor makes the gain climb and swinging it into a lit room blows the picture out for a moment while the iris catches up, overshoots a little and settles. In the dark it slows its shutter, so moving things smear and bright things leave short trails. The tubes throw faint, soft lens ghosts mirrored through the middle of the picture. Every stretch of the tape is worn differently: on a bad one the top lines bend sideways, the colour fades in and out and dropouts flick across more often. Ceiling tiles are each their own board: some yellowed, the odd whiter replacement, and brown water-stain rings that stop dead at the metal grid; here and there a leak has run down a wall from the ceiling.

Level 0 is matched against real Backrooms photos: warm saturated yellow walls with a grey-blue chevron print you can see up close, tan-brown carpet, warm ceiling tiles, and a honey-oak rail at hip height round some rooms. The pit floor is a grid of square holes that nearly fill the floor, with 30 cm walkways between them; the insides drop into olive shadow just under a thin lit lip and go darker the further down you look. The Suburbs look like the footage: plain cream two-storey houses with grey-mauve roofs, white cross-framed windows and no doors at all, scattered at odd angles across olive rolling hills and leaning with the slope, under a deep blue sky. Route 9 Park looks like a real trampoline park: blue vinyl crash pads with an orange cap rail and charcoal painted block above, dark arcade carpet with neon confetti, an open black roof deck, other parents standing round the court and a dozen kids bouncing, each at their own height.

People have real materials now instead of one flat colour per part. Skin is even, with blood close under it at the cheeks, nose, ears, lips and knuckles, an oily sheen down the forehead and nose, pores up close, and light that comes back out of the shadow side warm and red. Eyes are open properly, with off-white wet whites and glossy brown irises that catch the lights. Hair has strands, lighter tips and a soft sheen. Clothes have a fine weave, lint and the pale rim cotton gets at a glance; jeans have diagonal twill and are worn pale on the thighs and knees. A T-shirt hangs straight down from the chest over the belt instead of ballooning, folded arms sit across the lower chest, and nobody holds up an empty hand for a phone that isn't there.

The trampolines are real springs now. Land on a bed and you sink 20 to 30 cm into it while it stretches, then it throws you back up; press SPACE to start bouncing and again at the bottom of a bounce for a big one, crouch to kill the bounce. The beds sit over a pit and visibly dent in a cone under whoever is on them, you and every kid on the court, and the kids ride the bed the same way: a short sink with their knees folding, then a long arc through the air, each at their own height. Loose things are physical: walk into a chair and it rolls away on its castors, run into a box and it skids, turns and bangs off the wall (loud enough for anything nearby to hear), and cans skitter. Every spoken line is voiced: Mom, Dad, Ray, Theo, you (a nine-year-old), the party things and the thing that sounds like Ray, 61 lines, plus 24 shouts and calls from the kids and parents at Route 9 Park, which you hear from wherever they are on the court. They play in sync with the subtitles: Mom's call comes over the phone, your thoughts are close and quiet, Ray calling from far off is muffled and comes from his side, and the things that aren't people come out slowed and dark.

The camera moves like a scared kid is holding it. Walking, it's careful: soft footfalls that settle, the camera tipped a little toward the floor to watch your footing, a slow drift left and right as you check the corners. Running, it's panic: a hard kick on every footfall, your body swinging side to side, the arm pumping the camera up and down, jerky hands, and when something is after you, every few seconds a look back over your shoulder. Jump or bounce and the camera lags your body like it's in your hand: it dips as you take off, floats and tilts at the top, and slams and wobbles when you land or sink into a trampoline. Two or three times on the way out of a level a wall closes off the corridor except for a hole at the bottom. Walk into it standing and you bump your head; crouch (CTRL) and you crawl through on your hands and knees, the camera down at the carpet, and you stay down till you're out the other side.

Between levels, the game cuts up top. The search goes on the same Saturday, getting later each time: Mom calling for you across the court at 3:40, the front desk on the PA at 4:30, the police at 6:15, Dad on his knees at the gap behind the pad at 7:40 ("Then why can I hear humming?"), Mom at home by the phone, the eleven o'clock news, Dad refusing to leave when they lock up, the TV still on at 2 AM, and the park's own security camera at 3:00 and 3:13. Every line is voiced; any key skips a shot. You can hear the camcorder itself now, the way its mic picks it up: tape hiss, the capstan motor's low whir, the faint 60 Hz buzz of the video heads, and the click, clunk and spin-up of the record button every time the camera is picked up. And you can hear yourself breathe: slow and quiet standing still, quick and hard when you run, and when you're scared it catches, stutters, and gets a whimper in it. Hiding, you hold it in.

The kids at Route 9 Park have children's bodies now, not shrunk adults: a head a sixth of their height, short legs, narrow shoulders, a short thin neck, a round tummy, and a child's face (a big smooth forehead, eyes nearly adult-sized so they look big, round rosy cheeks, a button nose, a small chin), in tees with shorts or leggings and the park's yellow grip socks. On the trampolines their knees fold as the bed takes them and their arms swing up through the flight, and a ponytail floats up at the top of a bounce. In a drop ceiling the lights are real recessed troffers: an opening in the T-bar grid with a white steel door frame, the lens set back up inside so you see its inner sides lit and, from an angle, not all of the lens; the grid itself stands a few millimetres proud of the tiles and lines up with the fixtures, and a light that's off is a grey plastic lens, not a black hole. Wall ends, corners and pillars have rounded corner bead that catches the light in a soft line. Every light at Route 9 Park works. The camera shakes like it's in a kid's hands: it's never still, there's a fine tremor on top of the drift and the breathing, and walking and running knock it about harder. When something comes for you, you get a second wind: full breath and slow to tire, so if you run flat out for the exit you make it. Cars in the garage are parked in clear bays instead of halfway into the piers, people in the cutscenes face who they're talking to, and the cutscene you see goes by the level you just left.

Forward renderer on OpenGL 3.3 with:

- Sculpted creatures and people (signed-distance-field sculpts meshed with Surface Nets), skinned to skeletons and animated procedurally on the GPU. People come in four outfits (tee and jeans, suit and tie, work jacket and cap, hazmat suit) with faces, hands, belts and shoes
- No light of your own: no flashlight, no lamp on the camera, no night vision. The dark is dark, and the only light down there is whatever the place still has. Where most of it has died, the odd failing tube still flickers along the way, each one in sight of the next
- Sunlight with its own orthographic shadow map and volumetric god rays (Poolrooms), caustics under sunlit water, screen-space reflections on the pools
- Shadow maps with PCF, GGX specular, subsurface wrap lighting on skin
- Volumetric fluorescent haze
- SSAO, baked per-light visibility for hundreds of flickering ceiling lights
- HDR bloom chain, ACES tonemapping and colour grade, FXAA
- Optional camcorder look: tape jitter, chroma bleed, scanlines, timestamp

Graphics presets (Low, Medium, High) are in Options. Low turns off shadows, SSAO and volumetrics and renders at 65% resolution for older integrated GPUs.

### Photo textures

You can swap any generated surface for a real scanned one. Put a picture named after the surface in a `textures` folder (next to where you run the game, or `~/.local/share/below-route-9/textures`) and it's used the next time a level is built. Names: `wallpaper`, `dark_wallpaper`, `carpet`, `dark_carpet`, `office_carpet`, `hotel_carpet`, `office_wall`, `ceiling_tiles`, `concrete`, `concrete_floor`, `concrete_ceiling`, `brick`, `tile`, `plaster`, `painted_block`, `vinyl`, `wood`, `parking_floor`, `corrugated` (`.jpg` or `.png`). One picture covers one 2 m tile, so pick seamless ones. A matching `<name>_height` (or `_disp`, `_displacement`) picture is used for the relief; without one the relief is guessed from the picture. Free CC0 sets from [Poly Haven](https://polyhaven.com/textures) and [ambientCG](https://ambientcg.com) work well: download the colour ("Color" / "diff") map, rename it, and drop it in.

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
- **`unzip` says "bad zipfile offset", or there's no `install.sh` after unzipping**: the download is corrupted. This usually happens when `wget -c` resumes onto an older zip with the same name. Delete the zip and the half-extracted folder (`rm -rf Below-Route-9 Below-Route-9-linux.zip`) and download it again without `-c`.
- **Low frame rate**: set Graphics to Medium or Low in Options.

## Roadmap

See [docs/DESIGN.md](docs/DESIGN.md) for the full plan and [docs/LORE.md](docs/LORE.md) for the story bible. Next up: hiding spots, audio tapes, the Hotel and the Mall, and AppImage/Flatpak releases.

## License

MIT. See [LICENSE](LICENSE). The 8x8 bitmap font is public domain ([dhepper/font8x8](https://github.com/dhepper/font8x8)). The camcorder, menu and title-card text uses **VCR OSD Mono** by Riciery Leal, a free font (`assets/fonts/`), baked into `src/title_font.h` by `tools/make_title_font.py`. The "Count On Me!" mural is lettered in **Yellowtail** by Astigmatic (Apache License 2.0, `assets/fonts/`) and baked into `src/mural_data.h` by `tools/make_mural.py`. Photo textures are read with [stb_image](https://github.com/nothings/stb) by Sean Barrett (public domain). The voices were generated with [Piper](https://github.com/rhasspy/piper) (MIT) using its LibriTTS voice, trained on the [LibriTTS corpus](http://www.openslr.org/60/) (CC BY 4.0, Zen et al., from LibriVox recordings); `tools/make_voices.py` lists every line, regenerates them and packs them into `src/voices_data.h`.
