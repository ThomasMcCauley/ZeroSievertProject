function item_consumable_get_radiation(argument0) //gml_Script_item_consumable_get_radiation
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "consumable")
    if (!is_struct(_struct))
        return 0;
    return _struct.radiation;
}

