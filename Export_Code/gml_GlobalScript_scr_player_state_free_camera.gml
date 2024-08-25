function scr_player_state_free_camera() //gml_Script_scr_player_state_free_camera
{
    if (!global.general_debug)
    {
        visible = true
        player_set_local_state(gml_Script_scr_player_state_move)
        return;
    }
    var _spd = 1
    if global.kb_hold[(4 << 0)]
        _spd = 3
    hspd = ((global.kb_hold[(2 << 0)]) - (global.kb_hold[(3 << 0)])) * _spd
    vspd = ((global.kb_hold[(1 << 0)]) - (global.kb_hold[(0 << 0)])) * _spd
    x += hspd
    y += vspd
}

