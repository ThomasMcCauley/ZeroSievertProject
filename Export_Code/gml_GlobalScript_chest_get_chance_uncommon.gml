function chest_get_chance_uncommon(argument0) //gml_Script_chest_get_chance_uncommon
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return 0;
    return _struct.chance_uncommon;
}

