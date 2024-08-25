function ui_debug_spawner_populate(argument0, argument1) //gml_Script_ui_debug_spawner_populate
{
    var _destination_struct = gml_Script_uiFind(uiLayerGetRoot("debug layer"), "craft inventory")
    _destination_struct._destination_struct.ChildrenClear()
    gml_Script_uiOpenExisting(_destination_struct)
    var _spawner_data = variable_struct_get(global.item_debug_spawner_data, argument0)
    if (!is_struct(_spawner_data))
        trace_error("Debug spawner category \"", _category, "\" not recognised")
    var _loot_array = _spawner_data.loot_array
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.page == argument1)
        {
            uiOpen(gml_Script_class_ui_loot_debug_spawner)
            gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _loot)
            gml_Script_uiClose()
        }
        _i++
    }
    gml_Script_uiClose()
}

