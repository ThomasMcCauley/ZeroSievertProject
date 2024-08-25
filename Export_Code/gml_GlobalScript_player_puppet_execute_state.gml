function player_puppet_execute_state() //gml_Script_player_puppet_execute_state
{
    var _script = undefined
    switch state
    {
        case gml_Script_scr_player_state_move:
            _script = gml_Script_puppet_state_move
            break
        case gml_Script_scr_player_state_inventory:
            _script = gml_Script_puppet_state_inventory
            break
        case gml_Script_scr_player_state_dead:
            _script = gml_Script_puppet_state_dead
            break
        case gml_Script_scr_player_state_start:
            _script = gml_Script_puppet_state_start
            break
        case gml_Script_scr_player_state_consumable_animation:
            _script = gml_Script_puppet_state_consumable_animation
            break
        case gml_Script_scr_player_state_sleep:
            _script = gml_Script_puppet_state_sleep
            break
        case gml_Script_scr_player_state_craft:
            _script = gml_Script_puppet_state_craft
            break
        case gml_Script_scr_player_state_item_spawn:
            _script = gml_Script_puppet_state_item_spawn
            break
        case gml_Script_scr_player_state_weapon_look:
            _script = gml_Script_puppet_state_weapon_look
            break
        case gml_Script_scr_player_state_cristallo_viola:
            _script = gml_Script_puppet_state_cristallo_viola
            break
        case gml_Script_scr_player_state_free_camera:
            _script = gml_Script_puppet_state_free_camera
            break
        case gml_Script_scr_player_state_talk:
            _script = gml_Script_puppet_state_talk
            break
        case gml_Script_scr_player_state_teleport:
            _script = gml_Script_puppet_state_teleport
            break
        default:
            _script = puppet_state_error_missing
            break
    }

    if (_script != undefined)
        script_execute(_script)
}

