function uiDebugBreak() //gml_Script_uiDebugBreak
{
    if debug_mode
        __uiTrace("uiDebugBreak() ", debug_get_callstack())
}

