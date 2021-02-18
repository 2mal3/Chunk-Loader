# Chunk Loader Datapack v.1.2.0

### WARNING: If you load too many chunks with this datapack it can come to lags.  

With Chunk Loader Datapack the Chunk Loader is added to the game. With it - surprise - you can load chunks.
Normally the chunks are not loaded anymore when you are out of sight of a player, but with Chunk Loader they are loaded no matter where you are in the world.

To make this datapack work you need the [resurcepack](https://github.com/2mal3/Chunk-Loader-Datapack/releases/latest/), so that the chunk loader is displayed correctly.

## Crafting recipe:                                                                                                  
![Crafting Picture](https://github.com/2mal3/core/blob/main/images/chunk-loader-datapack/crafting.png)

## Loaded things:
Unfortunately, for technical reasons, not all aspects of the game can be preserved in loaded chunks.                               
✔ Entity tick (Entities move, do things, die and so on)                               
❌Random block tick (Plants grow)                               
✔ Redstone (All redstone components)                               
❌ Mob spawning (Monsters and other creatures spawn)

## Compatibility:
✔ Singleplayer                              
✔ Multiplayer                               
✔ Vanilla 1.16+                             
✔ Fabric                                    
❔ Forge                                     
❔ PaperSpigot                               

## Commands:
- `/scoreboard players set $chlo.messages chlo.data 0`: Disables the messages when placing and destroying a chunk loader.
- `/scoreboard players set $chlo.messages chlo.data 1`: Enables the messages when placing and destroying a chunk loader.
- `/function #2mal3:chlo/debug`: Gives out information about the datapack and the world. Helpful by bug reports.
- `/function #2mal3:chlo/uninstall`: Uninstalls the datapack                                  

***