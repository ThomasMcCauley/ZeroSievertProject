function loot_mod_cont_get(argument0, argument1) //gml_Script_loot_mod_cont_get
{
    if (!is_struct(argument0))
        return "no_item";
    if (argument1 == undefined)
        return "no_item";
    var _item = variable_struct_get(argument0, argument1)
    if (_item == undefined)
        _item = "no_item"
    return _item;
}

