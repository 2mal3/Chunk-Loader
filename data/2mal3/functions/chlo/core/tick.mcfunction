# Description: The datapack loop every tick
# Called from function: 2mal3:chlo/core/reload, 2mal3:chlo/core/tick
# Datapack by 2mal3

# Finds destroyed chunk loaders and deletes them
execute as @e[type=minecraft:item_frame,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:spawner run function 2mal3:chlo/destroy

# Calls the function again in the next tick
schedule function 2mal3:chlo/core/tick 1t