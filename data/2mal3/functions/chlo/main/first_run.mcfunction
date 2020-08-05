# Description: The first run of the datapack
# Called from: main/reload
# Datapack by 2mal3

# send message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"Chunk Loader Datapack v.","color":"blue"},{"score":{"name":"$V1","objective":"chlo.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V2","objective":"chlo.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V3","objective":"chlo.data"},"color":"blue"},{"text":" by 2mal3 was installed!","color":"blue"}]

# set scoreboards
scoreboard players set $chlo.first_run chlo.data 1
scoreboard players set $chlo.messages chlo.data 1