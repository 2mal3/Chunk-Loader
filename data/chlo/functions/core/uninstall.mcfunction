# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled","color":"green"}]
execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s run function chlo:core/__generated__/execute/20
scoreboard objectives remove chlo.Data
scoreboard objectives remove 2mal3.DebugMode
tellraw @a [{"text":"Chunk Loader Datapack v2.0.0 by 2mal3 was successfully uninstalled."}]
datapack disable "file/Chunk-Loader-Datapack"
datapack disable "file/Chunk-Loader-Datapack-v2.0.0"
datapack disable "file/Chunk-Loader-Datapack-v2.0.0.zip"