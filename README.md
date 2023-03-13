# Chunk Loader

![GitHub release (latest by date)](https://img.shields.io/github/v/release/2mal3/Chunk-Loader?style=flat-square) ![GitHub all releases](https://img.shields.io/github/downloads/2mal3/Chunk-Loader/total?style=flat-square) ![Minecraft](https://img.shields.io/badge/Minecraft-1.19-orange?style=flat-square)

> The resourcepack needed for the datapack is the same file as the datapack. You have to move the downloaded file into the Datapack **and** into the Resourcepack folder.

With Chunk Loader Datapack the Chunk Loader is added to the game. With it - surprise - you can permanently load chunks.
This means that you can be anywhere in the world, while the chunk in which the Chunk Loader is placed is still loaded.

In order for the Chunk Loader to load the chunk, it needs 3 Redstone Dust per minute. To fill, simply right-click and place it inside. As soon as there is no more Redstone dust inside, the chunk loader stops working and the chunk will be unloaded until new Redstone dust is added.

### Crafting recipe

![Crafting Picture](https://github.com/2mal3/Chunk-Loader-Datapack/blob/master/images/crafting.jpg)

### Settings

- deactivate fuel consumption: `/scoreboard players set $requireFuel chlo.data 0`.
- deactivate ambient sound: `/scoreboard players set $sound chlo.data 0`.
- change fuel consumption speed: `/scoreboard players set $fuelTime chlo.data <time in seconds>`.

## Chunk loading

Because of technical reasons, the Chunk Loader loads the chunks as the following. (every box is a chunk)
| .   | .   | .   |.    | .   |
| --- | --- | --- | --- | --- |
| .   | TI  | TI  | TI  | .   |
| .   | TI  | ET  | TI  | .   |
| .   | TI  | TI  | TI  | .   |
| .   | .   | .   | .   | .   |

- `.`: Not loaded, but mobs count for the mob cap
- `TI`: Normal except plant growth, mob spawning and mob ticking (movement)
- `ET`: Normal except plant growth and mob spawning

_Additional info: https://gist.github.com/Drovolon/24bfaae00d57e7a8ca64b792e14fa7c6_

## Technical Notes

- the Chunk Loader can also be obtained with the command `/loot give @s loot chlo:chunk_loader`
- works in Vanilla and Fabric in 1.19.x in Single and Multiplayer
- not tested with Forge, Bukkti, Spigot and PaperSpigot but probably don't work
- compatible with other datapacks except Unlock all recipes datapacks and datapacks that forceload many chunks themselves
- bug reports and suggestions are best done on [GitHub](https://github.com/2mal3/Chunk-Loader-Datapack/issues)
- to uninstall run the command `/function chlo:core/uninstall`
- datapack was created with [mc-build](https://github.com/mc-build/mc-build)

_v1.1.1_
