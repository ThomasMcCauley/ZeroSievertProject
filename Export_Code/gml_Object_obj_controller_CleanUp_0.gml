debris_splat_map.debris_splat_map.Destroy()
mp_grid_destroy(global.grid_move)
if ds_exists(grid_motion, 5)
    ds_grid_destroy(grid_motion)
if ds_exists(grid_quest, 5)
    ds_grid_destroy(grid_quest)
function anon_gml_Object_obj_controller_CleanUp_0_250_gml_Object_obj_controller_CleanUp_0(argument0) //gml_Script_anon_gml_Object_obj_controller_CleanUp_0_250_gml_Object_obj_controller_CleanUp_0
{
    if variable_global_exists(argument0)
    {
        var _list = variable_global_get(argument0)
        if ds_exists(_list, 2)
            ds_list_destroy(_list)
    }
}

self._func_destroy_list("list_interact")
self._func_destroy_list("list_interact_id")
self._func_destroy_list("list_interact_task_pos")
self._func_destroy_list("list_ammo_id")
self._func_destroy_list("list_ammo_qnt")
self._func_destroy_list("list_status_id")
self._func_destroy_list("list_mod_avaible")
self._func_destroy_list("list_mod_avaible_x")
self._func_destroy_list("list_mod_avaible_y")
self._func_destroy_list("list_dynamic_npc")
self._func_destroy_list("list_dynamic_npc_x")
self._func_destroy_list("list_dynamic_npc_y")
self._func_destroy_list("list_status_id")
self._func_destroy_list("list_quest_before_map_npc_name")
self._func_destroy_list("list_quest_before_map_quest_id")
self._func_destroy_list("list_quest_before_map_quest_premio")
function anon_gml_Object_obj_controller_CleanUp_0_1223_gml_Object_obj_controller_CleanUp_0(argument0) //gml_Script_anon_gml_Object_obj_controller_CleanUp_0_1223_gml_Object_obj_controller_CleanUp_0
{
    if variable_global_exists(argument0)
    {
        var _grid = variable_global_get(argument0)
        if ds_exists(_grid, 5)
            ds_grid_destroy(_grid)
    }
}

self._func_destroy_grid("grid_faction")
surface_free(surface_testo)
surface_testo = -1
