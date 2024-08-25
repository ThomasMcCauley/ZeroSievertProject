function __uiDraggingSet(argument0, argument1) //gml_Script___uiDraggingSet
{
    with (argument0)
    {
        var _oldStruct = __uiNullableRefResolve(__root.__draggingRef)
        if (_oldStruct != argument1)
        {
            if (_oldStruct != undefined)
            {
                _oldStruct.__stateDragging = false
                __root.__draggingRef = undefined
            }
            if (argument1 != undefined)
            {
                argument1.__stateDragging = true
                __root.__draggingRef = gml_Script___uiNullableRefCreate(argument1)
            }
            if (argument1 == undefined)
            {
                if gml_Script___uiNullableRefAlive(__root.__hoverRef)
                {
                    var _hoverStruct = __uiNullableRefResolve(__root.__hoverRef)
                    if (_hoverStruct != _oldStruct)
                        __uiHoverSet(self, _oldStruct, true, true)
                }
            }
        }
    }
}

