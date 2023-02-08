import ../macros/log.mcm


# Crafting
recipe chunk_loader {
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "#i#",
    "iEi",
    "#i#"
  ],
  "key": {
    "#": {
      "item": "minecraft:crying_obsidian"
    },
    "i": {
      "item": "minecraft:iron_ingot"
    },
    "E": {
      "item": "minecraft:ender_eye"
    }
  },
  "result": {
    "item": "minecraft:knowledge_book",
    "count": 1
  }
}

advancement craft {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:recipe_unlocked",
      "conditions": {
        "recipe": "chlo:chunk_loader"
      }
    }
  },
  "rewards": {
    "function": "chlo:craft",
    "loot": [
      "chlo:chunk_loader"
    ]
  }
}

loot chunk_loader {
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:glow_item_frame",
          "functions": [
            {
              "function": "minecraft:set_name",
              "name": {
                "text": "Chunk Loader",
                "color": "yellow",
                "italic": false
              }
            },
            {
              "function": "minecraft:set_nbt",
              "tag": "{chunk_loader:1b,CustomModelData:3330201,EntityTag:{Tags:[\"chlo.placed\",\"chlo.chunk_loader\",\"chlo.loading\",\"global.ignore\",\"smithed.block\"],Item:{id:\"minecraft:glow_item_frame\",Count:1b,tag:{CustomModelData:3330201}},Invulnerable:1b,Fixed:1b}}"
            }
          ]
        }
      ]
    }
  ]
}

function craft {
  log ChunkLoader debug entity <Crafted chunk loader>

  clear @s minecraft:knowledge_book
  advancement revoke @s only chlo:craft
  stopsound @s * minecraft:entity.item.pickup
  recipe take @s chlo:chunk_loader
}


# Chunk loader placing
advancement place {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:item_used_on_block",
      "conditions": {
        "item": {
          "items": [
            "minecraft:glow_item_frame"
          ],
          "nbt": "{chunk_loader:1b}"
        }
      }
    }
  },
  "rewards": {
    "function": "chlo:place"
  }
}

function place {
  advancement revoke @s only chlo:place
  log ChunkLoader debug entity <Placed chunk loader>

  stopsound @s * entity.glow_item_frame.place
  execute as @e[type=minecraft:glow_item_frame,tag=chlo.placed,sort=nearest,limit=1] at @s run {
    tag @s remove chlo.placed

    particle minecraft:witch ~ ~0.1 ~ 0.2 0.4 0.2 0.01 32
    playsound minecraft:block.respawn_anchor.charge block @a ~ ~ ~ 1 0.1
    playsound minecraft:item.lodestone_compass.lock block @a ~ ~ ~ 1 0.1

    setblock ~ ~ ~ minecraft:hopper{CustomName: '{"text":"Chunk Loader", "color": "yellow"}'}
    forceload add ~ ~
  }
}

dir loops {
  # Handle chunk loader destroying
  clock 1t {
    name tick
    execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:hopper{CustomName:'{"color":"yellow","text":"Chunk Loader"}'} positioned ~ ~0.5 ~ run {
      log ChunkLoader debug entity Destroyed

      playsound minecraft:item.trident.thunder block @a ~ ~ ~ 1 0.5
      particle minecraft:item minecraft:ender_eye ~ ~ ~ 0.3 0.5 0.3 0.1 16

      kill @e[type=minecraft:item,distance=..0.5,nbt={Item: {id: "minecraft:hopper", Count: 1b}}]
      execute as @p if entity @s[gamemode=!creative] run loot spawn ~ ~ ~ loot chlo:chunk_loader
      forceload remove ~ ~
      kill @s
    }
  }


  # Main chunk loader loop
  clock 10s {
    name 10_second

    execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader,tag=chlo.loading] at @s if entity @p[distance=..16] run {
      # Ambient
      execute if score $sound chlo.data matches 1 run playsound minecraft:ambient.soul_sand_valley.mood block @a ~ ~ ~ 0.5 0.5
      # Particle
      particle minecraft:witch ~ ~0.1 ~ 0.2 0.4 0.2 0.05 32
    }
  }

  clock 1s {
    name second

    execute if score $requireFuel chlo.data matches 1 run {
      execute if score %fuelTime chlo.data matches 1.. run scoreboard players remove %fuelTime chlo.data 1
      execute if score %fuelTime chlo.data matches 0 run {
        scoreboard players operation %fuelTime chlo.data = $fuelTime chlo.data

        # Stop the chunk loading if the chunk loader runs out of ful and resumes it if it gets something
        execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s run {
          execute(if data block ~ ~ ~ Items[{id:"minecraft:redstone"}]) {
            # Loads the chunk if the chunk loader was off before
            execute if entity @s[tag=!chlo.loading] run {
              log ChunkLoader debug entity <Resume chunk loading>
              tag @s add chlo.loading
              forceload add ~ ~
            }
            # Find the slot of the redstone to remove one
            scoreboard players set .temp0 chlo.data 0
            execute if score .temp0 chlo.data matches 0 if data block ~ ~ ~ Items[{Slot: 0b, id: "minecraft:redstone"}] store success score .temp0 chlo.data run item modify block ~ ~ ~ container.0 chlo:reduce_count
            execute if score .temp0 chlo.data matches 0 if data block ~ ~ ~ Items[{Slot: 1b, id: "minecraft:redstone"}] store success score .temp0 chlo.data run item modify block ~ ~ ~ container.1 chlo:reduce_count
            execute if score .temp0 chlo.data matches 0 if data block ~ ~ ~ Items[{Slot: 2b, id: "minecraft:redstone"}] store success score .temp0 chlo.data run item modify block ~ ~ ~ container.2 chlo:reduce_count
            execute if score .temp0 chlo.data matches 0 if data block ~ ~ ~ Items[{Slot: 3b, id: "minecraft:redstone"}] store success score .temp0 chlo.data run item modify block ~ ~ ~ container.3 chlo:reduce_count
            execute if score .temp0 chlo.data matches 0 if data block ~ ~ ~ Items[{Slot: 4b, id: "minecraft:redstone"}] store success score .temp0 chlo.data run item modify block ~ ~ ~ container.4 chlo:reduce_count

          } else {
            # Stops the chunk loading if the chunk loader was on before
            execute if entity @s[tag=chlo.loading] run {
              log ChunkLoader debug entity <Stop chunk loading>

              tag @s remove chlo.loading
              forceload remove ~ ~
            }
          }
        }
      }
    }
  }
}

