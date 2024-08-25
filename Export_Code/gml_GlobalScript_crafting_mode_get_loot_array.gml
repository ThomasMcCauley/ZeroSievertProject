function crafting_mode_get_loot_array(argument0) //gml_Script_crafting_mode_get_loot_array
{
    if (!(variable_struct_exists(global.crafting_mode_dict, argument0)))
    {
        trace_error("Crafting mode \"", argument0, "\" not recognised")
        return;
    }
    return variable_struct_get(global.crafting_mode_dict, argument0).variable_struct_get(global.crafting_mode_dict, argument0).loot_generator_function();
}

