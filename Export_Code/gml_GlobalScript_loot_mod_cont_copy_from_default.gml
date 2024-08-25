function loot_mod_cont_copy_from_default(argument0, argument1) //gml_Script_loot_mod_cont_copy_from_default
{
    var _i = 0
    repeat array_length(global.mod_pos_data_array)
    {
        var _mod_pos = global.mod_pos_data_array[_i]
        variable_struct_set(argument0, _mod_pos, gml_Script_item_weapon_pos_get_default_id(argument1, _mod_pos))
        _i++
    }
}

