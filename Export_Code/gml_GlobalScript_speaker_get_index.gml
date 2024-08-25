function speaker_get_index(argument0) //gml_Script_speaker_get_index
{
    var _struct = variable_struct_get(global.speaker_data, argument0)
    if (!is_struct(_struct))
        return "no_speaker";
    return _struct.index;
}

