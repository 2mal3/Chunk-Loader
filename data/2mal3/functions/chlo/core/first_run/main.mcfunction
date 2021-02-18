# Description:  Initializes the datapack at the first startup
# Called from function: 2mal3:chlo/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={chlo.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed!","color":"green"}]

# Add scoreboards
scoreboard objectives add chlo.data dummy
scoreboard objectives add chlo.debug_mode dummy

# Set version variable in format xx.xx.xx
scoreboard players set $chlo.version chlo.data 010200

# Sets the startup configuration
scoreboard players set $chlo.messages chlo.data 1

# Sends a message that the datapack has been installed  after 4 seconds
schedule function 2mal3:chlo/core/first_run/send_message 4s

# Saves that the datapack was installed
scoreboard players set $chlo.first_run chlo.data 1