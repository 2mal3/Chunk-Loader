# Description: tick commands
# Called from: #tick
# Datapck by 2mal3


# craft
execute as @a[scores={cld.crafted=1..}] run function cld:craft/1

# place
execute as @e[type=minecraft:shulker,tag=cld.chunk_loader,tag=!cld.placed] at @s run function cld:place

# Remove
execute as @e[type=minecraft:shulker,tag=cld.chunk_loader,tag=cld.placed] at @s unless entity @s[nbt={Health:30f}] run function cld:remove
