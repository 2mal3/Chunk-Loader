# Description: Give the player a chunk loader if he crafted it and check if the dificulty is peaceful
# Called from: advancement:craft_chunk_loader
# Datapack by 2mal3

# give chunk loader
clear @s minecraft:structure_block
loot give @s loot cld:chunk_loader

# remove things
advancement revoke @s only cld:craft_chunk_loader
recipe take @s cld:chunk_loader