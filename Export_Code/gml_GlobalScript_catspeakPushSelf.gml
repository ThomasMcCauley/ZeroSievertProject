function catspeakPushSelf(argument0) //gml_Script_catspeakPushSelf
{
    if (global.__catspeakCurrentFunction == undefined)
        __catspeak_error("catspeakPushSelf() must only be called whilst a function is executing")
    argument0.argument0.pushSelf(global.__catspeakCurrentFunction)
}

