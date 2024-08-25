function item_consumable_get_energy(argument0) //gml_Script_item_consumable_get_energy
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "consumable")
    if (!is_struct(_struct))
        return 0;
    return _struct.energy;
}

