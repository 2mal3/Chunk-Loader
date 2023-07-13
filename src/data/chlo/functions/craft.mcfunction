
function ~/craft:
    advancement revoke @s only ~/

    clear @s minecraft:knowledge_book 1
    loot give @s loot chlo:chunk_loader


advancement ~/craft {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:recipe_crafted",
      "conditions": {
        "recipe_id": "chlo:chunk_loader"
      }
    }
  },
  "rewards": {
    "function": "chlo:craft/craft"
  }
}
