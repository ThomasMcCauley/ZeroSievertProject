function from_precisione_to_offset(argument0) //gml_Script_from_precisione_to_offset
{
    var _acc = clamp(argument0, 0, 100)
    var _offset = (100 - _acc) / 2
    return _offset;
}

