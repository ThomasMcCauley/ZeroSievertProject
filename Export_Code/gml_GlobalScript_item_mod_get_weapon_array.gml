function item_mod_get_weapon_array(argument0) //gml_Script_item_mod_get_weapon_array
{
    if (!item_exists(argument0))
        return [];
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return [];
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return [];
    if _struct.weapon_all
        return ["all weapons"];
    return _struct.weapon_id;
}

