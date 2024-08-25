function base_get_module(argument0) //gml_Script_base_get_module
{
    if (argument0 < 0 || argument0 >= array_length(global.sl_base_id))
    {
        trace_error("Slot index invalid (", argument0, ")")
        return;
    }
    return global.sl_base_id[argument0];
}

