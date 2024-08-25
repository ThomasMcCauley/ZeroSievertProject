function loot_weapon_get_recoil(argument0) //gml_Script_loot_weapon_get_recoil
{
    var _stats = item_weapon_get_modded_stats(argument0.item, argument0.mods)
    return _stats.recoil;
}

