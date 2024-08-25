function base_uninstall(argument0) //gml_Script_base_uninstall
{
    if (!is_in_hub())
        return;
    if (!base_get_occupied(argument0))
    {
        scr_draw_text_with_box("You can only uninstall modules in the bunker")
        return false;
    }
    var _module = base_get_module(argument0)
    if (_module == (2 << 0))
    {
        scr_draw_text_with_box("Storage module cannot be uninstalled")
        return false;
    }
    global.base_lvl[_module] = 0
    global.sl_free[argument0] = 0
    global.sl_base_id[argument0] = -1
    obj_base_parent.alarm[0] = 1
    return true;
}

