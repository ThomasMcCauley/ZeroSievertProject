function loot_mod_cont_exists(argument0, argument1) //gml_Script_loot_mod_cont_exists
{
    if (!is_struct(argument0))
        return false;
    if (argument1 == undefined)
        return false;
    return item_exists(variable_struct_get(argument0, argument1));
}

