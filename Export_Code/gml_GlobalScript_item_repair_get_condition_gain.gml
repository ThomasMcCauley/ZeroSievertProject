function item_repair_get_condition_gain(argument0) //gml_Script_item_repair_get_condition_gain
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "repair")
    if (!is_struct(_struct))
        return 0;
    var _value = _struct.condition_gain
    switch _value
    {
        case "{weapon low}":
            _value = 35
            break
        case "{weapon high}":
            _value = 12
            break
        case "{armor low}":
            _value = 30
            break
        case "{armor high}":
            _value = 15
            break
    }

    return _value;
}

