function item_mod_fits_position(argument0, argument1) //gml_Script_item_mod_fits_position
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        trace_error("Item \"", argument0, "\" not recognised")
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return false;
    var _array = _struct.position
    var _i = 0
    repeat array_length(_array)
    {
        if (_array[_i] == argument1)
            return true;
        _i++
    }
    return false;
}

