function item_weapon_get_ammo(argument0) //gml_Script_item_weapon_get_ammo
{
    if (!(item_fits_category(argument0, "weapon")))
        return "no_item";
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "no_item";
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return "no_item";
    return _struct.ammo;
}

