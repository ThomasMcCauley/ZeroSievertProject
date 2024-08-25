function uiOpen(argument0) //gml_Script_uiOpen
{
    if (argument0 == undefined)
        argument0 = gml_Script_uiClassBox
    var _box = gml_Script_uiCreate(argument0)
    gml_Script_uiOpenExisting(_box)
    return _box;
}

