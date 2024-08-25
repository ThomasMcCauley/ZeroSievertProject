function loot_mod_cont_get_stats(argument0, argument1) //gml_Script_loot_mod_cont_get_stats
{
    if (argument1 == undefined)
        argument1 = undefined
    if (argument1 == undefined)
        argument1 = new class_weapon_stats()
    if (argument0 == undefined)
        return undefined;
    with (argument1)
    {
        var _i = 0
        repeat array_length(global.mod_pos_data_array)
        {
            var _item = variable_struct_get(argument0, global.mod_pos_data_array[_i])
            if item_exists(_item)
            {
                recoil += item_mod_get_recoil(_item)
                ergo += item_mod_get_ergo(_item)
                acc += item_mod_get_acc(_item)
                damage += item_mod_get_damage(_item)
                reload_speed += item_mod_get_reload_speed(_item)
            }
            _i++
        }
    }
    return argument1;
}

