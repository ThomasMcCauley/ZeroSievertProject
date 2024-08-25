function item_base_upgrade_get_lvl_req(argument0) //gml_Script_item_base_upgrade_get_lvl_req
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 999;
    _struct = variable_struct_get(_struct, "base_upgrade")
    if (!is_struct(_struct))
        return 999;
    return _struct.lvl_req;
}

