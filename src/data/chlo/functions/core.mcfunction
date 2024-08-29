from 2mal3:log import log


## Load
function ~/load:
    scoreboard objectives add chlo.data dummy

    log "info" "server" "Loaded!"

    execute unless score %installed chlo.data matches 1 run function ~/install
    execute if score %installed chlo.data matches 1 unless score $version chlo.data matches ctx.meta.version run function ~/update

    # Loops
    schedule function chlo:loader/clock/tick 1t replace
    schedule function chlo:loader/clock/second 1s replace
    schedule function chlo:loader/clock/10_second 10s replace


function ~/load/update:
    execute if score $version chlo.data matches 30000:
        log "info" "server" "Updating to v3.0.1"
        scoreboard players set $version chlo.data 30001
    execute if score $version chlo.data matches 30001:
        log "info" "server" "Updating to v3.0.2"
        scoreboard players set $version chlo.data 30002


## Install
function ~/load/install:
    scoreboard players set %installed chlo.data 1

    # Add scoreboards
    scoreboard objectives add 2mal3.debug_mode dummy
    scoreboard objectives add chlo.data dummy
    # Default config
    scoreboard players set $sound chlo.data 1
    scoreboard players set $require_fuel chlo.data 1
    scoreboard players set $fuel_time chlo.data 20
    scoreboard players operation %fuel_time chlo.data = $fuel_time chlo.data
    # Set the version in format: xx.xx.xx
    scoreboard players set $version chlo.data ctx.meta.version

    # Sent installation message after 4 seconds
    schedule function ~/send_message 4s replace:
      tellraw @a:
          text: f"Installed {ctx.project_name} {ctx.project_version} from {ctx.project_author}!"
          color: "green"


## Uninstall
function ~/uninstall:
    scoreboard objectives remove chlo.data

    # Remove chunk loaders
    execute as @e[type=minecraft:block_display,tag=chlo.chunk_loader] at @s:
        forceload remove ~ ~
        setblock ~ ~ ~ minecraft:air
        kill @s

    # Stopp loops
    schedule clear chlo:loader/clock/tick
    schedule clear chlo:loader/clock/second
    schedule clear chlo:loader/clock/10_second

    tellraw @a:
        text: f"Uninstalled {ctx.project_name} {ctx.project_version} from {ctx.project_author}!"
        color: "green"

    project_file_name = ctx.project_name.replace(' ', '-')
    datapack disable f"file/{project_file_name}"
    datapack disable f"file/{project_file_name}.zip"
