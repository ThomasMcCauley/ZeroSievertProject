function item_exists(argument0) //gml_Script_item_exists
{
    return (is_string(argument0) && argument0 != undefined && argument0 != "no_item" && argument0 != "no_weapon");
}

