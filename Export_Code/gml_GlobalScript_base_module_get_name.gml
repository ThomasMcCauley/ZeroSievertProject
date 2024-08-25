function base_module_get_name(argument0) //gml_Script_base_module_get_name
{
    if (argument0 < 0 || argument0 >= array_length(global.base_name))
    {
        trace_error("Module ID invalid (", argument0, ")")
        return;
    }
    return language_get_string(global.base_name[argument0]);
}

