function player_loadout_get_loot(argument0, argument1, argument2) //gml_Script_player_loadout_get_loot
{
    if (argument2 == undefined)
        argument2 = true
    switch argument1
    {
        case (1 << 0):
            argument1 = "weapon slot 1"
            break
        case (2 << 0):
            argument1 = "weapon slot 2"
            break
        case (11 << 0):
            argument1 = "armor slot"
            break
        case (10 << 0):
            argument1 = "backpack slot"
            break
        case (12 << 0):
            argument1 = "headset slot"
            break
        case (4 << 0):
            argument1 = "quick slot 1"
            break
        case (5 << 0):
            argument1 = "quick slot 2"
            break
        case (6 << 0):
            argument1 = "quick slot 3"
            break
        case (7 << 0):
            argument1 = "quick slot 4"
            break
        case (8 << 0):
            argument1 = "quick slot 5"
            break
        case (9 << 0):
            argument1 = "quick slot 6"
            break
        default:
            if ((!is_string(argument1)) && (!is_undefined(argument1)))
            {
            }
            break
    }

    with (argument0)
    {
        var _loot = variable_struct_get(loot_in_slot, argument1)
        if (is_struct(_loot) && _loot.quantity <= 0)
        {
            trace("Warning! Caught situation where loot had zero quantity in player's loadout (\"", argument1, "\" = ", _loot, ")")
            variable_struct_remove(loot_in_slot, argument1)
            _loot = undefined
        }
        return ((argument2 && _loot == undefined) ? new class_loot() : _loot);
    }
}

