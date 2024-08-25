var _temp_local_var_2;
gml_Script_uiAddBoxType("UiItemSlot", gml_Script_class_ui_item_slot)
function class_ui_item_slot() constructor //gml_Script_class_ui_item_slot
{
    var _temp_local_var_2 = uiClassDnDTarget()
    if @@CopyStatic@@(gml_Script_uiClassDnDTarget)
    {
    }
    else
    {
        function anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_1093_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot(argument0) //gml_Script_anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_1093_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot
        {
            if (!self.HasChildren())
            {
                self.self.ParentChange(argument0)
                "x".("x").Set(((__localRight - __localLeft) * 0.5), argument0)
                "y".("y").Set(((__localBottom - __localTop) * 0.5), argument0)
                argument0.__lootStruct.placement = identifier
                return true;
            }
            return false;
        }

        function anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_1421_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot() //gml_Script_anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_1421_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot
        {
            if (!self.GetAnyDragging())
                return false;
            if self.HasChildren()
            {
                if (__children[0] != self.GetDraggedStruct())
                    return false;
            }
            var _item_category = item_get_category(self.GetDraggedStruct().__lootStruct.item)
            if is_array(category)
            {
                var _i = 0
                repeat array_length(category)
                {
                    if (_item_category == category[_i])
                        return true;
                    _i++
                }
                return false;
            }
            else
                return _item_category == category;
        }

    }
    category = undefined
    self.CallbackSetCanHover(function(argument0) //gml_Script_anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_2121_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot
    {
        return self.__CanReceiveDrag();
    }
)
    self.CallbackSetDnDCanReceive(function(argument0) //gml_Script_anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_2234_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot
    {
        return self.__CanReceiveDrag();
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot_2338_class_ui_item_slot_gml_GlobalScript_class_ui_item_slot
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _scale = scale * animScale
        var _alpha = alpha * animAlpha
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        if self.GetHover()
        {
            draw_set_color(_color)
            draw_set_alpha(0.5 * _alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        }
        else if self.__CanReceiveDrag()
        {
            draw_set_color(_color)
            draw_set_alpha(0.25 * _alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        }
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
    }
)
}

