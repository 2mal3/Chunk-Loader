# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector": "@s","color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Destroyed","color":"aqua"}]
playsound minecraft:item.trident.thunder block @a ~ ~ ~ 1 0.5
particle minecraft:item minecraft:ender_eye ~ ~ ~ 0.3 0.5 0.3 0.1 16
kill @e[type=minecraft:item,distance=..0.5,nbt={Item: {id: "minecraft:hopper", Count: 1b}}]
execute if entity @p[gamemode=!creative] run loot spawn ~ ~ ~ loot chlo:chunk_loader
forceload remove ~ ~
kill @s