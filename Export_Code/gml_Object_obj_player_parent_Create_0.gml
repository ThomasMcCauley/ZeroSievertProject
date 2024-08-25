/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_db_save_if_changed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_save_if_changed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
lista_skill_2()
skills_load()
lista_base()
player_init_weapons()
player_init_laser()
player_init_torch()
instance_create_depth(x, y, 0, obj_light_general, 
{
    follow_id: id
}
)
weapon_holder = new class_player_weapon(id)
arms_holder = undefined
torch_holder = -4
arma_now = "no_item"
armor_now = "no_item"
backpack_now = "no_item"
headset_now = "no_item"
emitter_shoot = audio_emitter_create()
audio_emitter_falloff(emitter_shoot, 256, 400, 1)
emitter_walk = audio_emitter_create()
audio_emitter_falloff(emitter_shoot, 64, 96, 1)
hit = false
hit_shader = "BULLET_HIT_NONE"
sprite_idle = s_pg1_idle
sprite_run = 56
sprite_dead = 57
sprite_index = sprite_idle
switching_weapon = false
switching_weapon_now = 0
switching_weapon_max = 60
switching_weapon_max_now = switching_weapon_max
next_weapon_slot = (1 << 0)
switching_fase = 0
hspd = 0
vspd = 0
faction = "Player"
reloading = false
state_reload = (4 << 0)
reload_cocking = false
shooting = true
shoot_input = false
shoot_input_delay = 0
shoot_stop_ani = false
alarm[1] = 30
aiming = false
is_indoor = false
max_weight = 0
player_weight = 0
can_run_after_exit_building = true
can_run_after_exit_building_timer = 0
recoil_from_movement = 0
recoil_from_shooting = 0
recoil_from_moving_mouse = 0
recoil_total = 0
total_ergo = 0
total_precision = 0
image_speed_move_current = 0.4
weapon_pointing_direction = 0
aim_point_x = obj_cursor.aa_x
aim_point_y = obj_cursor.aa_y
laser_startx = 0
laser_starty = 0
player_set_state(gml_Script_scr_player_state_move, mp_index)
if is_in_raid()
    player_set_state(gml_Script_scr_player_state_start, mp_index)
else if is_in_hub()
{
    player_set_state(gml_Script_scr_player_state_start, mp_index)
    alarm[4] = 3
}
