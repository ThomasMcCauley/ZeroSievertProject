function skill_get_max_level(argument0) //gml_Script_skill_get_max_level
{
    if is_string(argument0)
    {
        var _new_index = skill_get_index(argument0)
        if (_new_index == undefined)
            __uiError("Skill \"", argument0, "\" not recognised")
        argument0 = _new_index
    }
    return global.sk_lvl_max[argument0];
}

