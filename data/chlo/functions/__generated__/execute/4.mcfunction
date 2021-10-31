# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

scoreboard players set #execute chlo.Data 0
execute if data block ~ ~ ~ Items.[{id:"minecraft:redstone"}] run function chlo:__generated__/conditional/0
execute if score #execute chlo.Data matches 0 run function chlo:__generated__/conditional/1