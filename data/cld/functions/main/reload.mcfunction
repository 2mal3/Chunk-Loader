# Description: Init the datapack
# Called from: #reaload
# Datapack by 2mal3

# scoreboards
scoreboard objectives add cld.data dummy

# store version X.XX.XX
scoreboard players set $V1 cld.data 1
scoreboard players set $V2 cld.data 1
scoreboard players set $V3 cld.data 7
scoreboard players set $cld.version cld.data 10107

# send first run meassage at the first datapack run
execute unless score $cld.first_run cld.data matches 1 run schedule function cld:main/first_run 4s

# start main tick
function cld:main/tick


# Configurable messages for place and destroy chunk loader.
# Better Chunk Loader block.
# Better uninstall (Uninstalling will disable the datapack and remove almost all chunk loaders from the world.).
# Improved performance.
# Bug fixes.
# Better compatibility with other datapacks.
# Removed translation because it's not used.