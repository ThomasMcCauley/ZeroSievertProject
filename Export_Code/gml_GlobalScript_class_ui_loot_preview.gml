var _temp_local_var_2, _temp_local_var_3;
function class_ui_loot_preview() constructor //gml_Script_class_ui_loot_preview
{
    highlightTracked = false
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___class_ui_loot_button_shared)
    var _temp_local_var_3 = __class_ui_loot_button_shared()
    self.VariableBind("loot", function() //gml_Script_anon_class_ui_loot_preview_gml_GlobalScript_class_ui_loot_preview_1559_class_ui_loot_preview_gml_GlobalScript_class_ui_loot_preview
    {
        return __lootStruct;
    }
, function(argument0) //gml_Script_anon_class_ui_loot_preview_gml_GlobalScript_class_ui_loot_preview_1620_class_ui_loot_preview_gml_GlobalScript_class_ui_loot_preview
    {
        __lootStruct = argument0
        var _sprite = item_get_sprite_inv(__lootStruct.item)
        if (__lootStruct.rotation == 0)
            self.Set("ltrb", [(4 * __lootStruct.x), (4 * __lootStruct.y), (4 * (__lootStruct.x + sprite_get_width(_sprite) - 1)), (4 * (__lootStruct.y + sprite_get_height(_sprite) - 1))])
        else
            self.Set("ltrb", [(4 * __lootStruct.x), (4 * __lootStruct.y), (4 * (__lootStruct.x + sprite_get_height(_sprite) - 1)), (4 * (__lootStruct.y + sprite_get_width(_sprite) - 1))])
    }
)
}

