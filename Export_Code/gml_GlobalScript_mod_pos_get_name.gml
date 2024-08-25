function mod_pos_get_name(argument0) //gml_Script_mod_pos_get_name
{
    var _struct = variable_struct_get(global.mod_pos_data, argument0)
    if (!is_struct(_struct))
        return "???";
    return _struct.name;
}

