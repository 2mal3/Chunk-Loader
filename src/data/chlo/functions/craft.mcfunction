
function ~/craft:
    advancement revoke @s only ./craft/unlock
    recipe take @s chlo:chunk_loader

    clear @s minecraft:knowledge_book 1
    loot give @s loot chlo:chunk_loader


advancement ~/unlock {
    "criteria": {
        "requirement": {
            "trigger": "minecraft:recipe_unlocked",
            "conditions": {
                "recipe": "chlo:chunk_loader"
            }
        }
    },
    "rewards": {
        "function": "chlo:craft/craft"
    }
}
