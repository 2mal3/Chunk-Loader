# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed","color":"green"}]
scoreboard players set %Installed chlo.Data 1
scoreboard objectives add chlo.Data dummy
scoreboard objectives add 2mal3.DebugMode dummy
scoreboard players set $Version chlo.Data 020000
schedule function chlo:core/__generated__/schedule/0 4s replace