function chest_is_drop(argument0) //gml_Script_chest_is_drop
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return false;
    return _struct.is_drop;
}

