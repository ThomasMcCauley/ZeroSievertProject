function npc_generate_name(argument0) //gml_Script_npc_generate_name
{
    var _name = npc_get_name(argument0)
    if (string_pos("{", _name) > 0)
    {
        _name = string_replace_all(_name, "{bandit}", (scr_generation_name(false) + " " + scr_generation_name(true)))
        _name = string_replace_all(_name, "{english}", (scr_generation_name_eng(false) + " " + scr_generation_name_eng(true)))
    }
    return _name;
}

