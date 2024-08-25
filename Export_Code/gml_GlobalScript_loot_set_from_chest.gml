function loot_set_from_chest(argument0, argument1, argument2, argument3) //gml_Script_loot_set_from_chest
{
    if (argument1 == undefined)
        argument1 = false
    if (argument2 == undefined)
        argument2 = 100
    if (argument3 == undefined)
        argument3 = false
    with (argument0)
    {
        seen = argument1
        durability = argument2
        created_from_player = argument3
    }
}

