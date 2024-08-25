function loot_is_traders(argument0) //gml_Script_loot_is_traders
{
    if (!is_struct(argument0))
        return false;
    if is_undefined(variable_struct_get(argument0, "placement"))
        return false;
    if ui_is_trading()
    {
        if (argument0.placement == "buy inventory")
            return true;
        if (argument0.placement == "other inventory")
            return true;
    }
    return false;
}

