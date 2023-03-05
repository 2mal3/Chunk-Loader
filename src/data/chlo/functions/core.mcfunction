
## Load
function ./load:
    scoreboard objectives add chlo.data dummy

    execute unless score %installed chlo.data matches 1 run function ./install
    execute if score %installed chlo.data matches 1 unless score $version chlo.data matches ctx.meta.version run function ./update


function_tag minecraft:load:
    values:
        - "chlo:core/load"


## Install
function ./install:
    scoreboard players set %installed chlo.data 1

    # Add scoreboards
    scoreboard objectives add chlo.data dummy
    # Set the version in format: xx.xx.xx
    scoreboard players set $version chlo.data ctx.meta.version

    # Sent installation message after 4 seconds
    schedule function ./send_message 4s replace:
        tellraw @a:
            text: f"Installed {ctx.project_name} {ctx.project_version} from {ctx.project_author}!"
            color: "green"


## Uninstall
function ./uninstall:
    scoreboard objectives remove chlo.data

    tellraw @a:
        text: f"Uninstalled {ctx.project_name} {ctx.project_version} from {ctx.project_author}!"
        color: "green"

    datapack disable "file/Chunk-Loader"
    datapack disable "file/Chunk-Loader.zip"
