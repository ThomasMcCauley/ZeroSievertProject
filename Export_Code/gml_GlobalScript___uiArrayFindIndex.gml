function __uiArrayFindIndex(argument0, argument1) //gml_Script___uiArrayFindIndex
{
    var _i = 0
    repeat array_length(argument0)
    {
        if (argument0[_i] == argument1)
            return _i;
        _i++
    }
    return undefined;
}

