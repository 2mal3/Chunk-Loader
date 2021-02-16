# Description: Datapack loop every 5 ticks
# Called from functions: 2mal3:chlo/core/reload, 2mal3:chlo/core/tick
# Datapack by 2mal3

# place
execute as @e[type=minecraft:armor_stand,tag=chlo.place] at @s run function 2mal3:chlo/place

# Remove
execute as @e[type=minecraft:armor_stand,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:stone_bricks run function 2mal3:chlo/remove


# tick
schedule function 2mal3:chlo/core/tick 5t
