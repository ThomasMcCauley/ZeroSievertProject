function scr_gamepad_action_string_to_kb_enum(argument0) //gml_Script_scr_gamepad_action_string_to_kb_enum
{
    switch argument0
    {
        case "up":
            return (0 << 0);
        case "down":
            return (1 << 0);
        case "right":
            return (2 << 0);
        case "left":
            return (3 << 0);
        case "run":
            return (4 << 0);
        case "inventory":
            return (5 << 0);
        case "interact":
            return (6 << 0);
        case "reload":
            return (7 << 0);
        case "torch":
            return (8 << 0);
        case "laser":
            return (9 << 0);
        case "device":
            return (10 << 0);
        case "map":
            return (11 << 0);
        case "bolt":
            return (12 << 0);
        case "switch_shoot_mode":
            return (13 << 0);
        case "headset":
            return (14 << 0);
        case "weapon1":
            return (15 << 0);
        case "weapon2":
            return (16 << 0);
        case "qs1":
            return (17 << 0);
        case "qs2":
            return (18 << 0);
        case "qs3":
            return (19 << 0);
        case "qs4":
            return (20 << 0);
        case "qs5":
            return (21 << 0);
        case "qs6":
            return (22 << 0);
        case "change_ammo":
            return (23 << 0);
        case "weapon_look":
            return (24 << 0);
        case "quick_move":
            return (25 << 0);
        case "fix_jam":
            return (26 << 0);
        case "shoot":
            return (27 << 0);
        case "scope_aiming":
            return (28 << 0);
        case "inventory_rotate_item":
            return (29 << 0);
        case "inventory_quick_move":
            return (30 << 0);
        case "radial_menu_left":
            return (32 << 0);
        case "radial_menu_right":
            return (31 << 0);
        case "navigation_up":
            return (33 << 0);
        case "navigation_down":
            return (34 << 0);
        case "navigation_left":
            return (35 << 0);
        case "navigation_right":
            return (36 << 0);
        default:
            break
    }

    show_error("ERROR: scr_gamepad_action_string_to_kb_enum() was given a string it didnt know how to convert", true)
}

