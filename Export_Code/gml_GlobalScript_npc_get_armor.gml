function npc_get_armor(argument0) //gml_Script_npc_get_armor
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _armor = variable_struct_get(_struct, "armor")
    if (_armor == undefined)
        trace_error("NPC \"", argument0, "\" has no .armor data")
    _armor = npc_get_general(argument0, _armor, "armor")
    if is_array(_armor)
        return _armor[irandom(array_length(_armor) - 1)];
    return _armor;
}

