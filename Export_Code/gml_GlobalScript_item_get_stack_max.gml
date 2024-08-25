function item_get_stack_max(argument0) //gml_Script_item_get_stack_max
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 1;
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return 1;
    return _struct.stack_max;
}

