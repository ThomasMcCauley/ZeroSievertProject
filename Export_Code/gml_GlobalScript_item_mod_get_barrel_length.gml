function item_mod_get_barrel_length(argument0) //gml_Script_item_mod_get_barrel_length
{
    if (item_mod_get_type(argument0) != "barrel")
        return 32;
    return sprite_get_width(item_get_sprite_ingame(argument0));
}

