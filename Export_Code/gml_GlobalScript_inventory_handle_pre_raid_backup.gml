function inventory_handle_pre_raid_backup(argument0, argument1) //gml_Script_inventory_handle_pre_raid_backup
{
    if (argument1 == undefined)
        argument1 = true
    if argument0
    {
        db_open("pre_raid")
        var _write_loot_array = db_read("Inventory", "items", [])
        var _write_npc_section = SnapDeepCopy(db_section_read("NPC"))
        var _new_loot_array = SnapDeepCopy(_write_loot_array)
        loot_array_remove_gambled_items(_new_loot_array)
        db_write("Inventory", "items", _new_loot_array)
        db_close()
        scr_save_player_status()
    }
    else
    {
        db_open((argument1 ? "raid" : "pre_raid"))
        _write_loot_array = SnapDeepCopy(db_read("Inventory", "items", []))
        _write_npc_section = SnapDeepCopy(db_section_read("NPC"))
        db_close()
    }
    if argument0
    {
        var _source = "pre_raid"
        var _destination = "raid"
    }
    else
    {
        _source = "raid"
        _destination = "pre_raid"
    }
    db_open(_destination)
    db_write("player", "hp", db_read_ext(_source, "player", "hp", 100))
    db_write("player", "hp_max", db_read_ext(_source, "player", "hp_max", 100))
    db_write("player", "energy", db_read_ext(_source, "player", "energy", 90))
    db_write("player", "thirst", db_read_ext(_source, "player", "thirst", 90))
    db_write("player", "fatigue", db_read_ext(_source, "player", "fatigue", 100))
    db_write("player", "radiation", db_read_ext(_source, "player", "radiation", 0))
    db_write("player", "wound", db_read_ext(_source, "player", "wound", 0))
    db_write("stats", "money", db_read_ext(_source, "stats", "money", 0))
    db_write("Inventory", "items", _write_loot_array)
    db_section_write("NPC", _write_npc_section)
    db_close()
}

