function item_repair_get_condition_max(argument0) //gml_Script_item_repair_get_condition_max
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 60;
    _struct = variable_struct_get(_struct, "repair")
    if (!is_struct(_struct))
        return 60;
    var _value = _struct.condition_max
    switch _value
    {
        case "{weapon low}":
            _value = 60
            break
        case "{weapon high}":
            _value = 100
            break
        case "{armor low}":
            _value = 60
            break
        case "{armor high}":
            _value = 100
            break
    }

    return _value;
}

