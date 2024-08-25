function item_med_get_hp(argument0) //gml_Script_item_med_get_hp
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "medicine")
    if (!is_struct(_struct))
        return 0;
    return _struct.hp;
}

