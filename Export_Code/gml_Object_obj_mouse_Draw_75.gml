with (gml_Script___uiGlobal().__defaultOnion)
{
    if (self.InputGetMode() == "directional")
        return;
}
if instance_exists(obj_exit_screen)
    return;
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
if player_local_state_is(gml_Script_scr_player_state_inventory, gml_Script_scr_player_state_craft)
    draw_sprite(sprite_index, image_index, (x - camx), (y - camy))
if (player_local_state_is(gml_Script_scr_player_state_pda, gml_Script_scr_player_state_item_spawn, gml_Script_scr_player_state_teleport) || (instance_exists(obj_controller) && gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.HasInputReceiver()))
{
    draw_sprite(sprite_index, 4, (x - camx), (y - camy))
    language_set_font((0 << 0))
}
