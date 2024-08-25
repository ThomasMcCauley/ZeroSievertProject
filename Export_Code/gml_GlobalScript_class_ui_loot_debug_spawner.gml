var _temp_local_var_2, _temp_local_var_3;
function class_ui_loot_debug_spawner() constructor //gml_Script_class_ui_loot_debug_spawner
{
    highlightTracked = true
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___class_ui_loot_button_shared)
    var _temp_local_var_3 = __class_ui_loot_button_shared()
    self.VariableBind("loot", function() //gml_Script_anon_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner_1803_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner
    {
        return __lootStruct;
    }
, function(argument0) //gml_Script_anon_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner_1864_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner
    {
        __lootStruct = argument0
        var _sprite = item_get_sprite_inv(__lootStruct.item)
        self.Set("ltrb", [(4 * __lootStruct.x), (4 * __lootStruct.y), (4 * (__lootStruct.x + sprite_get_width(_sprite) - 1)), (4 * (__lootStruct.y + sprite_get_height(_sprite) - 1))])
    }
)
    self.CallbackSetButtonClick(function(argument0) //gml_Script_anon_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner_2300_class_ui_loot_debug_spawner_gml_GlobalScript_class_ui_loot_debug_spawner
    {
        var _item = loot_get_item(__lootStruct)
        var _quantity = item_get_stack_max(_item)
        if inventory_add_item(_item, _quantity)
        {
            var _text = language_get_string("Item added to inventory")
            _text = string_replace(_text, "[ITEM_NAME]", item_get_name(_item))
            _text = string_replace(_text, "[ITEM_QUANTITY]", string(_quantity))
            scr_draw_text_with_box(_text, false)
        }
        else
            scr_draw_text_with_box("Not enough inventory space!")
    }
)
}

