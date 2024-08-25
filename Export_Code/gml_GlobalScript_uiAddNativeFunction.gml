function uiAddNativeFunction(argument0, argument1) //gml_Script_uiAddNativeFunction
{
    if (argument1 == undefined)
        argument1 = script_get_name(argument0)
    gml_Script___uiGlobal().__catspeakEnv.gml_Script___uiGlobal().__catspeakEnv.addGlobalFunction(argument1, argument0)
}

