function item_ammo_get_caliber(argument0) //gml_Script_item_ammo_get_caliber
{
    if (!item_exists(argument0))
        return "not_ammo";
    if (!(item_fits_category(argument0, "ammo")))
        return "not_ammo";
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "not_ammo";
    _struct = variable_struct_get(_struct, "ammo")
    if (!is_struct(_struct))
        return "not_ammo";
    return _struct.caliber;
}

