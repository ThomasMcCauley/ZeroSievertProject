function chest_get_name(argument0) //gml_Script_chest_get_name
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return "???";
    return _struct.name;
}

