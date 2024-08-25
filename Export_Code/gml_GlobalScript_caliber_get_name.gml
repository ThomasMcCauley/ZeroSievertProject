function caliber_get_name(argument0) //gml_Script_caliber_get_name
{
    var _struct = variable_struct_get(global.caliber_data, argument0)
    if (!is_struct(_struct))
        return "not_ammo";
    return _struct.name;
}

