# Description: Ask if you want to uninstall
# Called from tag: 2mal3:chlo/uninstall
# Datapack by 2mal3

tellraw @s [{"text":"Do you really want to deinstall the Chunk Loader Datapack by 2mal3?","color":"red"},{"text":"\n"},{"text":"[No]","color":"dark_green","hoverEvent":{"action":"show_text","value":"*click*"},"clickEvent":{"action":"run_command","value":"/tellraw @s {\"text\":\"\n\nThank you!\"}"}},{"text":" "},{"text":"[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:chlo/core/uninstall/uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
