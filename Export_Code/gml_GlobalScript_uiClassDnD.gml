var _temp_local_var_2;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___uiNullableRefCreate

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___uiNullableRefCreate

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiDnD", gml_Script_uiClassDnD, false)
function uiClassDnD() constructor //gml_Script_uiClassDnD
{
    var _temp_local_var_2 = uiClassButton()
    if @@CopyStatic@@(gml_Script_uiClassButton)
    {
    }
    else
    {
        function anon_uiClassDnD_gml_GlobalScript_uiClassDnD_1374_uiClassDnD_gml_GlobalScript_uiClassDnD(argument0, argument1) //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_1374_uiClassDnD_gml_GlobalScript_uiClassDnD
        {
            if (argument1 == undefined)
                argument1 = true
            var _position = self.self.FindEmptyPlace(argument1, argument0)
            if (_position == undefined)
                return false;
            self.ParentChange(argument0)
            self.Set("x", _position[0])
            self.Set("y", _position[1])
            ui_inventory_check_weight()
            return true;
        }

        function anon_uiClassDnD_gml_GlobalScript_uiClassDnD_1765_uiClassDnD_gml_GlobalScript_uiClassDnD() //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_1765_uiClassDnD_gml_GlobalScript_uiClassDnD
        {
            __dragOffsetX = uiPointerGetX() - uiPointerGetCaptureX() - 0.5 * (__localLeft + __localRight)
            __dragOffsetY = uiPointerGetY() - uiPointerGetCaptureY() - 0.5 * (__localTop + __localBottom)
        }

    }
    focusable = true
    self.CallbackSetCanHover(function() //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_2025_uiClassDnD_gml_GlobalScript_uiClassDnD
    {
        return (!self.GetAnyDragging());
    }
)
    self.CallbackSetButtonStart(function(argument0) //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_2126_uiClassDnD_gml_GlobalScript_uiClassDnD
    {
        gml_Script_uiCallInherited()
        if (argument0 == "action")
        {
            __uiDraggingSet(gml_Script___uiRootStackTop(), self)
            self.__SetDragOffset()
        }
    }
)
    self.CallbackSetButton(function(argument0) //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_2367_uiClassDnD_gml_GlobalScript_uiClassDnD
    {
        gml_Script_uiCallInherited()
        if (argument0 == "action")
            self.__SetDragOffset()
    }
)
    self.CallbackSetButtonEnd(function(argument0) //gml_Script_anon_uiClassDnD_gml_GlobalScript_uiClassDnD_2555_uiClassDnD_gml_GlobalScript_uiClassDnD
    {
        gml_Script_uiCallInherited()
        if (argument0 == "action")
            __uiDraggingSet(gml_Script___uiRootStackTop(), undefined)
    }
)
}

