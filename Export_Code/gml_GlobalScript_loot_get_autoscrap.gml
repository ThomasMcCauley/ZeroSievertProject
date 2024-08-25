function loot_get_autoscrap(argument0) //gml_Script_loot_get_autoscrap
{
    var _item = argument0.item
    return (!((item_get_category(_item) == "weapon" || item_get_category(_item) == "armor" || item_get_category(_item) == "w_mod")));
}

