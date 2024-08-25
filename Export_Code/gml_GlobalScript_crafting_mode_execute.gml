function crafting_mode_execute(argument0, argument1) //gml_Script_crafting_mode_execute
{
    if (!(variable_struct_exists(global.crafting_mode_dict, argument0)))
    {
        trace_error("Crafting mode \"", argument0, "\" not recognised")
        return;
    }
    return argument1.argument1.crafting_function(variable_struct_get(global.crafting_mode_dict, argument0));
}

