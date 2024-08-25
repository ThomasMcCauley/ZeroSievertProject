function npc_get_trader_id(argument0) //gml_Script_npc_get_trader_id
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "trader_id")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .trader_id data")
    _value = npc_get_general(argument0, _value, "trader_id")
    return _value;
}

