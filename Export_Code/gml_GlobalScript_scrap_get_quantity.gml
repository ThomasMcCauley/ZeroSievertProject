function scrap_get_quantity(argument0, argument1, argument2) //gml_Script_scrap_get_quantity
{
    switch argument0
    {
        case "none":
            return 0;
        case "material":
        case "food":
        case "med":
        case "weapon":
            return ceil(5 * argument1 * argument2 * (global.sk_k[(64 << 0)]));
        case "ammo":
            return ceil(50 * argument1 * argument2 * (global.sk_k[(64 << 0)]));
        default:
            return 0;
    }

}

