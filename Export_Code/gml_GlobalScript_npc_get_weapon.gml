function npc_get_weapon(argument0) //gml_Script_npc_get_weapon
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _weapon = variable_struct_get(_struct, "arma")
    if (_weapon == undefined)
        trace_error("NPC \"", argument0, "\" has no .arma data")
    if (!is_array(_weapon))
        _weapon = npc_get_general(argument0, _weapon, "arma")
    if is_array(_weapon)
        return _weapon[irandom(array_length(_weapon) - 1)];
    return _weapon;
}

