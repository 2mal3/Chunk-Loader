
function ./place:
    advancement revoke @s only ./place

    execute as @e[type=minecraft:marker,tag=chlo.init] at @s run function chlo:place/setup


function ./setup:
    playsound minecraft:block.stone.place block @a ~ ~ ~

    setblock ~ ~ ~ minecraft:hopper[enabled=false]
    # Seems like MC-260857 althrought it should be fixed; I can't use a simple summon
    raw execute positioned ~-0.51 ~ ~-0.51 summon minecraft:block_display run data merge entity @s {interpolation_start:-1,interpolation_duration:0,Tags:["chlo.chunk_loader"],transformation:{scale:[1.02f,1.02f,1.02f]},block_state:{Name:"minecraft:structure_block",Properties:{mode:"data"}}}

    kill @s

advancement ./place {
    "criteria": {
        "requirement": {
            "trigger": "minecraft:item_used_on_block",
            "conditions": {
                "item": {
                    "items": [
                        "minecraft:dolphin_spawn_egg"
                    ],
                    "nbt": "{chunk_loader:1b}"
                }
            }
        }
    },
    "rewards": {
        "function": "chlo:place/place"
    }
}
