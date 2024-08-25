function keybind_start(argument0) //gml_Script_keybind_start
{
    scr_draw_text_with_box("Waiting for input...")
    with (obj_main_menu)
    {
        keybind_active = true
        keybind_target = argument0
    }
}

