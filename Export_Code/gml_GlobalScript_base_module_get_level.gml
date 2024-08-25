function base_module_get_level(argument0) //gml_Script_base_module_get_level
{
    if (argument0 < 0 || argument0 >= array_length(global.base_lvl))
    {
        trace_error("Module ID invalid (", argument0, ")")
        return;
    }
    return global.base_lvl[argument0];
}

