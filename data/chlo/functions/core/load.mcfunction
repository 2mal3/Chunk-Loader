# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded","color":"green"}]
scoreboard objectives add chlo.Data dummy
execute unless score %Installed chlo.Data matches 1 run function chlo:core/__generated__/execute/12
execute if score %Installed chlo.Data matches 1 unless score $Version chlo.Data matches 020000 run function chlo:core/__generated__/execute/13