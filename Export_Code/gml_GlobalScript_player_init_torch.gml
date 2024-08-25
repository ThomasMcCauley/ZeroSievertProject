function player_init_torch() //gml_Script_player_init_torch
{
    torch_on_general = false
    torch_container_array = array_create((17 << 0), undefined)
    var _i = 0
    repeat (17 << 0)
    {
        torch_container_array[_i] = new class_torch_container()
        _i++
    }
}

