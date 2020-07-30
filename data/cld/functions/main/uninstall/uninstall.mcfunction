# Description: uninstall
# Called from: cld:main/uninstall/uninstall_ask
# Datapack by 2mal3


# send remove message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Server] The Chunk Loader Datapack v."},{"score":{"name":"$V1","objective":"cld.data"}},{"text":"."},{"score":{"name":"$V2","objective":"cld.data"}},{"text":"."},{"score":{"name":"$V3","objective":"cld.data"}},{"text":" by 2mal3 was successfully uninstalled."}]

# remove scoreboards
scoreboard objectives remove cld.data

# remove all chunk loaders
execute as @e[type=minecraft:armor_stand,tag=cld.chunk_loader] at @s run function cld:remove
clear @a armor_stand{CustomModelData:333008}

# disable datapack tick
schedule clear cld:main/tick

# disable datapack
datapack disable "file/Chunk-Loader-Datapack"
datapack disable "file/Chunk-Loader-Datapack.zip"
