function loot_action_get_array(argument0) //gml_Script_loot_action_get_array
{
    var _array = []
    var _item = argument0.item
    switch item_get_category(_item)
    {
        case "consumable":
            array_push_unique(_array, "Consume")
            break
        case "medication":
        case "repair_weapon":
        case "repair_armor":
        case "injector":
        case "book":
        case "upgrade_base_kit":
        case "book_r":
        case "base_storage_use":
        case "grenade":
            array_push_unique(_array, "Use")
            break
        case "weapon":
            array_push_unique(_array, "Unload")
            break
    }

    if (_item == "natale_luci_kit")
        array_push_unique(_array, "Use")
    if (is_in_hub() && item_get_scrap(_item) != "none")
        array_push_unique(_array, "Scrap")
    return _array;
}

