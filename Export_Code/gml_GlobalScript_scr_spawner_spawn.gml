function scr_spawner_spawn(argument0, argument1) //gml_Script_scr_spawner_spawn
{
    if is_in_raid()
    {
        if scr_chance(argument0)
            instance_create_depth(x, y, 0, argument1)
    }
}

