function __db_trace() //gml_Script___db_trace
{
    var _string = "DB: "
    var _i = 0
    repeat argument_count
    {
        _string += string(argument[_i])
        _i++
    }
    trace(_string)
}

