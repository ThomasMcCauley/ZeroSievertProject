function skill_get_specialization_skill(argument0, argument1) //gml_Script_skill_get_specialization_skill
{
    if (!is_string(argument0))
    {
        var _new_skill = skill_get_index(argument0)
        if (_new_skill == undefined)
            __uiError("Skill \"", argument0, "\" not recognised")
        argument0 = _new_skill
    }
    return global.sk_upgrade[argument0][argument1];
}

