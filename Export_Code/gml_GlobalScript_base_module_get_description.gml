function base_module_get_description(argument0) //gml_Script_base_module_get_description
{
    if (argument0 < 0 || argument0 >= array_length(global.base_des_general))
    {
        trace_error("Module ID invalid (", argument0, ")")
        return;
    }
    return global.base_des_general[argument0];
}

