# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

execute if entity @s[tag=!chlo.loading] run function chlo:__generated__/execute/5
scoreboard players set .Temp0 chlo.Data 0
execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 0b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.0 chlo:reduce_count
execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 1b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.1 chlo:reduce_count
execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 2b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.2 chlo:reduce_count
execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 3b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.3 chlo:reduce_count
execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 4b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.4 chlo:reduce_count
scoreboard players set #execute chlo.Data 1