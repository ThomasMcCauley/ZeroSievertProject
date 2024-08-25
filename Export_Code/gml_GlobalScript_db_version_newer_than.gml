function db_version_newer_than(argument0, argument1, argument2, argument3) //gml_Script_db_version_newer_than
{
    var _major = gml_Script_db_meta_read(argument0, "version_major", 0)
    var _minor = gml_Script_db_meta_read(argument0, "version_minor", 51)
    var _patch = gml_Script_db_meta_read(argument0, "version_patch", 3)
    if (is_string(argument1) || is_string(argument2) || is_string(argument3))
        return false;
    if (is_string(_major) || is_string(_minor) || is_string(_patch))
        return false;
    return (_major > argument1 || _minor > argument2 || _patch > argument3);
}

