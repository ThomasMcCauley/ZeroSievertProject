function crafting_go_to_modding(argument0) //gml_Script_crafting_go_to_modding
{
    if (argument0 == undefined)
        return;
    with (gml_Script_uiGetData())
    {
        modding_loot = argument0
        modding_mod_pos = undefined
    }
    if gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerExists("modding layer")
        gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerDelete("modding layer")
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modding.ui", "modding layer")
}

