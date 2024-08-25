function item_get_trader_page(argument0) //gml_Script_item_get_trader_page
{
    switch item_get_category(argument0)
    {
        case "medication":
        case "injector":
        case "consumable":
            return "medication_and_food";
        case "backpack":
        case "armor":
        case "headset":
            return "equipment";
        case "barter":
        case "repair_weapon":
        case "repair_armor":
        case "key":
        case "book":
        case "book_r":
            return "general";
        case "ammo":
        case "grenade":
            return "ammo";
        case "weapon":
            switch item_weapon_get_type(argument0)
            {
                case "pistol":
                case "smg":
                    return "pistol_smg";
                case "rifle":
                    return "rifle";
                case "shotgun":
                    return "shotgun";
                case "sniper":
                case "dmr":
                    return "sniper_rifle";
            }

            break
        case "w_mod":
            switch item_mod_get_type(argument0)
            {
                case "stock":
                case "barrel":
                    return "stock";
                case "magazine":
                    return "magazine";
                case "handguard":
                case "grip":
                    return "handguard_grip";
                case "foregrip":
                case "scope":
                case "silencer":
                case "torch":
                case "laser":
                case "brake":
                    return "hand_scope";
            }

            break
        default:
            return trader_pages_default_alias();
    }

}

