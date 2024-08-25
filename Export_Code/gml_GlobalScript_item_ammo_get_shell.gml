function item_ammo_get_shell(argument0) //gml_Script_item_ammo_get_shell
{
    if (!item_exists(argument0))
        return "no_item";
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "no_item";
    _struct = variable_struct_get(_struct, "ammo")
    if (!is_struct(_struct))
        return "no_item";
    return _struct.shell;
}

