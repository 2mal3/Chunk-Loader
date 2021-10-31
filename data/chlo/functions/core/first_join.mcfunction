# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

scoreboard players set .Temp0 chlo.Data 0
scoreboard players set .Temp1 chlo.Data 0
execute store result score .Temp0 chlo.Data run data get entity @s DataVersion
execute store success score .Temp1 chlo.Data run data get entity @r "Bukkit.updateLevel"
execute store success score .Temp1 chlo.Data run data get entity @r "Spigot.ticksLived"
execute store success score .Temp1 chlo.Data run data get entity @r "Paper.SpawnReason"
execute unless score .Temp0 chlo.Data matches 2724..2730 run tellraw @s [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use the Minecraft version 1.17.x.","color":"gold"}]
execute if score .Temp1 chlo.Data matches 1.. run tellraw @s [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This server software is not supported by the datapack, so errors may occur. Please use another server software for better stability.","color":"gold"}]
tellraw @s {"translate":"Chunk Loader Resource Pack is no installed. Please select the resource pack to make the datapack work.", "color": "red"}