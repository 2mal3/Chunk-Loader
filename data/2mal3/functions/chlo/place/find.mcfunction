# Description: Finds not yet initialized chunk loaders after one has been placed
# Called from advancements: 2mal3:chlo/placed_chunk_loader
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={chlo.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Player ","color":"green"},{"selector":"@s","color":"gray"},{"text":" placed a chunk loader.","color":"green"}]

# Resets the advancement
advancement revoke @s only 2mal3:chlo/place_chunk_loader

# Find the chunk loader
execute as @e[type=item_frame,tag=chlo.chunk_loader,tag=chlo.not_placed] at @s run function 2mal3:chlo/place/place
