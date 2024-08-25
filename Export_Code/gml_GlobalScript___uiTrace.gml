function __uiTrace() //gml_Script___uiTrace
{
    var _string = ""
    var _i = 0
    repeat argument_count
    {
        _string += string(argument[_i])
        _i++
    }
    var _UI_TRACE = gml_Script_uiTrace
    if (_UI_TRACE != undefined)
        self._UI_TRACE(_string)
}

