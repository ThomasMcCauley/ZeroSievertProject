function loadout_get_name(argument0) //gml_Script_loadout_get_name
{
    var _struct = variable_struct_get(global.loadout_data, argument0)
    if (!is_struct(_struct))
        return "???";
    return _struct.name;
}

