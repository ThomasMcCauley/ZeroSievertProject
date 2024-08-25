function item_base_upgrade_get_id(argument0) //gml_Script_item_base_upgrade_get_id
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "not_a_base";
    _struct = variable_struct_get(_struct, "base_upgrade")
    if (!is_struct(_struct))
        return "not_a_base";
    return _struct.id;
}

