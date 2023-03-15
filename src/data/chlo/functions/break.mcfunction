
function ./clock:
    schedule function ./clock 1t replace

    execute as @e[type=minecraft:block_display,tag=chlo.chunk_loader] at @s unless block ~ ~ ~ minecraft:hopper{CustomName:'{"color":"yellow","text":"Chunk Loader"}'} run function ./destroy


function ./destroy:
    playsound minecraft:item.trident.thunder block @a ~0.5 ~0.5 ~0.5 0.5 0.5
    particle minecraft:item minecraft:ender_eye ~0.5 ~0.5 ~0.5 0.3 0.5 0.3 0.1 16

    kill @e[type=minecraft:item,distance=..0.5,nbt={Item: {id: "minecraft:hopper", Count: 1b}}]
    execute unless entity @p[gamemode=creative] run loot spawn ~0.5 ~0.5 ~0.5 loot chlo:chunk_loader

    setblock ~ ~ ~ minecraft:air
    kill @s
