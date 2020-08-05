# Description: uninstall
# Called from: chlo:main/uninstall/uninstall_ask
# Datapack by 2mal3


# send remove message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Server] The Chunk Loader Datapack v."},{"score":{"name":"$V1","objective":"chlo.data"}},{"text":"."},{"score":{"name":"$V2","objective":"chlo.data"}},{"text":"."},{"score":{"name":"$V3","objective":"chlo.data"}},{"text":" by 2mal3 was successfully uninstalled."}]

# remove scoreboards
scoreboard objectives remove chlo.data

# remove all chunk loaders
execute as @e[type=minecraft:armor_stand,tag=chlo.chunk_loader] at @s run function 2mal3:chlo/remove
clear @a armor_stand{CustomModelData:333008}

# disable datapack tick
schedule clear 2mal3:chlo/main/tick

# disable datapack
datapack disable "file/Chunk-Loader-Datapack"
datapack disable "file/Chunk-Loader-Datapack.zip"
