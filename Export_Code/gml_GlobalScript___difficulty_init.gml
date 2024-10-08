global.__difficulty_data = {}
global.__difficulty_preset_data = {}
global.__difficulty_array = []
global.__difficulty_sandbox = true
global.__difficulty_sandbox_values = {}
__difficulty_define_range("trade_sell_mult", 0.4, 0, 1, "sell multiplier", "Factor by which the value of an item is multiplied when selling it.\nExample: an item with a value of 100 Rubles will be bought for 100 and sold for 100 x Sell Multiplier")
__difficulty_define_range("loot_item_amount", 1.5, 0, 5, "items amount")
__difficulty_define_range("loot_amount_single_item", 1, 0, 5, "Amount of single item")
__difficulty_define_range("loot_weapon_dur_min", 60, 0, 100, "Minimun weapon durability")
__difficulty_define_range("loot_weapon_dur_max", 60, 0, 100, "maximun weapon durability")
__difficulty_define_toggle("loot_npc_drop_armor", true, "NPCS drop armor", "Unused. NPCs will always drop armor")
__difficulty_define_range("loot_npc_drop_ammo", 2, 0, 10, "NPC ammo amount")
__difficulty_define_range("trade_sell_mult", 0.4, 0, 1, "sell multiplier", "Factor by which the value of an item is multiplied when selling it.\nExample: an item with a value of 100 Rubles will be bought for 100 and sold for 100 x Sell Multiplier")
__difficulty_define_range("trade_item_amount", 3, 0, 5, "items amount", "Multiplier whereby all items sold by merchants are multiplied")
__difficulty_define_range("trade_trader_money", 3, 0, 5, "traders money", "Multiplication factor of the number of money a trader has.")
__difficulty_define_range("trade_price_weapon", 1, 0, 2, "price: weapon", "")
__difficulty_define_range("trade_price_armor", 1, 0, 2, "price: armor", "")
__difficulty_define_range("trade_price_backpack", 1, 0, 2, "price: backpack", "")
__difficulty_define_range("trade_price_ammo", 1, 0, 2, "price: ammo", "")
__difficulty_define_range("trade_price_medication", 1, 0, 2, "price: medication", "")
__difficulty_define_range("loot_item_amount", 1.5, 0, 5, "items amount", "Multiplication factor of the number of items contained in each container.")
__difficulty_define_range("loot_amount_single_item", 1, 0, 5, "Amount of single item", "Multiplication factor of the number of each individual item in a container.")
__difficulty_define_range("loot_weapon_dur_min", 60, 0, 100, "Minimun weapon durability", "")
__difficulty_define_range("loot_weapon_dur_max", 60, 0, 100, "maximun weapon durability", "")
__difficulty_define_toggle("loot_npc_drop_armor", true, "NPCS drop armor", "All NPCs will drop their armor. The durability of the armor depends on how many hits they took.")
__difficulty_define_range("loot_npc_drop_ammo", 2, 0, 10, "NPC ammo amount", "")
__difficulty_define_range("pro_player_health", 110, 40, 120, "character health", "")
__difficulty_define_range("pro_min_carry_weight", 15, 5, 30, "Minimum transportable weight", "")
__difficulty_define_range("pro_hunger_thirst_rate", 0.5, 0, 2, "hunger/thirst decay rate", "")
__difficulty_define_range("pro_reputation_multiplier", 2, 0, 4, "reputation multiplier", "Factor that will be multiplied to the reputation obtained at the end of each Hunt.")
__difficulty_define_range("pro_exp_multiplier", 2, 0, 4, "skill experience multiplier", "")
__difficulty_define_range("pro_quest_rep", 2, 0, 4, "reputation from quests", "")
__difficulty_define_range("pro_quest_money", 1, 0, 4, "roubles from quests", "")
__difficulty_define_range("pro_quest_item", 1, 0, 4, "items from quests", "")
__difficulty_define_range("pro_service_price", 0.3, 0, 2, "service price", "Factor that will be multiplied to the price of each service provided by NPCs in the bunker")
__difficulty_define_range("enemy_human_hp", 0.8, 0, 2, "human health", "")
__difficulty_define_range("enemy_human_damage", 0.75, 0, 2, "human damage dealt", "Note: this value is applied only to the damage received by the player.")
__difficulty_define_range("enemy_mutant_hp", 1, 0, 2, "mutant health", "")
__difficulty_define_range("enemy_mutant_damage", 0.75, 0, 2, "mutant damage dealt", "Note: this value is applied only to the damage received by the player.")
__difficulty_define_toggle("hardcore_lose_equipment", false, "lose equipment", "Upon death, you lose all the equipment you have worn.")
__difficulty_define_toggle("hardcore_lose_ammo", false, "lose ammo", "Upon death, you lose all the ammunition in your inventory.")
__difficulty_define_toggle("hardcore_lose_medication", false, "lose medication", "Upon death, you lose all the medication in your inventory.")
__difficulty_define_toggle("hardcore_lose_consumable", false, "lose consumable", "Upon death, you lose all the consumable items in your inventory.")
__difficulty_define_toggle("hardcore_lose_keys", false, "lose keys", "Upon death, you lose all the keys in your inventory.")
__difficulty_define_toggle("hardcore_lose_other", false, "lose other item", "Upon death, you lose all items that are not part of the categories above.")
__difficulty_define_toggle("hardcore_perma_death", false, "perma death", "Upon death, the save files related to the slot used will be deleted.\nNote: All crashes are not recognized as death, nevertheless the use of this setting is not recommended until the game is bug-free.")
__difficulty_define_range("pro_player_health", 110, 40, 120, "character health", "")
__difficulty_define_range("pro_min_carry_weight", 15, 5, 30, "Minimum transportable weight", "")
__difficulty_define_range("pro_hunger_thirst_rate", 0.5, 0, 2, "hunger/thirst decay rate", "")
__difficulty_define_range("pro_reputation_multiplier", 2, 0, 4, "reputation multiplier", "Factor that will be multiplied to the reputation obtained at the end of each Hunt.")
__difficulty_define_range("pro_exp_multiplier", 2, 0, 4, "skill experience multiplier", "")
__difficulty_define_range("pro_quest_rep", 2, 0, 4, "reputation from quests", "")
__difficulty_define_range("pro_quest_money", 1, 0, 4, "roubles from quests", "")
__difficulty_define_range("pro_quest_item", 1, 0, 4, "items from quests", "")
__difficulty_define_range("pro_service_price", 0.3, 0, 2, "service price", "Factor that will be multiplied to the price of each service provided by NPCs in the bunker")
__difficulty_init_rookie()
__difficulty_init_survivor()
__difficulty_init_hunter()
function __difficulty_define_range(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script___difficulty_define_range
{
    if (argument4 == undefined)
        argument4 = argument0
    if (argument5 == undefined)
        argument5 = ""
    array_push(global.__difficulty_array, argument0)
    variable_struct_set(global.__difficulty_data, argument0, 
    {
        __type: "range",
        __name: argument0,
        __default: argument1,
        __min: argument2,
        __max: argument3,
        __friendlyName: argument4,
        __description: argument5
    }
)
}

function __difficulty_define_toggle(argument0, argument1, argument2, argument3) //gml_Script___difficulty_define_toggle
{
    if (argument2 == undefined)
        argument2 = argument0
    if (argument3 == undefined)
        argument3 = ""
    array_push(global.__difficulty_array, argument0)
    variable_struct_set(global.__difficulty_data, argument0, 
    {
        __type: "toggle",
        __name: argument0,
        __default: argument1,
        __min: false,
        __max: true,
        __friendlyName: argument2,
        __description: argument3
    }
)
}

