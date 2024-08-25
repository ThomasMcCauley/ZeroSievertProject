function base_module_get_sprite(argument0) //gml_Script_base_module_get_sprite
{
    if (argument0 < 0 || argument0 >= array_length(global.base_sprite))
    {
        trace_error("Module ID invalid (", argument0, ")")
        return;
    }
    return global.base_sprite[argument0];
}

