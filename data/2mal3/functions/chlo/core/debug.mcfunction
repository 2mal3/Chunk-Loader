# Description: Prints a debug report
# Called from tag: 2mal3:chlo/debug
# Datapack by 2mal3

# Temporarily saves important variables
execute store result score $chlo.temp_0 chlo.data run data get entity @s DataVersion
execute store result score $chlo.temp_1 chlo.data run datapack list
execute store result score $chlo.temp_2 chlo.data run execute if entity @a

# Prints the debug report
# minecraft version; datapack version; datapack count; first run; debug mode; player count; messages
tellraw @s [{"text":"Debug data: ","color":"gold"},{"score":{"name":"$chlo.temp_0","objective":"chlo.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$chlo.version","objective":"chlo.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$chlo.temp_1","objective":"chlo.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$chlo.first_run","objective":"chlo.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"@s","objective":"chlo.debug_mode"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$chlo.temp_2","objective":"chlo.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$chlo.messages","objective":"chlo.data"},"color":"red"}]