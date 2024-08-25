function faction_add_rep(argument0, argument1, argument2) //gml_Script_faction_add_rep
{
    var _index1 = variable_struct_get(global.struct_faction, argument0).index
    var _index2 = variable_struct_get(global.struct_faction, argument1).index
    global.faction_rel[_index1][_index2] += argument2
    global.faction_rel[_index2][_index1] += argument2
    var _max = 1000
    if (argument0 == "Player" || argument1 == "Player")
    {
        if (argument0 == "Player")
            _max = (variable_struct_get(global.struct_faction, argument1).rep_amount_no_join) - 1
        if (argument1 == "Player")
            _max = (variable_struct_get(global.struct_faction, argument0).rep_amount_no_join) - 1
        if (global.faction_joined == "Green Army")
        {
            _max = 1000
            if (argument0 == "Crimson Corporation" || argument1 == "Crimson Corporation")
                _max = 249
        }
        if (global.faction_joined == "Crimson Corporation")
        {
            _max = 1000
            if (argument0 == "Green Army" || argument1 == "Green Army")
                _max = 249
        }
    }
    global.faction_rel[_index1][_index2] = clamp(global.faction_rel[_index1][_index2], 0, _max)
    global.faction_rel[_index2][_index1] = clamp(global.faction_rel[_index2][_index1], 0, _max)
}

