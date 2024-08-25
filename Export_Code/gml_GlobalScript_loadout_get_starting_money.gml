function loadout_get_starting_money(argument0) //gml_Script_loadout_get_starting_money
{
    var _struct = variable_struct_get(global.loadout_data, argument0)
    if (!is_struct(_struct))
        return 0;
    return _struct.starting_money;
}

