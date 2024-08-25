function item_weapon_can_fire(argument0, argument1) //gml_Script_item_weapon_can_fire
{
    if (!item_exists(argument0))
        return false;
    if (!item_weapon_get_moddable(argument0))
        return true;
    var _i = 0
    repeat array_length(global.mod_pos_data_array)
    {
        var _mod_pos = global.mod_pos_data_array[_i]
        if item_weapon_pos_get_needed(argument0, _mod_pos)
        {
            if (!(loot_mod_cont_exists(argument1, _mod_pos)))
                return false;
        }
        _i++
    }
    return true;
}

