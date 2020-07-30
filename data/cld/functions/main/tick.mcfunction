# Description: Main datapack tick
# Called from: main/reload, main/tick
# Datapack by 2mal3

# place
execute as @e[type=minecraft:armor_stand,tag=cld.place] at @s run function cld:place

# Remove
execute as @e[type=minecraft:armor_stand,tag=cld.chunk_loader] at @s unless block ~ ~ ~ minecraft:stone_bricks run function cld:remove


# tick
schedule function cld:main/tick 5t
