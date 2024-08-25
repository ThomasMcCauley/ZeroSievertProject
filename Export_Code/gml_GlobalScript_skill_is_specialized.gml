function skill_is_specialized(argument0) //gml_Script_skill_is_specialized
{
    if is_string(argument0)
    {
        var _new_index = skill_get_index(argument0)
        if (_new_index == undefined)
            __uiError("Skill \"", argument0, "\" not recognised")
        argument0 = _new_index
    }
    if (argument0 >= array_length(global.sk_upgrade))
        return false;
    var _upgrade_array = global.sk_upgrade[argument0]
    if (!is_array(_upgrade_array))
        return false;
    var _i = 0
    repeat array_length(_upgrade_array)
    {
        var _specialization_index = _upgrade_array[_i]
        if (global.sk_lvl[_specialization_index] >= 0)
            return true;
        _i++
    }
    return false;
}

