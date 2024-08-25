function loot_weapon_get_fire_mode_name(argument0) //gml_Script_loot_weapon_get_fire_mode_name
{
    switch loot_weapon_get_fire_mode(argument0)
    {
        case "semi_automatic":
        case "automatic":
            return ((string(round(3600 / loot_weapon_get_rate_of_fire(argument0)))) + " rpm");
        case "bolt_action":
            return "Bolt Action";
        default:
            return "???";
    }

}

