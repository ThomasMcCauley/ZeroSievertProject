function skill_get_specialization_count(argument0) //gml_Script_skill_get_specialization_count
{
    if is_string(argument0)
    {
        var _new_index = skill_get_index(argument0)
        if (_new_index == undefined)
            __uiError("Skill \"", argument0, "\" not recognised")
        argument0 = _new_index
    }
    if (argument0 >= array_length(global.sk_upgrade) || (!is_array(global.sk_upgrade[argument0])))
        return 0;
    return array_length(global.sk_upgrade[argument0]);
}

