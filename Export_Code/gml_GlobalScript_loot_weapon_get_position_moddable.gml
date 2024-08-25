function loot_weapon_get_position_moddable(argument0, argument1) //gml_Script_loot_weapon_get_position_moddable
{
    if (argument1 == "handguard")
    {
        if item_weapon_pos_get_moddable(argument0.item, "barrel")
        {
            if (!(item_exists(loot_weapon_get_mod(argument0, "barrel"))))
                return false;
        }
    }
    if (argument1 == "brake")
    {
        if item_weapon_pos_get_moddable(argument0.item, "barrel")
        {
            if (!(item_exists(loot_weapon_get_mod(argument0, "barrel"))))
                return false;
        }
    }
    if (argument1 == "att_1" || argument1 == "att_2" || argument1 == "att_3" || argument1 == "att_4")
    {
        var _handguard = loot_weapon_get_mod(argument0, "handguard")
        if item_exists(_handguard)
        {
            if (argument1 == "att_1" && item_mod_handguard_pos_exists(_handguard, "att_1"))
                return true;
            if (argument1 == "att_2" && item_mod_handguard_pos_exists(_handguard, "att_2"))
                return true;
            if (argument1 == "att_3" && item_mod_handguard_pos_exists(_handguard, "att_3"))
                return true;
            if (argument1 == "att_4" && item_mod_handguard_pos_exists(_handguard, "att_4"))
                return true;
        }
    }
    return item_weapon_pos_get_moddable(argument0.item, argument1);
}

