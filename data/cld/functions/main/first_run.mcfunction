# Description: The first run of the datapack
# Called from: main/reload
# Datapack by 2mal3

# send message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Server] The Chunk Loader Datapack v.","color":"blue"},{"score":{"name":"$V1","objective":"cld.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V2","objective":"cld.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V3","objective":"cld.data"},"color":"blue"},{"text":" by 2mal3 was installed!","color":"blue"}]

# set scoreboards
scoreboard players set $cld.first_run cld.data 1
scoreboard players set $cld.messages cld.data 1