function player_action_change_weapon(argument0) //gml_Script_player_action_change_weapon
{
    if (weapon_slot_now != argument0)
    {
        reloading = false
        alarm[0] = 1
        action = true
        switching_weapon = true
        next_weapon_slot = argument0
        switching_fase = 0
    }
}

