function base_find_slot(argument0) //gml_Script_base_find_slot
{
    var _i = 0
    repeat array_length(global.sl_base_id)
    {
        if (global.sl_base_id[_i] == argument0)
            return _i;
        _i++
    }
    return undefined;
}