modifier reduce_count   {
  "function": "minecraft:set_count",
  "count": -1,
  "add": true
}



# Core
dir core {
  function load {
    log ChunkLoader info server <Datapack reloaded>

    scoreboard objectives add chlo.data dummy

    # Initializes the datapack at the first startup or new version
    execute unless score %installed chlo.data matches 1 run {
      name install
      log ChunkLoader info server <Datapack installed>

      scoreboard players set %installed chlo.data 1
      scoreboard objectives add chlo.data dummy
      scoreboard objectives add 2mal3.debugMode dummy
      scoreboard players set $requireFuel chlo.data 1
      scoreboard players set $sound chlo.data 1
      scoreboard players set $fuelTime chlo.data 20
      scoreboard players operation %fuelTime chlo.data = $fuelTime chlo.data
      # Set the version in format: xx.xx.xx
      scoreboard players set $version chlo.data 020200
      schedule 4s replace {
        tellraw @a [{"text":"Chunk Loader v2.2.0 by 2mal3 was installed!","color":"green"}]
      }
    }
    execute if score %installed chlo.data matches 1 unless score $version chlo.data matches 020200 run {
      log ChunkLoader info server <Update datapack ...>

      # v2.1.0
      execute if score $Version chlo.Data matches 020000 run {
        log ChunkLoader info server <Updated from v2.0.0 to v2.1.0>
        scoreboard objectives remove chlo.Data
        scoreboard objectives remove 2mal3.DebugMode
        scoreboard players set $requireFuel chlo.data 1
        scoreboard players set $version chlo.data 020100
        function chlo:core/install
      }

      # v2.1.1
      execute if score $version chlo.data matches 020100 {
        log ChunkLoader info server <Updated from v2.1.0 to v2.1.1>
        scoreboard players set $version chlo.data 020101
      }

      # 2.1.2
      execute if score $version chlo.data matches 020101 {
        log ChunkLoader info server <Updated from v2.1.1 to v2.1.2>
        scoreboard players set $version chlo.data 020102
      }

      # 2.1.3
      execute if score $version chlo.data matches 020102 {
        log ChunkLoader info server <Updated from v2.1.2 to v2.1.3>
        scoreboard players set $version chlo.data 020103
      }

      # 2.2.0
      execute if score $version chlo.data matches 020200 {
        log ChunkLoader info server <Updated from v2.1.3 to v2.2.0>
        scoreboard players set $version chlo.data 020200

        scoreboard players set $sound chlo.data 1
        scoreboard players set $fuelTime chlo.data 20
        scoreboard players operation %fuelTime chlo.data = $fuelTime chlo.data
      }
    }
  }

  advancement chlo {
    "display": {
      "title": "Chunk Loader v2.2.0",
      "description": "Adds a chunk loader to the game that allows you to permanently load chunks!",
      "icon": {
        "item": "minecraft:structure_block"
      },
      "announce_to_chat": false,
      "show_toast": false
    },
    "parent": "global:2mal3",
    "criteria": {
      "trigger": {
        "trigger": "minecraft:tick"
      }
    }
  }

  function first_join {
    ## Warns the player if he uses a not supported minecraft version
    execute store result score .temp0 chlo.data run data get entity @s DataVersion
    execute unless score .temp0 chlo.data matches 2975..3120 run tellraw @s [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use the 1.18 or a later one to prevent errors.","color":"gold"}]

  }

  advancement first_join {
    "criteria": {
        "requirement": {
            "trigger": "minecraft:tick"
        }
    },
    "rewards": {
        "function": "chlo:core/first_join"
    }
  }

  function uninstall {
    log ChunkLoader info server <Datapack uninstalled>
    # Remove all loaded chunk loaders
    execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s run {
      forceload remove ~ ~
      setblock ~ ~ ~ minecraft:air
      kill @s
    }
    # Deletes the scoreboards
    scoreboard objectives remove chlo.data
    # Sends an uninstallation message to all players
    tellraw @a [{"text":"Chunk Loader v2.2.0 by 2mal3 was successfully uninstalled.","color": "green"}]
    # Disables the datapack
    datapack disable "file/Chunk-Loader"
    datapack disable "file/Chunk-Loader.zip"
  }
}
