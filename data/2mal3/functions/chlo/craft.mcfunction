# Description: Give the player a chunk loader if he crafted it and check if the dificulty is peaceful
# Called from advancement: craft_chunk_loader
# Datapack by 2mal3

# Give the player the chunk loader
clear @s minecraft:structure_block 1
loot give @s loot 2mal3:chlo/chunk_loader
clear @s minecraft:structure_block 0

# Resets the crafting system
advancement revoke @s only 2mal3:chlo/craft_chunk_loader
recipe take @s 2mal3:chlo/chunk_loader
