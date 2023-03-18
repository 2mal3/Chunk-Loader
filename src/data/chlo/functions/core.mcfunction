
## Load
function ./load:
    scoreboard objectives add chlo.data dummy

    execute unless score %installed chlo.data matches 1 run function ./install
    execute if score %installed chlo.data matches 1 unless score $version chlo.data matches ctx.meta.version run function ./update

    # Loops
    schedule function chlo:loader/clock/tick 1t replace
    schedule function chlo:loader/clock/second 1s replace
    schedule function chlo:loader/clock/10_second 10s replace


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
    # Default config
    scoreboard players set $sound chlo.data 1
    scoreboard players set $require_fuel chlo.data 1
    scoreboard players set $fuel_time chlo.data 20
    scoreboard players operation %fuel_time chlo.data = $fuel_time chlo.data

    # Sent installation message after 4 seconds
    schedule function ./send_message 4s replace:
        tellraw @a:
            text: f"Installed {ctx.project_name} {ctx.project_version} from {ctx.project_author}!"
            color: "green"


## First Join
function ./first_join:
    # Check for installed resourcepack
    tellraw @s {
        "translate": "The Chunk Loader Resource Pack is not installed. I t's highly recommended that you use it.",
        "color": "red",
        "with": [{
            "text": "The Chunk Loader Resourcepack is enabled",
            "color": "green"
        }]
    }

    # Incompatible Minecraft version
    execute store result score .temp_0 chlo.data run data get entity @s DataVersion
    execute unless score .temp_0 chlo.data matches 3337..:
        tellraw @s [
            {"text": "[", "color": "gray"},
            {"text": f"{ctx.project_name}", "color": "red", "bold": true},
            {"text": "]: ", "color": "gray"},
            {
                "text": "You are using the incorrect Minecraft version. Please check the website.",
                "color": "red",
                "bold": true
            }
        ]

advancement ./first_join {
    "criteria": {
        "requirement": {
            "trigger": "minecraft:tick"
        }
    },
    "rewards": {
        "function": "chlo:core/first_join"
    }
}


## Uninstall
function ./uninstall:
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

    datapack disable "file/Chunk-Loader"
    datapack disable "file/Chunk-Loader.zip"
