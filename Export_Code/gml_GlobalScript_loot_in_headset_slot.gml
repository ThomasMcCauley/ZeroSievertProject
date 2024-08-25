function loot_in_headset_slot(argument0) //gml_Script_loot_in_headset_slot
{
    if (!is_struct(argument0))
        return false;
    if is_undefined(variable_struct_get(argument0, "placement"))
        return false;
    else
        return argument0.placement == "headset slot";
}

