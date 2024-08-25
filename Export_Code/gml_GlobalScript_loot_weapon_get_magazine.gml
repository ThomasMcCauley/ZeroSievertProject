function loot_weapon_get_magazine(argument0, argument1) //gml_Script_loot_weapon_get_magazine
{
    if (argument1 == undefined)
        argument1 = false
    if argument1
        return item_weapon_get_modded_magazine_size(argument0.item, variable_struct_get(argument0, "mods"));
    else
        return item_weapon_get_magazine(argument0.item);
}

