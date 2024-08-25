function npc_get_damage_melee(argument0) //gml_Script_npc_get_damage_melee
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "damage_melee")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .damage_melee data")
    _value = npc_get_general(argument0, _value, "damage_melee")
    return _value;
}

