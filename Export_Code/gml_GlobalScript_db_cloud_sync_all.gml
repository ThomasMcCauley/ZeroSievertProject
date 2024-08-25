function db_cloud_sync_all(argument0) //gml_Script_db_cloud_sync_all
{
    if (argument0 == undefined)
        argument0 = 0
    db_cloud_sync("settings_shared.json", argument0)
    var _index = 1
    repeat (3)
    {
        db_cloud_sync(("save_shared_" + string(_index) + ".dat"), argument0)
        _index++
    }
}

