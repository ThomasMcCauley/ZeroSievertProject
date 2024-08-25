function npc_damage(argument0, argument1) //gml_Script_npc_damage
{
    if instance_exists(argument0)
        argument0.hp -= argument1
}

