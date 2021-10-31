# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

advancement revoke @s only chlo:place
tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector": "@s","color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Placed chunk loader","color":"aqua"}]
stopsound @s * entity.glow_item_frame.place
execute as @e[type=minecraft:glow_item_frame,tag=chlo.placed,sort=nearest,limit=1] at @s run function chlo:__generated__/execute/0