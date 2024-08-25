function chest_get_destroy_when_empty(argument0) //gml_Script_chest_get_destroy_when_empty
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return false;
    return _struct.destroy_when_empty;
}

