function item_weapon_get_modded_stats(argument0, argument1, argument2) //gml_Script_item_weapon_get_modded_stats
{
    if (argument2 == undefined)
        argument2 = undefined
    if (argument2 == undefined)
        argument2 = new class_weapon_stats()
    if item_weapon_get_moddable(argument0)
    {
        loot_mod_cont_get_stats(argument1, argument2)
        argument2.recoil = item_weapon_get_recoil(argument0) + argument2.recoil
        argument2.ergo = item_weapon_get_ergo(argument0) + argument2.ergo
        argument2.acc = item_weapon_get_precisione(argument0) + argument2.acc
        argument2.damage = item_weapon_get_damage(argument0) + argument2.damage
        argument2.reload_time = item_weapon_get_reload_time(argument0) + argument2.reload_speed
    }
    else
    {
        argument2.recoil = item_weapon_get_recoil(argument0)
        argument2.ergo = item_weapon_get_ergo(argument0)
        argument2.acc = item_weapon_get_precisione(argument0)
        argument2.damage = item_weapon_get_damage(argument0)
        argument2.reload_time = item_weapon_get_reload_time(argument0)
    }
    argument2.ergo = clamp(argument2.ergo, 0, 100)
    argument2.recoil = clamp(argument2.recoil, 0, 300)
    argument2.acc = clamp(argument2.acc, 0, 100)
    return argument2;
}

