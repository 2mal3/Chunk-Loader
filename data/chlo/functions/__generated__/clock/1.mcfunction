# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

schedule function chlo:__generated__/clock/1 10s
execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader,tag=chlo.loading] at @s if entity @p[distance=..16] run function chlo:__generated__/execute/3