function item_weapon_get_damage_glance_flat(argument0) //gml_Script_item_weapon_get_damage_glance_flat
{
    if (!(item_fits_category(argument0, "weapon")))
        return undefined;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return undefined;
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return undefined;
    var _value = variable_struct_get(_struct, "damage_glance_flat")
    if (_value == undefined)
        trace_error("Item \"", argument0, "\" has no .damage_glance_flat data")
    if (_value == "{use_weapon_type}")
    {
        var _type = item_weapon_get_type(argument0)
        _value = glance_get_damage_glance_flat(_type)
    }
    return _value;
}

