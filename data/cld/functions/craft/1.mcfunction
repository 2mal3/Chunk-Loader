# Description: if a player craft a chunkloader
# Called from: main/tick
# Datapck by 2mal3


execute store success score @s cld.data run recipe take @s cld:chunk_loader

execute if score @s cld.data matches 1 run function cld:craft/2


scoreboard players reset @s cld.data
scoreboard players reset @s cld.crafted
