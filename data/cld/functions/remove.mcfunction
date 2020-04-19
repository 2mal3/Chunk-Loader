# Description: if the chunkloader breaks
# Called from: main/tick
# Datapck by 2mal3

# remove forceload
forceload remove ~ ~

# send remove message
tellraw @p {"translate":"This chunk is no longer loaded.","color":"yellow"}

# drop chunkloader
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:shulker_spawn_egg",Count:1b,tag:{display:{Name:'{"text":"Chunk Loader","color":"gold"}'},EntityTag:{Silent:1b,PersistenceRequired:1b,NoAI:1b,AttachFace:0b,Color:15b,Tags:["cld.chunk_loader"]}}}}

# playsound
playsound minecraft:block.stone.break block @a ~ ~ ~ 10

# kill @s
tp @s ~ -1000 ~
kill @s
