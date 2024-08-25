/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
lista_text()
gamedata_trader_calculate_shared_money()
hspd = 0
vspd = 0
alarm[10] = 3
alarm[11] = 2
if is_in_raid()
    alarm[7] = 1
shader_hit_size = shader_get_uniform(shd_flash_hit_blocked, "texture_pixel")
shader_outline_color = shader_get_uniform(shd_flash_hit_blocked, "outline_color")
emitter_shoot = audio_emitter_create()
audio_emitter_falloff(emitter_shoot, 128, 500, 1)
emitter_walk = audio_emitter_create()
audio_emitter_falloff(emitter_walk, 16, 164, 1)
emitter_talk = audio_emitter_create()
audio_emitter_falloff(emitter_talk, 32, 164, 1)
play_sound_death = true
grid_faction_my = ds_grid_create(10, 10)
ds_grid_clear(grid_faction_my, 150)
npc_id = "dummy"
npc_name = "???"
npc_speaker_id = "no_speaker"
follow_path = false
path_goto_x[0] = 0
path_goto_y[0] = 0
path_create_now = false
lista_path_x = ds_list_create()
lista_path_y = ds_list_create()
path_position_now = 0
path_color = make_color_rgb(irandom(255), irandom(255), irandom(255))
timer_visible = 0
timer_visible_max = 45
last_seen_x = 0
last_seen_y = 0
last_known_x = 0
last_known_y = 0
last_my_target_seen_x = 0
last_my_target_seen_y = 0
last_shot_x = 0
last_shot_y = 0
last_target_cover_x = 0
last_target_cover_y = 0
last_patrol_x = 0
last_patrol_y = 0
last_seen_delay_x = 0
last_seen_delay_y = 0
last_seen_delay_timer = 0
last_seen_delay_timer_max = 45
last_seen_delay = false
move_point_x = 0
move_point_y = 0
enemy_seen = false
target_seen = false
image_xscale_before = 1
draw_weapon = true
create_item_in_chest = true
dead_outside_game_window = false
original_x = x
original_y = y
walk_time = 0
dir_attack = 0
can_attack = true
first_shot_from_player = false
attack_recovery = 70
money_trader = 0
path_timer_reset = 30
path_timer = path_timer_reset
path_to_target = path_add()
shooting = false
reloading = false
recoil_total = 3
target = -4
search_target_id = -4
target_relation = (0 << 0)
target_seen = -4
can_be_damaged = true
shader_hit = "BULLET_HIT_NONE"
hit = false
grenade_close_id = -4
grenade_can_cover = false
grenade_amount_thrown = 0
grenade_flash = false
grenade_flash_timer = 0
grenade_flash_timer_max = 300
flash_weapon_dir_timer = 0
flash_weapon_dir_timer_max = 60
flash_weapon_dir = 0
grenade_smoke = false
hp_set = false
reset_state_to_patrol_time = 600
timer_recheck_eff_range = 0
timer_recheck_eff_range_max = 60
precision_uneffective_range = 30
can_shoot_uneffective_range = false
timer_shoot_uneffective_range = 0
timer_shoot_uneffective_range_max = 45
weapon_pointing_direction = irandom(360)
weapon_pointing_angle = 1
weapon_pointing_amount = 0
target_for_image_scale = 0
alarm[3] = 10
riflessi = 0
riflessi_max = 0
reflexes_distance = 0
reflexes_angle = 0
reflexes_can_change = true
reflexes_shot = false
reflex_min_distance_last_known = 30
quest_max = 0
armor_dur = 100
shoot_time = 0
shoot_time_max = 60
red_blood = true
unstuck_counter_timer = 0
unstuck_counter_timer_max = 15
unstuck_counter = 0
unstuck_counter_max = 10
ammo_magazine = -1
ammo_now = 0
arma_now = "makarov"
mod_container = loot_mod_cont_create()
loot_mod_cont_copy_from_default(mod_container, arma_now)
ammo_id_now = "no_item"
alpha_ = 1
a_gain = 0.1
can_talk = true
prev_state = -1
can_talk_reset = false
can_talk_reset_timer = 0
can_talk_reset_timer_max = 180
quest_contract_is_me = false
quest_contract_grid_pos = -1
sprite_before = 2054
state_before = 0
bullet_checked = false
tick = 0
tick_max = 10
linked_weapon_id = -4
ani_end = false
wolf_alert_raggio2 = 64
wolf_ululato = 0
wolf_ululato_max = 0
tick_now = 0
tick_max = 6
tick_from_roof = false
pos_now = 0
node_running_now = 0
node_child_now = 0
node_state_now = 3
node_action_state = 2
alert_player = 0
alert_player_max_value = 45
alert_player_max = alert_player_max_value
last_seen_x = 0
last_seen_y = 0
last_cover_pos_x = 0
last_cover_pos_y = 0
angle_min_to_rotate = 10
angle_increase_for_target = 6
bt_action_timer_now = 0
direction_to_aim = 0
dir_to_aim_x = 0
dir_to_aim_y = 0
need_reload_already_check = false
var i = 0
tree_id[i] = (18 << 0)
tree_parent[i] = 4
tree_pos[i] = 0
tree_child[i] = []
i = 1
tree_id[i] = (19 << 0)
tree_parent[i] = 3
tree_pos[i] = 1
tree_child[i] = []
i = 2
tree_id[i] = (7 << 0)
tree_parent[i] = 3
tree_pos[i] = 2
tree_child[i] = []
i = 3
tree_id[i] = (2 << 0)
tree_parent[i] = 4
tree_pos[i] = 3
tree_child[i] = [2, 1]
i = 4
tree_id[i] = (1 << 0)
tree_parent[i] = 9
tree_pos[i] = 4
tree_child[i] = [3, 0]
i = 5
tree_id[i] = (5 << 0)
tree_parent[i] = 7
tree_pos[i] = 5
tree_child[i] = []
i = 6
tree_id[i] = (17 << 0)
tree_parent[i] = 8
tree_pos[i] = 6
tree_child[i] = []
i = 7
tree_id[i] = (4 << 0)
tree_parent[i] = 8
tree_pos[i] = 7
tree_child[i] = [5]
i = 8
tree_id[i] = (2 << 0)
tree_parent[i] = 9
tree_pos[i] = 8
tree_child[i] = [7, 6]
i = 9
tree_id[i] = (1 << 0)
tree_parent[i] = 10
tree_pos[i] = 9
tree_child[i] = [8, 4]
i = 10
tree_id[i] = (0 << 0)
tree_parent[i] = -1
tree_pos[i] = 10
tree_child[i] = [9]
var _size = array_length(tree_id)
pos_roof = 0
for (i = 0; i < _size; i++)
{
    if (tree_parent[i] == -1)
        pos_roof = i
}
for (i = 0; i < _size; i++)
{
    tree_node[i] = global.node_type[tree_id[i]]
    tree_condition_checked[i] = 9999
    tree_condition_checked_max[i] = global.node_check_condition_max[tree_id[i]]
    tree_condition_now[i] = false
}
recoil_shooting = 0
recoil_arma = 0
human_tick = 0
human_tick_max = 7
human_tick_max_ref = human_tick_max
human_state_now = -1
human_state_before = 0
target_visto = false
id_target_non_visto = -4
state_finito = true
direction_to_aim = 0
dir_to_aim_x = 0
dir_to_aim_y = 0
timer_searching_target = 0
timer_searching_target_max = 900
timer_last_state = 0
timer_last_state_max = 10000
angle_min_to_rotate = 10
angle_increase_for_target = 6
shooted_first_time = 0
chase_new_target_location = false
target_visto_prima_volta = false
alleato_morto_vicino = 0
ally_morto_x = 0
ally_morto_y = 0
id_chest_ally_dead = -4
id_of_the_killer = -4
have_to_reload = true
hear_target_shoot = false
must_take_cover = false
just_shot = 0
counter_target_seen_neutral = 0
timer_see_neutral = 0
timer_see_neutral_max = 180
text_type_neutral = 0
neutral_distance_target = 80
counter_target_cover = 0
counter_target_cover_max = 5
counter_target_toggle = true
aim_still_timer = 4000
debug_next_state = 0
tipo_arma_equipped = (0 << 0)
debug_chance_chase = 0
function anon_gml_Object_obj_npc_parent_Create_0_14019_gml_Object_obj_npc_parent_Create_0() //gml_Script_anon_gml_Object_obj_npc_parent_Create_0_14019_gml_Object_obj_npc_parent_Create_0
{
    if weapon_modded
        return;
    weapon_modded = true
    if item_weapon_get_moddable(arma_now)
    {
        arma_now.arma_now.CopyFromWeaponDefaults(mod_container)
        if (npc_id == "killa")
        {
            mod_container.mod_container.Initialize()
            "stock".("stock").Set("mod_rpk_stock", mod_container)
            "grip".("grip").Set("mod_rpk_grip", mod_container)
            "handguard".("handguard").Set("mod_rpk_handguard_1", mod_container)
            "magazine".("magazine").Set("mod_rpk_magazine", mod_container)
            "scope".("scope").Set("mod_scope_mrs", mod_container)
            "att_1".("att_1").Set("mod_foregrip_1", mod_container)
            "att_2".("att_2").Set("mod_torch_2", mod_container)
            "att_4".("att_4").Set("mod_laser_rosso", mod_container)
        }
        else
        {
            var _random_mods = npc_get_attachment_value(npc_id).npc_get_attachment_value(npc_id).Generate(variable_struct_get(global.item_possible_mod_data, arma_now))
            mod_container.mod_container.ChooseAll(_random_mods)
        }
        var _stats = item_weapon_get_modded_stats(arma_now, mod_container)
        recoil_arma = _stats.recoil
        ammo_now = item_weapon_get_modded_magazine_size(arma_now, mod_container)
    }
}

