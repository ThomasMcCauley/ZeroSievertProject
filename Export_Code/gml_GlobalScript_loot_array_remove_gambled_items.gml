function loot_array_remove_gambled_items(argument0) //gml_Script_loot_array_remove_gambled_items
{
    var _i = 0
    repeat array_length(argument0)
    {
        var _lose = false
        switch item_get_category(argument0[_i].item)
        {
            case "weapon":
            case "armor":
            case "headset":
            case "backpack":
                _lose = gml_Script_difficulty_get("hardcore_lose_equipment")
                break
            case "medication":
                _lose = gml_Script_difficulty_get("hardcore_lose_medication")
                break
            case "ammo":
                _lose = gml_Script_difficulty_get("hardcore_lose_ammo")
                break
            case "consumable":
                _lose = gml_Script_difficulty_get("hardcore_lose_consumable")
                break
            case "key":
                _lose = gml_Script_difficulty_get("hardcore_lose_keys")
                break
            default:
                _lose = gml_Script_difficulty_get("hardcore_lose_other")
                break
        }

        if _lose
            array_delete(argument0, _i, 1)
        else
            _i++
    }
}

