function loot_mod_get_weapon_string(argument0) //gml_Script_loot_mod_get_weapon_string
{
    if loot_mod_get_weapon_all(argument0)
        return "all weapons";
    var _string = ""
    var _compatibility_array = item_mod_get_weapon_array(argument0.item)
    var _count = array_length(_compatibility_array)
    var _i = 0
    repeat _count
    {
        _string += item_get_name(_compatibility_array[_i])
        if (_i < (_count - 1))
            _string += ", "
        _i++
    }
    return _string;
}

