function crafting_mode_get_ui_constructor(argument0) //gml_Script_crafting_mode_get_ui_constructor
{
    if (!(variable_struct_exists(global.crafting_mode_dict, argument0)))
    {
        trace_error("Crafting mode \"", argument0, "\" not recognised")
        return;
    }
    return variable_struct_get(global.crafting_mode_dict, argument0).ui_constructor;
}

