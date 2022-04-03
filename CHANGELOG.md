
## Update v2.1.2 (3.1.2022)

### Changed:
 - Compatible with 1.18.2
 - Better compatibility with other datapacks
 - Message colour set to green

### Fixed:
 - Player head in the datapack advancement was not displayed correctly

***

## Update v2.1.1 (2.2.2022)

### Fixed:
 - Redstone was not removed from the Chunk Loader
 - Datapack indicated itself as incompatible with 1.18.x
 - Chunk Loader has dropped itself when destroyed in creative mode
 - Redstone was taken out of every Chunk Loader slot every time

***

## Update v2.1.0 (18.12.2021)

### Added:
 - Option to disable the fuel consumption

### Changed:
 - Made compatible with the 1.18
 - [Internal] Better variable names

***

## Update v2.0.0 (31.10.2021)

Hey! I finally managed to release a new update, after almost half a year. This time I've added several sound and particle effects to the Chunk Loader, so it feels much more dynamic now. However, the biggest change is that the chunk loader now requires 3 Redstone Dust every minute. This is mainly to prevent people from placing a Chunk Loader somewhere in the world and then forgetting it, so the chunks are loaded but not used, which I experienced myself.

### Added:
 - Chunk Loaders need redstone dust to run
 - Placement, ambient and break particles
 - Placement, ambient and break sounds
 - Automatic test if the Resource Pack is loaded
 - Automatic test if the right Minecraft version and server software is used

### Changed:
 - New crafting recipe (see new pictures)
 - Now compatible with the 1.17
 - Resource Pack integrated into the datapack. Now the file is the Resource Pack and Datapack at the same time.
 - [Internal] Complete datapack switched to [mc-build](https://github.com/mc-build/mc-build)

### Fixed:
 - Item pick up sound at crafting

### Removed:
 - Notifications when a chunk loader is placed or destroyed
 - [Internal] Lantern Load library because it had no real use
