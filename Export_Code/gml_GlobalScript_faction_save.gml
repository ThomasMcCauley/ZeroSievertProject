function faction_save() //gml_Script_faction_save
{
    db_open("general")
    db_write("factions", "relationships", SnapDeepCopy(global.faction_rel))
    db_write("factions", "joined", SnapDeepCopy(global.faction_joined))
    db_close()
}

