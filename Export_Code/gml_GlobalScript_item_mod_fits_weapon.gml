function item_mod_fits_weapon(argument0, argument1) //gml_Script_item_mod_fits_weapon
{
    if (!(item_fits_category(argument0, "w_mod")))
        return false;
    if (!(item_fits_category(argument1, "weapon")))
        return false;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        trace_error("Item \"", argument0, "\" not recognised")
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return false;
    if _struct.weapon_all
    {
        if (item_mod_get_type(argument0) == "scope")
        {
            if item_weapon_pos_get_moddable(argument1, "scope")
                return true;
            else
                return false;
        }
    }
    if _struct.weapon_all
        return true;
    var _array = _struct.weapon_id
    var _i = 0
    repeat array_length(_array)
    {
        if (_array[_i] == argument1)
            return true;
        _i++
    }
    return false;
}

