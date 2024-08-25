function db_cloud_get_hash(argument0) //gml_Script_db_cloud_get_hash
{
    __db_trace("Checking hash for \"", argument0, "\" in Steam Cloud")
    if (!db_cloud_enabled())
    {
        __db_trace("Cloud not enabled")
        return undefined;
    }
    if (!steam_file_exists(argument0))
    {
        __db_trace("File does not exist, returning <undefined>")
        return undefined;
    }
    var _text = steam_file_read(argument0)
    var _hash = md5_string_utf8(_text)
    return _hash;
}

