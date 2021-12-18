import macros/log.mcm


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
              "tag": "{chunk_loader:1b,CustomModelData:3330201,EntityTag:{Tags:[\"chlo.placed\",\"chlo.chunk_loader\",\"chlo.loading\",\"global.ignore\"],Item:{id:\"minecraft:glow_item_frame\",Count:1b,tag:{CustomModelData:3330201}},Invulnerable:1b,Fixed:1b}}"
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


# Handle chunk loader destroying
clock 1t {
  execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:hopper{CustomName:'{"color":"yellow","text":"Chunk Loader"}'} positioned ~ ~0.5 ~ run {
    log ChunkLoader debug entity Destroyed

    playsound minecraft:item.trident.thunder block @a ~ ~ ~ 1 0.5
    particle minecraft:item minecraft:ender_eye ~ ~ ~ 0.3 0.5 0.3 0.1 16

    kill @e[type=minecraft:item,distance=..0.5,nbt={Item: {id: "minecraft:hopper", Count: 1b}}]
    execute if entity @p[gamemode=!creative] run loot spawn ~ ~ ~ loot chlo:chunk_loader
    forceload remove ~ ~
    kill @s
  }
}


# Main chunk loader loop
clock 10s {
  execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader,tag=chlo.loading] at @s if entity @p[distance=..16] run {
    # Ambient
    playsound minecraft:ambient.soul_sand_valley.mood block @a ~ ~ ~ 0.5 0.5
    # Particle
    particle minecraft:witch ~ ~0.1 ~ 0.2 0.4 0.2 0.05 32
  }
}

clock 20s {
  execute as @e[type=minecraft:glow_item_frame,tag=chlo.chunk_loader] at @s run {
    # Stop the chunk loading if the chunk loader rans out of ful and resums it if it gets something
    execute(if data block ~ ~ ~ Items.[{id:"minecraft:redstone"}]) {
      # Loads the chunk if the chunk loader was off before
      execute if entity @s[tag=!chlo.loading] run {
        log ChunkLoader debug entity <Resume chunk loading>
        tag @s add chlo.loading
        forceload add ~ ~
      }
      # Find the slot of the redstone to remove one
      scoreboard players set .Temp0 chlo.Data 0
      execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 0b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.0 chlo:reduce_count
      execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 1b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.1 chlo:reduce_count
      execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 2b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.2 chlo:reduce_count
      execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 3b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.3 chlo:reduce_count
      execute if score .Temp0 chlo.Data matches 0 if data block ~ ~ ~ Items.[{Slot: 4b, id: "minecraft:redstone"}] store success score .Temp0 chlo.Data run item modify block ~ ~ ~ container.4 chlo:reduce_count

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


# Core
dir core {
  function load {
    log ChunkLoader info server <Datapack reloaded>

    scoreboard objectives add chlo.Data dummy

    # Initializes the datapack at the first startup or new version
    execute unless score %Installed chlo.Data matches 1 run {
      log ChunkLoader info server <Datapack installed>
    
      scoreboard players set %Installed chlo.Data 1
      scoreboard objectives add chlo.Data dummy
      scoreboard objectives add 2mal3.DebugMode dummy
      # Set the version in format: xx.xx.xx
      scoreboard players set $Version chlo.Data 020000
      schedule 4s replace {
        tellraw @a [{"text":"Chunk Loader Datapack v2.0.0 by 2mal3 was installed!","color":"blue"}]
      }
    }
    execute if score %Installed chlo.Data matches 1 unless score $Version chlo.Data matches 020000 run {
      log ChunkLoader info server <Updated datapack>

      scoreboard players set $Version chlo.Data 020000
    }
  }

  advancement chlo {
    "display": {
      "title": "Chunk Loader v2.0.0",
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
    ## Warns the player if he uses a not supportet server software or minecraft version
    # Get data
    # Prepare variables
    scoreboard players set .Temp0 chlo.Data 0
    scoreboard players set .Temp1 chlo.Data 0
    # Finds out the version the player plays on
    execute store result score .Temp0 chlo.Data run data get entity @s DataVersion
    # Checks for specific Server software like Bukkit, Spigot or Paper
    execute store success score .Temp1 chlo.Data run data get entity @r "Bukkit.updateLevel"
    execute store success score .Temp1 chlo.Data run data get entity @r "Spigot.ticksLived"
    execute store success score .Temp1 chlo.Data run data get entity @r "Paper.SpawnReason"

    # Gives an error message for if something is wrong
    # Wrong version
    execute unless score .temp0 chlo.data matches 757.. run tellraw @s [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use the Minecraft version 1.17.x.","color":"gold"}]
    # Wrong server software
    execute if score .Temp1 chlo.Data matches 1.. run tellraw @s [{"text":"[","color":"gray"},{"text":"ChunkLoader","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This server software is not supported by the datapack, so errors may occur. Please use another server software for better stability.","color":"gold"}]
    # Texture pack
    tellraw @s {"translate":"Chunk Loader Resource Pack is no installed. Please select the resource pack to make the datapack work.", "color": "red"}

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
    scoreboard objectives remove chlo.Data
    scoreboard objectives remove 2mal3.DebugMode
    # Sends an uninstallation message to all players
    tellraw @a [{"text":"Chunk Loader Datapack v2.0.0 by 2mal3 was successfully uninstalled."}]
    # Disables the datapack
    datapack disable "file/Chunk-Loader-Datapack"
    datapack disable "file/Chunk-Loader-Datapack-v2.0.0"
    datapack disable "file/Chunk-Loader-Datapack-v2.0.0.zip"
  }
}
