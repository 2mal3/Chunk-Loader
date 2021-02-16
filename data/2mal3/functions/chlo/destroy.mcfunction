# Description: Destroys the chunk loader
# Called from function: 2mal3:chlo/core/tick
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={chlo.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Chunk loader was destroyed!","color":"green"}]

# Summon the chunk loader item if the neares player is not in creative mode
execute if entity @p[gamemode=!creative] run loot spawn ~ ~ ~ loot 2mal3:chlo/chunk_loader

# Deletes the xp orbs
kill @e[type=minecraft:experience_orb,distance=..1]

# Replaces the spawner with air if it has not yet been destroyed
setblock ~ ~ ~ minecraft:air

# Unforcloads the chunk
forceload remove ~ ~

# Sends a destroying message when enabled
execute if score $chlo.messages chlo.data matches 1 run tellraw @p {"text":"This chunk is no longer loaded.","color":"yellow"}

# Deletes the item frame
kill @s