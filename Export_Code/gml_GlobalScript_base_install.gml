function base_install(argument0, argument1, argument2) //gml_Script_base_install
{
    if (argument2 == undefined)
        argument2 = true
    if (!is_in_hub())
    {
        scr_draw_text_with_box("You can only install modules in the bunker")
        return false;
    }
    var _slot = base_find_slot(argument0)
    if (_slot != undefined)
    {
        if argument2
            scr_draw_text_with_box("Already installed!")
        return false;
    }
    global.sl_free[argument1] = 2
    global.sl_base_id[argument1] = argument0
    scr_save_skill_and_base()
    return true;
}

