function base_load() //gml_Script_base_load
{
    db_open("general")
    for (var i = 0; i < array_length_1d(global.base_id); i++)
    {
        var get_id = global.base_id[i]
        var k = 0
        if (get_id == (2 << 0))
            k = 0
        global.base_lvl[get_id] = db_read("Base", string(get_id), k)
    }
    for (i = 0; i < array_length_1d(global.sl_id); i++)
    {
        get_id = global.sl_id[i]
        k = -1
        var kk = 0
        if (get_id == (0 << 0))
        {
            k = (2 << 0)
            kk = 2
        }
        global.sl_base_id[get_id] = db_read("Base slot", string(get_id), k)
        global.sl_free[get_id] = db_read("Base slot occupato", string(get_id), kk)
    }
    db_close()
}

