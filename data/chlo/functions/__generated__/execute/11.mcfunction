# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector": "@s","color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Stop chunk loading","color":"aqua"}]
tag @s remove chlo.loading
forceload remove ~ ~