function scr_level_up_skill(argument0, argument1) //gml_Script_scr_level_up_skill
{
    var sid = argument0
    var amount = argument1
    if (sid == (0 << 0) || sid == (8 << 0) || sid == (4 << 0) || sid == (12 << 0))
    {
        amount *= global.sk_k[(49 << 0)]
        amount *= gml_Script_difficulty_get("pro_exp_multiplier")
    }
    var _destroy = false
    if (global.sk_base[sid] == true)
    {
        var specializzata = false
        for (var i = 0; i < array_length_2d(global.sk_upgrade, sid); i++)
        {
            var get_spec_skill = global.sk_upgrade[sid][i]
            if (global.sk_lvl[get_spec_skill] >= 0)
            {
                specializzata = true
                global.sk_lvl[get_spec_skill] += amount
                _destroy = true
                if (floor(global.sk_lvl[get_spec_skill]) > global.sk_last_level[get_spec_skill])
                {
                    global.sk_last_level[get_spec_skill] = floor(global.sk_lvl[get_spec_skill])
                    var get_skill_name = language_get_string(string(global.sk_name[get_spec_skill]))
                    var get_skill_lvl = string(floor(global.sk_lvl[get_spec_skill]))
                    audio_play_sound(snd_level_up, 20, false)
                    var _text = language_get_string("Level up skill")
                    _text = string_replace(_text, "[SKILL_NAME]", get_skill_name)
                    _text = string_replace(_text, "[SKILL_LEVEL]", get_skill_lvl)
                    scr_draw_text_with_box(_text, false)
                }
            }
        }
        if (specializzata == false)
        {
            if (global.sk_lvl[sid] < global.sk_lvl_max[sid])
            {
                global.sk_lvl[sid] += amount
                _destroy = true
                if (floor(global.sk_lvl[sid]) > global.sk_last_level[sid])
                {
                    global.sk_last_level[sid] = floor(global.sk_lvl[sid])
                    get_skill_name = language_get_string(string(global.sk_name[sid]))
                    get_skill_lvl = string(floor(global.sk_lvl[sid]))
                    audio_play_sound(snd_level_up, 20, false)
                    _text = language_get_string("Level up skill")
                    _text = string_replace(_text, "[SKILL_NAME]", get_skill_name)
                    _text = string_replace(_text, "[SKILL_LEVEL]", get_skill_lvl)
                    scr_draw_text_with_box(_text, false)
                }
            }
        }
    }
    return _destroy;
}

