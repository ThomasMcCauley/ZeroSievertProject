var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiMinimap", gml_Script_class_ui_minimap)
function class_ui_minimap() constructor //gml_Script_class_ui_minimap
{
    color = 16777215
    alpha = 1
    scr_draw_surface_cover()
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    if instance_exists(obj_minimap)
    {
        var _surface = obj_minimap.surface_map
        self.Set("size", [(4 * surface_get_width(_surface)), (4 * surface_get_height(_surface))])
    }
    self.CallbackSetStep(function() //gml_Script_anon_class_ui_minimap_gml_GlobalScript_class_ui_minimap_977_class_ui_minimap_gml_GlobalScript_class_ui_minimap
    {
        gml_Script_uiCallInherited()
        if (self.Get("width") == 0 || self.Get("height") == 0)
        {
            _surface = obj_minimap.surface_map
            self.Set("size", [(4 * surface_get_width(_surface)), (4 * surface_get_height(_surface))])
        }
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_minimap_gml_GlobalScript_class_ui_minimap_1299_class_ui_minimap_gml_GlobalScript_class_ui_minimap
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        gpu_set_blendenable(false)
        draw_surface_ext(obj_minimap.surface_map, __drawLeft, __drawTop, 4, 4, 0, _color, _alpha)
        gpu_set_blendenable(true)
        draw_surface_ext(obj_minimap.surface_cover, __drawLeft, __drawTop, 4, 4, 0, _color, _alpha)
        if global.general_debug
        {
            var _size = array_length(global.list_n_id)
            if (_size > 0)
            {
                for (var i = 0; i < _size; i++)
                {
                    var _x = global.list_n_x[i] div 16
                    var _y = global.list_n_y[i] div 16
                    var _col = c_white
                    if global.list_n_follow_path[i]
                        _col = c_yellow
                    if (global.list_n_hp[i] <= 0)
                        _col = c_red
                    if (global.list_n_npc_id[i] == "arman")
                        _col = 16776960
                    draw_sprite_ext(s_1pixel, 0, (__drawLeft + 4 * (_x - 1)), (__drawTop + 4 * (_y - 1)), 4, 4, 0, _col, 1)
                }
            }
            if (global.show_dynamic_npc_path && _size > 0)
            {
                for (i = 0; i < _size; i++)
                {
                    language_set_font((0 << 0))
                    draw_set_halign(fa_center)
                    if (global.list_n_id[i] != noone)
                    {
                        var _path_amount_max = ds_list_size(global.list_n_id[i].lista_path_x) - 1
                        if (_path_amount_max > 1)
                        {
                            for (var j = 0; j < _path_amount_max; j++)
                            {
                                var _x1 = (ds_list_find_value(global.list_n_id[i].lista_path_x, j)) div 16
                                var _y1 = (ds_list_find_value(global.list_n_id[i].lista_path_y, j)) div 16
                                var _x2 = (ds_list_find_value(global.list_n_id[i].lista_path_x, (j + 1))) div 16
                                var _y2 = (ds_list_find_value(global.list_n_id[i].lista_path_y, (j + 1))) div 16
                                draw_line_width_color((__drawLeft + 4 * _x1), (__drawTop + 4 * _y1), (__drawLeft + 4 * _x2), (__drawTop + 4 * _y2), 1, global.list_n_id[i].path_color, global.list_n_id[i].path_color)
                            }
                        }
                    }
                }
            }
        }
    }
)
}

