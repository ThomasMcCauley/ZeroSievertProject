function scr_player_state_start() //gml_Script_scr_player_state_start
{
    if instance_exists(obj_train)
    {
        x = obj_train.x
        y = obj_train.y
    }
    visible = false
}

