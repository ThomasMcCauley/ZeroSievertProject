function item_med_get_can_move(argument0) //gml_Script_item_med_get_can_move
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return true;
    _struct = variable_struct_get(_struct, "medicine")
    if (!is_struct(_struct))
        return true;
    return _struct.can_move;
}

