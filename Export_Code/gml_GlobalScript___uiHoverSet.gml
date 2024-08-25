function __uiHoverSet(argument0, argument1, argument2, argument3) //gml_Script___uiHoverSet
{
    if (argument3 == undefined)
        argument3 = false
    with (argument0)
    {
        var _oldStruct = __uiNullableRefResolve(__root.__hoverRef)
        if (_oldStruct != argument1)
        {
            if (_oldStruct != undefined)
            {
                _oldStruct._oldStruct.__Call((2 << 0).((2 << 0)).__CallbackGet(_oldStruct))
                __root.__hoverRef = undefined
            }
            if (argument1 != undefined)
            {
                argument1.argument1.__Call((0 << 0).((0 << 0)).__CallbackGet(argument1))
                __root.__hoverRef = gml_Script___uiNullableRefCreate(argument1)
                __root.__lastHoverRef = __root.__hoverRef
                if argument2
                    argument1.argument1.__ScrollParentToSelf()
            }
        }
        else if (_oldStruct != undefined)
        {
            _oldStruct._oldStruct.__Call((1 << 0).((1 << 0)).__CallbackGet(_oldStruct))
            if argument3
                _oldStruct._oldStruct.__ScrollParentToSelf()
        }
    }
}

