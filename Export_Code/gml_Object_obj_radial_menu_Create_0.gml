options_data = []
current_selected = -1
number_of_options = 8
function anon_gml_Object_obj_radial_menu_Create_0_210_gml_Object_obj_radial_menu_Create_0() //gml_Script_anon_gml_Object_obj_radial_menu_Create_0_210_gml_Object_obj_radial_menu_Create_0
{
    return (keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_right) || obj_gamepad.input_released[(13 << 0)] || obj_gamepad.input_released[(12 << 0)] || obj_gamepad.input_released[(1 << 0)] || player_all_dead() || (instance_exists(obj_train) && obj_train.state != (6 << 0)));
}

function anon_gml_Object_obj_radial_menu_Create_0_554_gml_Object_obj_radial_menu_Create_0() //gml_Script_anon_gml_Object_obj_radial_menu_Create_0_554_gml_Object_obj_radial_menu_Create_0
{
    return (keyboard_check_pressed(vk_return) || mouse_check_button_pressed(mb_left) || obj_gamepad.input_pressed[(18 << 0)] || obj_gamepad.input_pressed[(25 << 0)] || obj_gamepad.input_pressed[(0 << 0)] || obj_gamepad.action[(32 << 0)].released || obj_gamepad.action[(31 << 0)].released);
}

angle_of_option = 360 / number_of_options
