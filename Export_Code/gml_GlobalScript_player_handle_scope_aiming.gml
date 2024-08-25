function player_handle_scope_aiming() //gml_Script_player_handle_scope_aiming
{
    aiming = false
    with (obj_mouse)
        visible = true
    var _scope = player_loadout_get_mod(self, weapon_slot_now, "scope")
    if (item_mod_get_scope_optic(_scope) && item_exists(arma_now))
    {
        aiming = (mouse_check_button(mb_right) || obj_gamepad.action[(28 << 0)].value)
        with (obj_mouse)
            visible = (!other.aiming)
    }
}

