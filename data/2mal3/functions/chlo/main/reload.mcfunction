# Description: Init the datapack
# Called from: #reaload
# Datapack by 2mal3

# scoreboards
scoreboard objectives add chlo.data dummy

# store version X.XX.XX
scoreboard players set $V1 chlo.data 1
scoreboard players set $V2 chlo.data 1
scoreboard players set $V3 chlo.data 8
scoreboard players set $chlo.version chlo.data 10108

# send first run meassage at the first datapack run
execute unless score $chlo.first_run chlo.data matches 1 run schedule function 2mal3:chlo/main/first_run 4s

# start main tick
function 2mal3:chlo/main/tick


# little better code
# bugfixes