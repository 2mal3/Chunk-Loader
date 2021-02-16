# Description: Initializes the chunk loader
# Called from function: 2mal3:chlo/place/find
# Datapack by 2mal3

# Sets an empty spawner as a replacement for a block
setblock ~ ~ ~ spawner{SpawnCount:0,SpawnRange:0,MaxNearbyEntities:0,RequiredPlayerRange:0,SpawnData:{id:"minecraft:area_effect_cloud"}} replace

# Forcloads the chunk
forceload add ~ ~

# Sends a placement message when enabled
execute if score $chlo.messages chlo.data matches 1 run tellraw @p {"text":"This chunk is now loaded.","color":"yellow"}

# Saves that the chunk loader was initialized
tag @s remove chlo.not_placed