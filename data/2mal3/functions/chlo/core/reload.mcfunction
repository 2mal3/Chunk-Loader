# Description: Init the datapack
# Called from tag: load:load
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={chlo.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Reloaded datapack!","color":"green"}]

# Initializes the datapack at the first startup
execute unless score $chlo.first_run chlo.data matches 1 run function 2mal3:chlo/core/first_run/main

# Starts the datapack loop
function 2mal3:chlo/core/tick