function trader_pages_get_sprite(argument0) //gml_Script_trader_pages_get_sprite
{
    if (!(variable_struct_exists(global.trader_pages_data, argument0)))
    {
        trace_error("Trade page alias \"", argument0, "\" not recognised")
        return;
    }
    var _sprite = asset_get_index(variable_struct_get(global.trader_pages_data, argument0).sprite)
    return (sprite_exists(_sprite) ? _sprite : 2054);
}

