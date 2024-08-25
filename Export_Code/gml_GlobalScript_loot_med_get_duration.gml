function loot_med_get_duration(argument0) //gml_Script_loot_med_get_duration
{
    return (item_med_get_duration(argument0.item) / (global.sk_k[(29 << 0)]));
}

