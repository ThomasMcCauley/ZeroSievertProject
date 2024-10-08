function scr_load_key_bindings() //gml_Script_scr_load_key_bindings
{
    for (var i = 0; i <= (26 << 0); i++)
    {
        global.kb_hold[i] = false
        global.kb_pressed[i] = false
        global.kb_accept_mouse[i] = true
    }
    var a = (0 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 87
    global.kb_now[a] = 87
    global.kb_name[a] = "Move up"
    global.kb_accept_mouse[a] = false
    global.kb_press_type[a] = (0 << 0)
    a = (1 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 83
    global.kb_now[a] = 83
    global.kb_name[a] = "Move down"
    global.kb_accept_mouse[a] = false
    global.kb_press_type[a] = (0 << 0)
    a = (2 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 68
    global.kb_now[a] = 68
    global.kb_name[a] = "Move right"
    global.kb_accept_mouse[a] = false
    global.kb_press_type[a] = (0 << 0)
    a = (3 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 65
    global.kb_now[a] = 65
    global.kb_name[a] = "Move left"
    global.kb_accept_mouse[a] = false
    global.kb_press_type[a] = (0 << 0)
    a = (4 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 16
    global.kb_now[a] = 16
    global.kb_name[a] = "Run"
    global.kb_press_type[a] = (3 << 0)
    a = (5 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 9
    global.kb_now[a] = 9
    global.kb_name[a] = "Open/close inventory"
    global.kb_accept_mouse[a] = false
    global.kb_press_type[a] = (1 << 0)
    a = (6 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 70
    global.kb_now[a] = 70
    global.kb_name[a] = "Interact"
    global.kb_press_type[a] = (1 << 0)
    a = (7 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 82
    global.kb_now[a] = 82
    global.kb_name[a] = "Reload"
    global.kb_press_type[a] = (1 << 0)
    a = (8 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 84
    global.kb_now[a] = 84
    global.kb_name[a] = "Torch On/Off"
    global.kb_press_type[a] = (1 << 0)
    a = (9 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 76
    global.kb_now[a] = 76
    global.kb_name[a] = "Laser On/Off"
    global.kb_press_type[a] = (1 << 0)
    a = (14 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 78
    global.kb_now[a] = 76
    global.kb_name[a] = "Headset On/Off"
    global.kb_press_type[a] = (1 << 0)
    a = (10 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 74
    global.kb_now[a] = 74
    global.kb_name[a] = "Open device"
    global.kb_press_type[a] = (1 << 0)
    a = (11 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 77
    global.kb_now[a] = 77
    global.kb_name[a] = "Open map"
    global.kb_press_type[a] = (1 << 0)
    a = (12 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 71
    global.kb_now[a] = 71
    global.kb_name[a] = "Throw bolt"
    global.kb_press_type[a] = (1 << 0)
    a = (13 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 66
    global.kb_now[a] = 66
    global.kb_name[a] = "Switch auto/semi"
    global.kb_press_type[a] = (1 << 0)
    a = (23 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 89
    global.kb_now[a] = 89
    global.kb_name[a] = "Change ammo"
    global.kb_press_type[a] = (1 << 0)
    a = (24 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 75
    global.kb_now[a] = 75
    global.kb_name[a] = "Close-up of the weapon"
    global.kb_press_type[a] = (1 << 0)
    a = (25 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 72
    global.kb_now[a] = 72
    global.kb_name[a] = "Teleport to NPC"
    global.kb_press_type[a] = (1 << 0)
    a = (26 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 86
    global.kb_now[a] = 86
    global.kb_name[a] = "Fix weapon jam"
    global.kb_press_type[a] = (1 << 0)
    var _quickslot_text = language_get_string("Quick slot")
    a = (15 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 49
    global.kb_now[a] = 49
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "1")
    global.kb_press_type[a] = (1 << 0)
    a = (16 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 50
    global.kb_now[a] = 50
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "2")
    global.kb_press_type[a] = (1 << 0)
    a = (17 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 51
    global.kb_now[a] = 51
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "3")
    global.kb_press_type[a] = (1 << 0)
    a = (18 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 52
    global.kb_now[a] = 52
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "4")
    global.kb_press_type[a] = (1 << 0)
    a = (19 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 53
    global.kb_now[a] = 53
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "5")
    global.kb_press_type[a] = (1 << 0)
    a = (20 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 54
    global.kb_now[a] = 54
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "6")
    global.kb_press_type[a] = (1 << 0)
    a = (21 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 55
    global.kb_now[a] = 55
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "7")
    global.kb_press_type[a] = (1 << 0)
    a = (22 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 56
    global.kb_now[a] = 56
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "8")
    global.kb_press_type[a] = (1 << 0)
    a = (37 << 0)
    global.kb_id[a] = a
    global.kb_default[a] = 8
    global.kb_now[a] = 8
    global.kb_name[a] = "Cancel"
    global.kb_press_type[a] = (1 << 0)
    db_open("local settings")
    for (i = 0; i < array_length_1d(global.kb_id); i++)
        global.kb_now[i] = db_read("Keybinding", global.kb_name[i], global.kb_default[i])
    db_close()
}

