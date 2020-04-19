# Description: if a player craft a chunkloader
# Called from: craft/1
# Datapck by 2mal3

clear @s minecraft:structure_block
give @s minecraft:shulker_spawn_egg{display:{Name:'{"text":"Chunk Loader","color":"gold"}'},EntityTag:{Silent:1b,PersistenceRequired:1b,NoAI:1b,AttachFace:0b,Color:15b,Tags:["cld.chunk_loader"]}} 1

# test dificulty
execute store result score cld.difficulty cld.data run difficulty
execute if score cld.difficulty cld.data matches 0 run tellraw @a {"translate":"The Chunk Loader Datapack does't work in Peaceful Mode.","color":"red"}
