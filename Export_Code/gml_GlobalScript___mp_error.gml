function __mp_error() //gml_Script___mp_error
{
    var _string = "MP:\n"
    var _i = 0
    repeat argument_count
    {
        _string += string(argument[_i])
        _i++
    }
    trace(_string)
    show_error((_string + "\n "), true)
}

