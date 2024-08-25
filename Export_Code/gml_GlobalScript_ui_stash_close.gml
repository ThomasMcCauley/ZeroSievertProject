function ui_stash_close() //gml_Script_ui_stash_close
{
    var _index = gml_Script_uiGetData().stash_page
    if (_index == undefined)
        return;
    var _root = uiLayerGetRoot("inventory layer")
    var _loot_ui_array = gml_Script_uiFindAllType(_root, "class_ui_item")
    var _output_loot_array = []
    var _i = 0
    repeat array_length(_loot_ui_array)
    {
        var _loot_ui = _loot_ui_array[_i]
        if ("parent".("parent").Get(_loot_ui).identifier == "other inventory")
        {
            var _loot = ui_convert_element_to_loot(_loot_ui)
            array_push(_output_loot_array, _loot)
        }
        _i++
    }
    db_open("chest")
    db_write(("chest_" + string(_index)), "items", _output_loot_array)
    db_close()
    gml_Script_uiFind(uiLayerGetRoot("inventory layer"), "other inventory").gml_Script_uiFind(uiLayerGetRoot("inventory layer"), "other inventory").ChildrenClear()
}

