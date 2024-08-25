function npc_dialogue_get_food_price() //gml_Script_npc_dialogue_get_food_price
{
    if (!player_exists_local())
        return 0;
    return floor((100 - player_get_local().energy) * global.refill_hunger_k);
}

