function loot_mod_cont_delete(argument0, argument1) //gml_Script_loot_mod_cont_delete
{
    if (argument1 == undefined)
        return;
    variable_struct_set(argument0, argument1, "no_item")
}

