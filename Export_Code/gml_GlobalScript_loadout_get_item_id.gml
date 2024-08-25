function loadout_get_item_id(argument0, argument1) //gml_Script_loadout_get_item_id
{
    var _struct = variable_struct_get(global.loadout_data, argument0)
    if (!is_struct(_struct))
        return "no_item";
    var _array = variable_struct_get(_struct, "items")
    if (!is_array(_array))
        return 0;
    if (argument1 < 0)
        return 0;
    if (argument1 >= array_length(_array))
        return 0;
    return _array[argument1].id;
}

