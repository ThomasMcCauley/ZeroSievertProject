function chest_get_item_count_min(argument0) //gml_Script_chest_get_item_count_min
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return 0;
    var _value = _struct.item_min
    if is_string(_value)
    {
        switch _value
        {
            case "{skill_scrap_ammo}":
                _value = 5 * (global.sk_k[(62 << 0)])
                break
            case "{skill_scrap_food}":
                _value = 6 * (global.sk_k[(60 << 0)])
                break
            case "{skill_scrap_material}":
                _value = 5 * (global.sk_k[(59 << 0)])
                break
            case "{skill_random_item}":
                _value = 20 * (global.sk_k[(63 << 0)])
                break
            default:
                return 0;
        }

    }
    return _value;
}

