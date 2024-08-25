function chest_get_close_sound(argument0) //gml_Script_chest_get_close_sound
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return -4;
    var _chest_sound = _struct.sound_type
    return asset_get_index(variable_struct_get(global.chest_sound_data, _chest_sound).close);
}

