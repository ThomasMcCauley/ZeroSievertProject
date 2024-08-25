function item_get_category(argument0) //gml_Script_item_get_category
{
    if (!item_exists(argument0))
        return "none";
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "none";
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return "none";
    return _struct.categoria;
}

