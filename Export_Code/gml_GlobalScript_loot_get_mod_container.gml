function loot_get_mod_container(argument0) //gml_Script_loot_get_mod_container
{
    if (argument0 == undefined)
        return undefined;
    return variable_struct_get(argument0, "mods");
}

