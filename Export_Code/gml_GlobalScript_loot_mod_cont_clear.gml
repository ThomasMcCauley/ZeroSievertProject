function loot_mod_cont_clear(argument0) //gml_Script_loot_mod_cont_clear
{
    var _i = 0
    repeat array_length(global.mod_pos_data_array)
    {
        variable_struct_set(argument0, global.mod_pos_data_array[_i], "no_item")
        _i++
    }
}

