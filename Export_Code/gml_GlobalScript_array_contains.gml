function array_contains(argument0, argument1) //gml_Script_array_contains
{
    var _i = 0
    repeat array_length(argument0)
    {
        if (argument0[_i] == argument1)
            return true;
        _i++
    }
    return false;
}

