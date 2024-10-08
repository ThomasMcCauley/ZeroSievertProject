function ga_addProgressionEvent() //gml_Script_ga_addProgressionEvent
{
    var status = argument[0]
    if (argument_count == 2)
    {
        if (os_type == os_android)
            extension_stubfunc_real(status, argument[1], "", "")
        else if (os_type == os_ios)
            extension_stubfunc_real(status, argument[1], "", "")
        else if (os_type == os_windows)
            addProgressionEvent_windows(status, argument[1], "", "")
        else if (os_type == os_macosx)
            extension_stubfunc_real(status, argument[1], "", "")
        else if (os_type == os_linux)
            extension_stubfunc_real(status, argument[1], "", "")
        else if (os_type == os_uwp)
            extension_stubfunc_real(status, argument[1], "", "")
    }
    else if (argument_count == 3)
    {
        if is_real(argument[2])
        {
            if (os_type == os_android)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
            else if (os_type == os_ios)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
            else if (os_type == os_windows)
                addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
            else if (os_type == os_macosx)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
            else if (os_type == os_linux)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
            else if (os_type == os_uwp)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])))
        }
        else if (os_type == os_android)
            extension_stubfunc_real(status, argument[1], argument[2], "")
        else if (os_type == os_ios)
            extension_stubfunc_real(status, argument[1], argument[2], "")
        else if (os_type == os_windows)
            addProgressionEvent_windows(status, argument[1], argument[2], "")
        else if (os_type == os_macosx)
            extension_stubfunc_real(status, argument[1], argument[2], "")
        else if (os_type == os_linux)
            extension_stubfunc_real(status, argument[1], argument[2], "")
        else if (os_type == os_uwp)
            extension_stubfunc_real(status, argument[1], argument[2], "")
    }
    else if (argument_count == 4)
    {
        if is_real(argument[3])
        {
            if (os_type == os_android)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
            else if (os_type == os_ios)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
            else if (os_type == os_windows)
                addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
            else if (os_type == os_macosx)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
            else if (os_type == os_linux)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
            else if (os_type == os_uwp)
                extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])))
        }
        else if (os_type == os_android)
            extension_stubfunc_real(status, argument[1], argument[2], argument[3])
        else if (os_type == os_ios)
            extension_stubfunc_real(status, argument[1], argument[2], argument[3])
        else if (os_type == os_windows)
            addProgressionEvent_windows(status, argument[1], argument[2], argument[3])
        else if (os_type == os_macosx)
            extension_stubfunc_real(status, argument[1], argument[2], argument[3])
        else if (os_type == os_linux)
            extension_stubfunc_real(status, argument[1], argument[2], argument[3])
        else if (os_type == os_uwp)
            extension_stubfunc_real(status, argument[1], argument[2], argument[3])
    }
    else if (argument_count == 5)
    {
        if (os_type == os_android)
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
        else if (os_type == os_ios)
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
        else if (os_type == os_windows)
            addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
        else if (os_type == os_macosx)
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
        else if (os_type == os_linux)
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
        else if (os_type == os_uwp)
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])))
    }
}

