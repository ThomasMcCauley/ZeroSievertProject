function ui_inventory_add_loot(argument0, argument1, argument2, argument3) //gml_Script_ui_inventory_add_loot
{
    if (argument3 == undefined)
        argument3 = true
    var _root = uiLayerGetRoot("inventory layer")
    var _destination = gml_Script_uiFind(_root, argument1)
    gml_Script_uiOpenExisting(_root)
    var _ui_element = uiOpen(argument2)
    gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", argument0)
    gml_Script_uiClose()
    gml_Script_uiClose()
    if _destination._destination.AutoPlace(argument3, _ui_element)
    {
        argument0.placement = argument1
        return true;
    }
    else
    {
        uiDestroy(_ui_element)
        if argument3
            return true;
        return false;
    }
}

