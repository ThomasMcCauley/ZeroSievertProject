function faction_load() //gml_Script_faction_load
{
    db_open("general")
    global.faction_rel = SnapDeepCopy(db_read("factions", "relationships", 0))
    if (global.faction_rel == 0)
        init_faction_rep()
    var _index = variable_struct_get(global.struct_faction, "Watcher").index
    var _index_friend = variable_struct_get(global.struct_faction, "All Friend").index
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
        {
            if (i == _index || j == _index)
                global.faction_rel[i][j] = 0
            if (i == _index && j == _index)
                global.faction_rel[i][j] = 1000
            if (i == _index_friend || j == _index_friend)
                global.faction_rel[i][j] = 1000
        }
    }
    global.faction_joined = SnapDeepCopy(db_read("factions", "joined", ""))
    db_close()
}

