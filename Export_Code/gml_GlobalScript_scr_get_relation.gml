function scr_get_relation(argument0, argument1) //gml_Script_scr_get_relation
{
    var _mine = argument0
    var _other = argument1
    if (object_index == obj_controller)
        var _rel = faction_get_rep(_mine, _other)
    else
        _rel = faction_get_rep_temp(_mine, _other)
    if (_rel < 250)
        var _temp_rel = (2 << 0)
    if (_rel >= 250 && _rel <= 600)
        _temp_rel = (0 << 0)
    if (_rel > 600)
        _temp_rel = (1 << 0)
    return _temp_rel;
}

