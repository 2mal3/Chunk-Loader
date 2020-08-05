# Description: Give the player a chunk loader if he crafted it and check if the dificulty is peaceful
# Called from: advancement:craft_chunk_loader
# Datapack by 2mal3

# give chunk loader
clear @s minecraft:structure_block
loot give @s loot 2mal3:chlo/chunk_loader

# remove things
advancement revoke @s only 2mal3:chlo/craft_chunk_loader
recipe take @s 2mal3:chlo/chunk_loader
