# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tag @s remove chlo.placed
particle minecraft:witch ~ ~0.1 ~ 0.2 0.4 0.2 0.01 32
playsound minecraft:block.respawn_anchor.charge block @a ~ ~ ~ 1 0.1
playsound minecraft:item.lodestone_compass.lock block @a ~ ~ ~ 1 0.1
setblock ~ ~ ~ minecraft:hopper{CustomName: '{"text":"Chunk Loader", "color": "yellow"}'}
forceload add ~ ~