function loadout_get_item_count(argument0) //gml_Script_loadout_get_item_count
{
    var _struct = variable_struct_get(global.loadout_data, argument0)
    if (!is_struct(_struct))
        return 0;
    var _array = variable_struct_get(_struct, "items")
    if (!is_array(_array))
        return 0;
    return array_length(_array);
}

