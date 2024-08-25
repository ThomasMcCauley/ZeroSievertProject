function item_weapon_get_modded_brake_pos(argument0, argument1) //gml_Script_item_weapon_get_modded_brake_pos
{
    var _result = 
    {
        x: 0,
        y: 0
    }

    if item_weapon_get_moddable(argument0)
    {
        if loot_mod_cont_exists(argument1, "barrel")
        {
            var _x = item_weapon_pos_get_x(argument0, "barrel")
            var _y = item_weapon_pos_get_y(argument0, "barrel")
            var _length = item_mod_get_barrel_length(loot_mod_cont_get(argument1, "barrel"))
            _result.x = _x + _length
            _result.y = _y
        }
        else if (!(item_weapon_pos_get_moddable(argument0, "barrel")))
        {
            _result.x = item_weapon_pos_get_x(argument0, "brake")
            _result.y = item_weapon_pos_get_y(argument0, "brake")
        }
    }
    return _result;
}

