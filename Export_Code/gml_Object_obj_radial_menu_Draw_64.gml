/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_loot_draw_in_area

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_loot_draw_in_area

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
display_set_gui_size(480, 270)
var _draw_x = display_get_gui_width() / 2
var _draw_y = display_get_gui_height() / 2
draw_sprite_ext(s_radial_bg, 0, _draw_x, _draw_y, 1, 1, 0, c_gray, 0.7)
if obj_gamepad.input_value[(26 << 0)]
    draw_sprite_ext(s_radial_part, 0, _draw_x, _draw_y, 1, 1, ((obj_gamepad.input_decimal[(27 << 0)]) - 90), c_black, 0.2)
if (current_selected != -1)
    draw_sprite_ext(s_radial_part, 0, _draw_x, _draw_y, 1, 1, (current_selected * angle_of_option - 90), c_red, 1)
var _icon_dist = 31
var _count = array_length(options_data)
for (var i = 0; i < _count; i++)
{
    var _this_option = options_data[i]
    if (!is_undefined(_this_option.icon_sprite))
    {
        var _use_scale = 0.4
        var _offset_x = 3
        var _offset_y = 3
        if (sprite_get_width(_this_option.icon_sprite) <= 5)
        {
            _use_scale = 1.3
            _offset_x = 1
            _offset_y = 0
        }
        draw_sprite_ext(_this_option.icon_sprite, 0, (_draw_x + (lengthdir_x(_icon_dist, (i * angle_of_option))) - _offset_x), (_draw_y + (lengthdir_y(_icon_dist, (i * angle_of_option))) - _offset_y), _use_scale, _use_scale, 0, c_white, 1)
    }
    if (!is_undefined(_this_option.icon_struct))
    {
        _offset_x = 7
        _offset_y = 7
        gml_Script_loot_draw_in_area(_this_option.icon_struct, (_draw_x + (lengthdir_x(_icon_dist, (i * angle_of_option))) - _offset_x), (_draw_y + (lengthdir_y(_icon_dist, (i * angle_of_option))) - _offset_y), 14, 14)
    }
}
display_set_gui_size(1920, 1080)
