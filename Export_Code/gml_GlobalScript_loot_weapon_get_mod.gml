function loot_weapon_get_mod(argument0, argument1) //gml_Script_loot_weapon_get_mod
{
    if (argument0 == undefined)
        return "no_item";
    return loot_mod_cont_get(variable_struct_get(argument0, "mods"), argument1);
}

