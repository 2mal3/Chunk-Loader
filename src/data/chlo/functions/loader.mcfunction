
# Clocks
function ./clock/tick:
    schedule function ./clock/tick 1t replace

    execute as @e[type=minecraft:block_display,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:hopper{CustomName:'{"color":"yellow","text":"Chunk Loader"}'} run function ./destroy


function ./clock/10_second:
    schedule function ./clock/10_second 10s replace

    # Ambient effects
    execute as @e[type=minecraft:block_display,tag=chlo.chunk_loader,tag=chlo.loading] at @s if entity @p[distance=..16] positioned ~0.5 ~ ~0.5 run function ./ambient


function ./clock/second:
    schedule function ./clock/second 1s replace

    execute if score $require_fuel chlo.data matches 1:
        scoreboard players remove %fuel_time chlo.data 1
        execute if score %fuel_time chlo.data matches ..0:
            scoreboard players operation %fuel_time chlo.data = $fuel_time chlo.data
            execute as @e[type=minecraft:block_display,tag=chlo.chunk_loader] at @s run function ./loader


# Loader
def item_slot(slot: int) -> str:
    return f"Items[{{Slot: {slot}b, id: 'minecraft:redstone'}}]"

function ./loader:
    # Check if any redstone is inside the chunk loader
    scoreboard players set .redstone chlo.data 0
    execute if data block ~ ~ ~ Items[{id:"minecraft:redstone"}]:
        for i in range(5):
            execute if score .redstone chlo.data matches 0 if data block ~ ~ ~ item_slot(i) store success score .redstone chlo.data:
                item modify block ~ ~ ~ f"container.{i}" ./reduce_count

    # Loads or unloads the chunk depending on the success of the above code
    execute if score .redstone chlo.data matches 1 if entity @s[tag=!chlo.loading]:
        tag @s add chlo.loading
        forceload add ~ ~
    execute if score .redstone chlo.data matches 0 if entity @s[tag=chlo.loading]:
        tag @s remove chlo.loading
        forceload remove ~ ~

item_modifier ./reduce_count {
    "function": "minecraft:set_count",
    "count": -1,
    "add": true
}


# Breaking
function ./destroy:
    playsound minecraft:item.trident.thunder block @a ~0.5 ~0.5 ~0.5 0.5 0.5
    particle minecraft:item minecraft:ender_eye ~0.5 ~0.5 ~0.5 0.3 0.5 0.3 0.1 16

    kill @e[type=minecraft:item,distance=..0.5,nbt={Item: {id: "minecraft:hopper", Count: 1b}}]
    execute unless entity @p[gamemode=creative] run loot spawn ~0.5 ~0.5 ~0.5 loot chlo:chunk_loader

    forceload remove ~ ~
    setblock ~ ~ ~ minecraft:air
    kill @s


# Ambient effects
function ./ambient:
    execute if score $sound chlo.data matches 1:
        playsound minecraft:ambient.soul_sand_valley.mood block @a ~ ~ ~ 0.5 0.5
    particle minecraft:witch ~ ~0.1 ~ 0.2 0.4 0.2 0.05 32
