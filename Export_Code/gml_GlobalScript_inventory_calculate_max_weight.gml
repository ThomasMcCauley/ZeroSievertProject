function inventory_calculate_max_weight(argument0) //gml_Script_inventory_calculate_max_weight
{
    return clamp((gml_Script_difficulty_get("pro_min_carry_weight") + item_backpack_get_weight(argument0) + (global.sk_k[(1 << 0)]) + (global.injector_factor[(6 << 0)])), 0, 9999);
}

