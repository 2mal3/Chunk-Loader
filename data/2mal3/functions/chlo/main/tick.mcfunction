# Description: Main datapack tick
# Called from: main/reload, main/tick
# Datapack by 2mal3

# place
execute as @e[type=minecraft:armor_stand,tag=chlo.place] at @s run function 2mal3:chlo/place

# Remove
execute as @e[type=minecraft:armor_stand,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:stone_bricks run function 2mal3:chlo/remove


# tick
schedule function 2mal3:chlo/main/tick 5t
