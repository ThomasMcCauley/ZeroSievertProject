function chest_get_decay_items(argument0) //gml_Script_chest_get_decay_items
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return false;
    return _struct.decay_items;
}

