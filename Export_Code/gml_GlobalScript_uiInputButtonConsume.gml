function uiInputButtonConsume(argument0, argument1) //gml_Script_uiInputButtonConsume
{
    if (!is_struct(argument0))
        return;
    with (argument0)
    {
        variable_struct_remove(__root.__stateButtonDict, argument1)
        variable_struct_set(__root.__stateButtonConsumeDict, argument1, true)
    }
}

