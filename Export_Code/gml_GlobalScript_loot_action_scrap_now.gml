function loot_action_scrap_now(argument0) //gml_Script_loot_action_scrap_now
{
    var _scrap_type = item_get_scrap(argument0.item)
    if (_scrap_type == "none")
        return;
    var _quantity = clamp(scrap_get_quantity(_scrap_type, argument0.quantity, item_get_weight(argument0.item)), 1, 999)
    if (_quantity <= 0)
        return;
    var _scrap_item = scrap_get_item(_scrap_type)
    if (!(inventory_check_for_space(_scrap_item, _quantity)))
    {
        scr_draw_text_with_box("Not enough inventory space to scrap this item")
        return;
    }
    loot_decrement(argument0, infinity)
    inventory_add_item(_scrap_item, _quantity)
}

