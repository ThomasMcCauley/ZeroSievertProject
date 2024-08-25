function scrap_get_item(argument0) //gml_Script_scrap_get_item
{
    switch argument0
    {
        case "none":
            return "no_item";
        case "material":
            return "scrap_material";
        case "food":
            return "scrap_food";
        case "ammo":
            return "scrap_ammo";
        case "med":
            return "scrap_med";
        case "weapon":
            return "scrap_weapon";
        default:
            return "no_item";
    }

}

