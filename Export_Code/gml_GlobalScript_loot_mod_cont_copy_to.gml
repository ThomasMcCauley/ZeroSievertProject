function loot_mod_cont_copy_to(argument0, argument1) //gml_Script_loot_mod_cont_copy_to
{
    var _i = 0
    repeat array_length(global.mod_pos_data_array)
    {
        var _mod_pos = global.mod_pos_data_array[_i]
        variable_struct_set(argument1, _mod_pos, variable_struct_get(argument0, _mod_pos))
        _i++
    }
}

