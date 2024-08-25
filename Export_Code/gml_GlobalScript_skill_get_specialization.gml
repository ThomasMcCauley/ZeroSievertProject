function skill_get_specialization(argument0) //gml_Script_skill_get_specialization
{
    if is_string(argument0)
    {
        var _new_index = skill_get_index(argument0)
        if (_new_index == undefined)
            __uiError("Skill \"", argument0, "\" not recognised")
        argument0 = _new_index
    }
    var _upgrade_array = global.sk_upgrade[argument0]
    var _i = 0
    repeat array_length(_upgrade_array)
    {
        var _specialization_index = _upgrade_array[_i]
        if (global.sk_lvl[_specialization_index] >= 0)
            return _specialization_index;
        _i++
    }
    return argument0;
}

