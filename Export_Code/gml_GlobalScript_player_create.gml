function player_create(argument0, argument1, argument2) //gml_Script_player_create
{
    if (argument2 == undefined)
        argument2 = 0
    if player_exists(argument2)
    {
        __mp_trace("Warning! An instance for player index ", argument2, " already exists")
        instance_destroy(player_get(argument2))
    }
    var _object = (argument2 == player_get_local_index() ? obj_player : obj_player_puppet)
    __mp_trace("Creating player index ", argument2, " as ", object_get_name(_object))
    return instance_create_depth(argument0, argument1, 0, _object, 
    {
        mp_index: argument2
    }
);
}

