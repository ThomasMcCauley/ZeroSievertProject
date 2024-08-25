function uiDestroy(argument0) //gml_Script_uiDestroy
{
    if (!is_struct(argument0))
        return;
    argument0.argument0.Destroy()
}

