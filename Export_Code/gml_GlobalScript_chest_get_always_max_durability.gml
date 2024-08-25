function chest_get_always_max_durability(argument0) //gml_Script_chest_get_always_max_durability
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return false;
    return _struct.max_durability;
}

