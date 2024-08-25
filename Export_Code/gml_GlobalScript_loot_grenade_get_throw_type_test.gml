function loot_grenade_get_throw_type_test(argument0) //gml_Script_loot_grenade_get_throw_type_test
{
    switch item_grenade_get_throw_type(argument0.item)
    {
        case "GRENADE_throw_bounce":
            return "no";
        case "GRENADE_throw_no_bounce":
            return "yes";
        case "GRENADE_throw_no_move":
            return "land mine";
    }

}

