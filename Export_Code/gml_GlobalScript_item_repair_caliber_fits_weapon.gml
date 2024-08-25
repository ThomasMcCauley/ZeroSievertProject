function item_repair_caliber_fits_weapon(argument0, argument1) //gml_Script_item_repair_caliber_fits_weapon
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "repair")
    if (!is_struct(_struct))
        return false;
    var _array = variable_struct_get(_struct, "caliber")
    if (!is_array(_array))
        return false;
    var _weapon_caliber = item_weapon_get_caliber(argument1)
    var _i = 0
    repeat array_length(_array)
    {
        if (_array[_i] == _weapon_caliber)
            return true;
        _i++
    }
    return false;
}

