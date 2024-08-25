/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_game_in_focus

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_game_in_focus

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_db_meta_read

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_meta_read

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
if global.coming_from_main_menu
{
    global.coming_from_main_menu = false
    black_overlay_alpha = 1
}
else
    black_overlay_alpha = 0
keybind_active = false
keybind_target = undefined
audio_group_load(14)
settings_apply("master volume")
settings_apply("radiation volume")
settings_apply("heart volume")
settings_apply("main volume")
if (room == r_menu)
    mm_init_slot_metadata()
else
{
    play_time = array_create(3, 0)
    most_recent_save = global.slot_selected
}
stop_video = true
button_color_white = 15066597
color_same_title = 4259071
c_hover = 6271986
scr_aggiorna_save_slot(global.slot_selected)
db_load("shared")
difficulty_set_sandbox(true)
difficulty_sandbox_load()
init_globals()
scr_area_data()
lista_skill_2()
lista_base()
camera_set_view_size(view_camera[0], 480, 270)
with (gml_Script_uiGetData())
{
    most_recent_save = other.most_recent_save
    start_sidebar_path = (room == r_menu ? "ZS_vanilla/ui/mm_sidebar_main.ui" : "ZS_vanilla/ui/mm_sidebar_pause.ui")
}
gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Clear()
var _root = uiFileExecute("ZS_vanilla/ui/mm_root.ui")
gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop(_root, "root")
uiInputButtonConsume(_root, "pause")
gml_Script_uiFind(_root, "main frame").gml_Script_uiFind(_root, "main frame").ReplaceFromFile("ZS_vanilla/ui/mm_sidebar.ui")
gml_Script_uiFind(_root, "sidebar frame").gml_Script_uiFind(_root, "sidebar frame").ReplaceFromFile(gml_Script_uiGetData().start_sidebar_path)
if (global.database_cloud_conflict != 0)
{
    gml_Script_uiGetData().cloud_conflict = global.database_cloud_conflict
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_cloud_conflict.ui", "cloud conflict")
}
if (db_read_ext("local settings", "game_version", "version", concat(0, ".", 51, ".", 3)) != concat(0, ".", 51, ".", 3))
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_update.ui", "game update")
keyb_starty = 65
keyb_t_startx = 50
keyb_k_startx = 190
keyb_offset_w = 220
keyb_n_fila = 12
keyb_w = 64
keyb_h = 10
keyb_sep = 11
wait_input = false
key_selected = 0
scr_load_key_bindings()
window_focused = gml_Script_game_in_focus()
new_version = false
new_version_close_x = 399
new_version_close_y = 50
new_version_close_w = 16
db_open("local settings")
new_version = db_read("game_version", "version", concat(0, ".", 51, ".", 3)) != concat(0, ".", 51, ".", 3)
db_write("game_version", "version", concat(0, ".", 51, ".", 3))
if (global.database_cloud_conflict == 0)
    db_write("cloud", "using_cloud", db_cloud_enabled())
db_close()
if db_read_ext("shared settings", "Game analytics", "pop_up", true)
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_game_analytics.ui", "game analytics consent")
scr_load_key_bindings()
window_focused = gml_Script_game_in_focus()
