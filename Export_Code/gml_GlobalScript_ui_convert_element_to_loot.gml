function ui_convert_element_to_loot(argument0) //gml_Script_ui_convert_element_to_loot
{
    var _loot = argument0.__lootStruct
    _loot.x = "left".("left").Get(argument0) / 4
    _loot.y = "top".("top").Get(argument0) / 4
    return _loot;
}

