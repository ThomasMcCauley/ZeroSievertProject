/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_difficulty_get

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_difficulty_get

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
player_follow_local()
meteo_alpha += clamp((global.meteo_dark - meteo_alpha), -0.005, meteo_alpha_increase)
if ((!instance_exists(obj_main_menu)) && (!(player_local_state_is(gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera))))
    game_seconds_remainder += (time_increase * (delta_time / 16667))
real_time_played += (delta_time / 1000000)
if global.general_debug
{
    if (keyboard_check(ord("T")) && keyboard_check_pressed(vk_left))
        time_increment_hours(-1)
    if (keyboard_check(ord("T")) && keyboard_check_pressed(vk_right))
        time_increment_hours(1)
}
if (game_seconds_remainder >= 1)
{
    time_increment_seconds(floor(game_seconds_remainder))
    game_seconds_remainder = frac(game_seconds_remainder)
}
var _hour = time_get_hours()
var t_alba = ciclo_time[(0 << 0)]
var t_giorno = ciclo_time[(1 << 0)]
var t_tra = ciclo_time[(2 << 0)]
var t_notte = ciclo_time[(3 << 0)]
var t_hm = time_get_hours_fraction()
if (_hour >= t_alba && _hour < t_giorno)
{
    ciclo_now = (0 << 0)
    darkness_now = darkness_max - (t_hm - t_alba) * darkness_max / (t_giorno - t_alba)
    var merge_amount = 1 - 1 * darkness_now / darkness_max
    color_surface = merge_color(ciclo_color[(3 << 0)], ciclo_color[(0 << 0)], merge_amount)
}
if (_hour >= t_giorno && _hour < t_tra)
{
    ciclo_now = (1 << 0)
    darkness_now = 0
    color_surface = ciclo_color[(1 << 0)]
}
if (_hour >= t_tra && _hour < t_notte)
{
    ciclo_now = (2 << 0)
    darkness_now = (t_hm - t_tra) * darkness_max / (t_notte - t_tra)
    merge_amount = 1 * darkness_now / darkness_max
    color_surface = merge_color(ciclo_color[(0 << 0)], ciclo_color[(3 << 0)], merge_amount)
}
if (_hour >= t_notte || _hour < t_alba)
{
    ciclo_now = (3 << 0)
    darkness_now = darkness_max
    color_surface = ciclo_color[(3 << 0)]
}
darkness_now = clamp(darkness_now, 0, darkness_max)
