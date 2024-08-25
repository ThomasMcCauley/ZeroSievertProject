function item_weapon_get_moddable(argument0) //gml_Script_item_weapon_get_moddable
{
    if (!(item_fits_category(argument0, "weapon")))
        return false;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return false;
    return _struct.moddable;
}

