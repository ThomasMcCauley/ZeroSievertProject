function player_update_weapon_torch() //gml_Script_player_update_weapon_torch
{
    if (!item_exists(arma_now))
        torch_on_general = false
    var _torch_container = torch_container_array[weapon_slot_now]
    if item_weapon_get_moddable(arma_now)
    {
        variable_struct_get(_torch_container.data, "att_1").on = false
        variable_struct_get(_torch_container.data, "att_2").on = false
        variable_struct_get(_torch_container.data, "att_3").on = false
        variable_struct_get(_torch_container.data, "att_4").on = false
    }
    if item_weapon_get_moddable(arma_now)
    {
        player_update_weapon_torch_specific("att_1")
        player_update_weapon_torch_specific("att_2")
        player_update_weapon_torch_specific("att_3")
        player_update_weapon_torch_specific("att_4")
    }
    if variable_struct_get(_torch_container.data, "att_1").have
        variable_struct_get(_torch_container.data, "att_1").on = torch_on_general
    if variable_struct_get(_torch_container.data, "att_2").have
        variable_struct_get(_torch_container.data, "att_2").on = torch_on_general
    if variable_struct_get(_torch_container.data, "att_3").have
        variable_struct_get(_torch_container.data, "att_3").on = torch_on_general
    if variable_struct_get(_torch_container.data, "att_4").have
        variable_struct_get(_torch_container.data, "att_4").on = torch_on_general
}

