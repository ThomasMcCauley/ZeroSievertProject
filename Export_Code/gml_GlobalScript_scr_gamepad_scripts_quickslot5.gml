function scr_gamepad_scripts_quickslot5() //gml_Script_scr_gamepad_scripts_quickslot5
{
    with (player_get_local())
    {
        gml_Script_inventory_use_quick_slot("quick slot 5")
        global.last_quick_slot_pressed = "quick slot 5"
    }
}

