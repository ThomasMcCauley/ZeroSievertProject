function ui_crafting_populate(argument0) //gml_Script_ui_crafting_populate
{
    var _loot_array = crafting_mode_get_loot_array(argument0)
    var _ui_constructor = crafting_mode_get_ui_constructor(argument0)
    ui_crafting_requirements_populate(undefined)
    var _destination_struct = gml_Script_uiFind(uiLayerGetRoot("crafting layer"), "craft inventory")
    _destination_struct._destination_struct.ChildrenClear()
    gml_Script_uiOpenExisting(_destination_struct)
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        uiOpen(_ui_constructor)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _loot)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().AutoPlace(_destination_struct)
        gml_Script_uiClose()
        _i++
    }
    gml_Script_uiClose()
}

