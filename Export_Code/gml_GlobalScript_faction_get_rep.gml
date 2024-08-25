function faction_get_rep(argument0, argument1) //gml_Script_faction_get_rep
{
    var _index1 = variable_struct_get(global.struct_faction, argument0).index
    var _index2 = variable_struct_get(global.struct_faction, argument1).index
    return global.faction_rel[_index1][_index2];
}

