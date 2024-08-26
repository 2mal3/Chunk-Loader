from 2mal3:log import log


function ~/place:
    advancement revoke @s only ~/
    log "debug" "@s" "Placed chunk loader"

    execute as @e[type=minecraft:block_display,tag=chlo.init] at @s run function ./place/setup


function ~/setup:
    playsound minecraft:block.stone.place block @a ~ ~ ~

    setblock ~ ~ ~ hopper{CustomName: '{"color":"yellow","text":"Chunk Loader"}'} replace
    tag @s remove chlo.init


advancement ~/place {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:item_used_on_block",
      "conditions": {
        "location": [
          {
            "condition": "minecraft:match_tool",
            "predicate": {
              "components": {
                  "minecraft:custom_data": "{chunk_loader: 1b}"
              }
            }
          }
        ]
      }
    }
  },
  "rewards": {
    "function": "chlo:place/place"
  }
}
