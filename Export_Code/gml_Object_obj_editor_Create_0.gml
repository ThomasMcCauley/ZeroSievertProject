var _error;
if (variable_struct_names_count(global.building_filename_dict) <= 0)
{
    @@try_hook@@(92, 148)
    building_index_load("template_index.json")
    @@try_unhook@@()
}
scr_setup_save_databases()
db_load("local settings")
db_load("shared settings")
init_globals()
gamedata_initialize_and_load()
global.slot_selected = 1
scr_aggiorna_save_slot(global.slot_selected)
db_load("shared")
difficulty_reset_all("rookie")
scr_area_data()
lista_base()
lista_skill_2()
skills_load()
lista_skill_factor()
lista_azioni()
lista_quest()
scr_load_key_bindings()
settings_reload_and_apply()
global.is_emission_now = false
camera_set_view_size(view_camera[0], 480, 270)
if (!instance_exists(obj_gamepad))
    instance_create_depth(-1, -1, 0, obj_gamepad)
if (!instance_exists(obj_cursor))
    instance_create_depth(-1, -1, 0, obj_cursor)
mode = (0 << 0)
x = room_width / 2
y = room_height / 2
ris_w = 16
ris_h = 9
spd = 6
gw = room_width div 16
gh = room_height div 16
alarm[1] = 1
alarm[2] = 10
