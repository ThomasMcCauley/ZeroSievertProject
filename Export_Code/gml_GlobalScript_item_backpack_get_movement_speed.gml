function item_backpack_get_movement_speed(argument0) //gml_Script_item_backpack_get_movement_speed
{
    if (!item_exists(argument0))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "backpack")
    if (!is_struct(_struct))
        return 0;
    return _struct.movement_speed;
}

