# Description: if the chunkloader breaks
# Called from: main/tick
# Datapack by 2mal3

# remove forceload
forceload remove ~ ~

# send remove message
execute if score $chlo.messages chlo.data matches 1 run tellraw @p[tag=!global.ignore,tag=!global.ignore.gui] {"text":"This chunk is no longer loaded.","color":"yellow"}

# kill dropped stone item
kill @e[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:stone_bricks"}}]

# drop chunkloader
execute unless entity @p[gamemode=creative] run loot spawn ~ ~ ~ loot 2mal3:chlo/chunk_loader

# delete block for uninstall
setblock ~ ~ ~ minecraft:air

# kill @s
tp @s ~ -1000 ~
kill @s