function ui_stash_populate(argument0) //gml_Script_ui_stash_populate
{
    if (!player_exists_local())
        return;
    ui_stash_close()
    with (gml_Script_uiGetData())
    {
        loot_name = language_get_string("Stash") + " " + (string(argument0 + 1))
        stash_page = argument0
    }
    var _loot_array = db_read_ext("chest", ("chest_" + string(argument0)), "items", [])
    var _i = 0
    repeat array_length(_loot_array)
    {
        ui_convert_loot_to_element(_loot_array[_i], gml_Script_class_ui_item, "other inventory")
        _i++
    }
}

