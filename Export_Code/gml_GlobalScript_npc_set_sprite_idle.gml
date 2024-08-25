function npc_set_sprite_idle(argument0, argument1) //gml_Script_npc_set_sprite_idle
{
    var _value = npc_get_sprite_idle(argument0)
    if (_value == "{use_armor}")
    {
        if item_exists(argument1)
            return item_armor_get_s_idle(argument1);
        else
            trace_error("Armor \"", argument1, "\" doesn't exist")
    }
    var _sprite = asset_get_index(_value)
    if (!sprite_exists(_sprite))
        trace_error("Sprite \"", _value, "\" does not exist")
    return _sprite;
}

