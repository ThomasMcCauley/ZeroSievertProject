function loot_get_value_per_unit(argument0) //gml_Script_loot_get_value_per_unit
{
    with (argument0)
    {
        var _value = item_get_value(item)
        _value *= (gml_Script_loot_get_durability(argument0) / 100)
        if item_weapon_get_moddable(item)
            _value += loot_mod_cont_get_value(mods)
        return _value;
    }
}

