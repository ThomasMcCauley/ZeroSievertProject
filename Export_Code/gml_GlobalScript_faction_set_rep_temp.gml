function faction_set_rep_temp(argument0, argument1, argument2) //gml_Script_faction_set_rep_temp
{
    var _index1 = variable_struct_get(global.struct_faction, argument0).index
    var _index2 = variable_struct_get(global.struct_faction, argument1).index
    global.faction_rel_temp[_index1][_index2] = argument2
    global.faction_rel_temp[_index2][_index1] = argument2
}

