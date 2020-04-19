# Description: uninstall
# Called from: cld:main/uninstall/uninstall_ask
# Datapck by 2mal3


# send remove message
tellraw @a ["",{"text":"[Server] The Chunk Loader Datapack v."},{"score":{"name":"V1","objective":"cld.data"}},{"text":"."},{"score":{"name":"V2","objective":"cld.data"}},{"text":"."},{"score":{"name":"V3","objective":"cld.data"}},{"text":" by 2mal3 was successfully uninstalled."}]

# remove scoreboards
scoreboard objectives remove cld.data
scoreboard objectives remove info
scoreboard objectives remove cld.crafted

# remove chunk Loader
execute as @e[type=minecraft:shulker,tag=cld.chunk_loader] at @s run function cld:remove
