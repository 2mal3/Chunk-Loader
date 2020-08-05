# Description: if a chunk loader is placed
# Called from: main/tick
# Datapack by 2mal3

# load the chunk
forceload add ~ ~ ~ ~

# send message
execute if score $chlo.messages chlo.data matches 1 run tellraw @p[tag=!global.ignore,tag=!global.ignore.gui] {"text":"This chunk is now loaded.","color":"yellow"}

# set block with model
setblock ~ ~ ~ minecraft:stone_bricks
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["chlo.chunk_loader","global.ignore"],ArmorItems:[{},{},{},{id:"minecraft:armor_stand",Count:1b,tag:{CustomModelData:333008}}]}


# remove summon entity
kill @s