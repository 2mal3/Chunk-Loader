# Description: if a chunk loader is placed
# Called from: main/tick
# Datapck by 2mal3

# load the chunk
forceload add ~ ~ ~ ~

# send message
tellraw @p {"translate":"This chunk is now loaded.","color":"yellow"}

# sound
playsound minecraft:block.stone.place block @a ~ ~ ~ 10

# other
tag @s add cld.placed
