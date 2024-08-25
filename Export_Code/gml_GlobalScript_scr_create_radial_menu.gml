function scr_create_radial_menu(argument0) //gml_Script_scr_create_radial_menu
{
    if instance_exists(obj_player)
    {
        instance_destroy(obj_radial_menu)
        var _inst = instance_create_depth(0, 0, 0, obj_radial_menu)
        _inst.options_data = argument0
    }
}

