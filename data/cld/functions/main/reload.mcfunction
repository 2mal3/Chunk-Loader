# Description: Preparation commands
# Called from: #reaload
# Datapck by 2mal3

# scoreboards
scoreboard objectives add info trigger

scoreboard objectives add cld.data dummy
scoreboard objectives add cld.crafted minecraft.crafted:minecraft.structure_block

scoreboard players set V1 cld.data 1
scoreboard players set V2 cld.data 0
scoreboard players set V3 cld.data 1

# Welcome message
tellraw @a ["",{"text":"[Server] The Chunk Loader Datapack v."},{"score":{"name":"V1","objective":"cld.data"}},{"text":"."},{"score":{"name":"V2","objective":"cld.data"}},{"text":"."},{"score":{"name":"V3","objective":"cld.data"}},{"text":" by 2mal3 was loaded!"}]

# test dificulty
execute store result score cld.difficulty cld.data run difficulty
execute if score cld.difficulty cld.data matches 0 run tellraw @a {"translate":"The Chunk Loader Datapack does't work in Peaceful Mode.","color":"red"}
