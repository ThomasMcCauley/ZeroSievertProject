function array_push_unique(argument0, argument1) //gml_Script_array_push_unique
{
    var _i = 0
    repeat array_length(argument0)
    {
        if (argument0[_i] == argument1)
            return;
        _i++
    }
    array_push(argument0, argument1)
}

