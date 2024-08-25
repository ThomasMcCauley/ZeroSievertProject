function base_name_to_component(argument0) //gml_Script_base_name_to_component
{
    var _enum_index = ""
    switch argument0
    {
        case "not_a_base":
            _enum_index = (0 << 0)
            break
        case "med_station":
            _enum_index = (1 << 0)
            break
        case "storage":
            _enum_index = (2 << 0)
            break
        case "bed":
            _enum_index = (3 << 0)
            break
        case "radio_central":
            _enum_index = (4 << 0)
            break
        case "kitchen":
            _enum_index = (5 << 0)
            break
        case "recycling":
            _enum_index = (6 << 0)
            break
        case "gym":
            _enum_index = (7 << 0)
            break
        case "shooting_range":
            _enum_index = (8 << 0)
            break
        case "forge":
            _enum_index = (9 << 0)
            break
        case "scavenger":
            _enum_index = (10 << 0)
            break
        case "garden":
            _enum_index = (11 << 0)
            break
        case "ammo":
            _enum_index = (12 << 0)
            break
        case "workshop":
            _enum_index = (13 << 0)
            break
    }

    if (_enum_index == "")
        trace_error("Base id invalid. Probably a typo")
    return _enum_index;
}

