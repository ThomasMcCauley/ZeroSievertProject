function skill_can_specialize(argument0) //gml_Script_skill_can_specialize
{
    return ((!skill_is_specialized(argument0)) && skill_get_specialization_count(argument0) > 0 && skill_get_level(argument0) >= skill_get_max_level(argument0));
}

