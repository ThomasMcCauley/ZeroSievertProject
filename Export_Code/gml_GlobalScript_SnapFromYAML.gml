/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_SnapBufferReadYAML

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
function SnapFromYAML(argument0, argument1, argument2, argument3) //gml_Script_SnapFromYAML
{
    if (argument1 == undefined)
        argument1 = true
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = 2
    var _buffer = buffer_create(string_byte_length(argument0), buffer_fixed, 1)
    buffer_write(_buffer, buffer_text, argument0)
    var _data = gml_Script_SnapBufferReadYAML(_buffer, 0, argument1, argument2, argument3)
    buffer_delete(_buffer)
    return _data;
}

