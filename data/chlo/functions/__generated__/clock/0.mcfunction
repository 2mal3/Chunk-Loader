# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

schedule function chlo:__generated__/clock/0 1t
execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:hopper{CustomName:'{"color":"yellow","text":"Chunk Loader"}'} positioned ~ ~0.5 ~ run function chlo:__generated__/execute/1