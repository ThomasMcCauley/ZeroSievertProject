function bullet_can_collide_with_npc(argument0, argument1) //gml_Script_bullet_can_collide_with_npc
{
    if (!instance_exists(argument1))
        return false;
    if argument1.can_be_damaged
    {
        if (argument0.shooter_faction != argument1.faction || argument0.shooter_faction == "All Enemy")
        {
            if (argument0.shooter_id != argument1.id)
                return true;
        }
    }
    return false;
}

