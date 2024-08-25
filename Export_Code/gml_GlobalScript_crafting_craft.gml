function crafting_craft(argument0) //gml_Script_crafting_craft
{
    if (argument0 == undefined)
        return;
    if (!(gml_Script_crafting_meet_requirements(argument0, false, true)))
        return;
    if (!(inventory_check_for_space(argument0.item, argument0.quantity)))
    {
        scr_draw_text_with_box("Not enough inventory space!")
        return;
    }
    if (!global.general_debug)
        crafting_remove_raw_materials(argument0)
    inventory_add_item(argument0.item, argument0.quantity)
    var _text = language_get_string("Crafted items")
    _text = string_replace(_text, "[ITEM_NAME]", loot_get_name(argument0))
    _text = string_replace(_text, "[ITEM_AMOUNT]", string(argument0.quantity))
    scr_draw_text_with_box(_text, false)
    ui_crafting_requirements_populate(gml_Script_uiGetData().crafting_loot)
}

