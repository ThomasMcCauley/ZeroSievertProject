function item_get_scrap(argument0) //gml_Script_item_get_scrap
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "none";
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return "none";
    return _struct.scrap;
}

