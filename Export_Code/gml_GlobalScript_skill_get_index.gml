function skill_get_index(argument0) //gml_Script_skill_get_index
{
    if is_numeric(argument0)
        return argument0;
    var _i = 0
    repeat array_length(global.sk_name)
    {
        if (global.sk_name[_i] == argument0)
            return _i;
        _i++
    }
    return undefined;
}

