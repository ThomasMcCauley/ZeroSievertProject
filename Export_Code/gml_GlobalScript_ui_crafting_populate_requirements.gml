function ui_crafting_requirements_populate(argument0) //gml_Script_ui_crafting_requirements_populate
{
    gml_Script_uiGetData().crafting_loot = argument0
    var _loot_array = loot_get_crafting_requirement_items(argument0)
    var _destination_struct = gml_Script_uiFind(uiLayerGetRoot("crafting layer"), "requirements inventory")
    _destination_struct._destination_struct.ChildrenClear()
    gml_Script_uiOpenExisting(_destination_struct)
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        uiOpen(gml_Script_class_ui_loot_crafting_requirement)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _loot)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().AutoPlace(_destination_struct)
        gml_Script_uiClose()
        _i++
    }
    gml_Script_uiClose()
}

