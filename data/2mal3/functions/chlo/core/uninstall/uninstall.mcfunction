# Description: Uninstall the datapack
# Called from function: 2mal3:chlo/core/uninstall/uninstall_ask
# Datapack by 2mal3

# Sends to all players that the datapack has been uninstalled
tellraw @a [{"text":"Chunk Loader Datapack v1.1.8 by 2mal3 was successfully uninstalled."}]

# Deletes all scoreboards
scoreboard objectives remove chlo.data
scoreboard objectives remove chlo.debug_mode

# Destroys all placed chunk loaders
execute as @e[type=minecraft:armor_stand,tag=chlo.chunk_loader] at @s run function 2mal3:chlo/remove
# Deletes all the chunk loader from the inventory
clear @a armor_stand{CustomModelData:333008}

# Stops the datapack loop
schedule clear 2mal3:chlo/core/tick

# Disables the datapack
datapack disable "file/Chunk-Loader-Datapack"
datapack disable "file/Chunk-Loader-Datapack.zip"
