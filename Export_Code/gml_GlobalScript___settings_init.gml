global.__settings_data = {}
global.__settings_write_to_disk = true
__settings_define_range("master volume", "local settings", "settings", 1, 0, 1, function(argument0) //gml_Script_anon_5242184B_172
{
    audio_master_gain(argument0)
}
)
__settings_define_range("radiation volume", "local settings", "settings", 0.8, 0, 1, function(argument0) //gml_Script_anon_5242184B_314
{
    audio_group_set_gain(3, argument0, 1)
}
)
__settings_define_range("heart volume", "local settings", "settings", 0.6, 0, 1, function(argument0) //gml_Script_anon_5242184B_473
{
    audio_group_set_gain(13, argument0, 1)
}
)
__settings_define_range("main volume", "local settings", "settings", 0.7, 0, 1, function(argument0) //gml_Script_anon_5242184B_639
{
    audio_group_set_gain(14, argument0, 1)
}
)
__settings_define_range("amount grass", "local settings", "settings", 0.6, 0, 1)
__settings_define_toggle("dynamic grass", "local settings", "settings", true)
__settings_define_toggle("fog rain", "local settings", "settings", true)
__settings_define_toggle("low spec", "local settings", "settings", false)
__settings_define_toggle("fullscreen", "local settings", "settings", true, function(argument0) //gml_Script_anon_5242184B_1174
{
    window_set_fullscreen(argument0)
}
)
__settings_define_toggle("fog of war", "shared settings", "settings", true)
__settings_define_range("fog of war alpha", "shared settings", "settings", 0.25, 0, 1)
__settings_define_toggle("FOG FOW", "shared settings", "settings", true)
__settings_define_toggle("black flashbang", "shared settings", "settings", false)
__settings_define_toggle("enable_dinput_devices", "shared settings", "settings", false)
__settings_define_toggle("enable_gamepad_devices", "shared settings", "settings", true)
__settings_define_range("resolution", "local settings", "resolution", (1 << 0), (0 << 0), (3 << 0), function(argument0) //gml_Script_anon_5242184B_1930
{
    switch argument0
    {
        case (0 << 0):
            window_set_size(1280, 720)
            break
        case (1 << 0):
            window_set_size(1920, 1080)
            break
        case (2 << 0):
            window_set_size(2560, 1440)
            break
        case (3 << 0):
            window_set_size(3840, 2160)
            break
        default:
            trace("Warning! Resolution \"", argument0, "\" not recognised")
            break
    }

}
)
__settings_define_toggle("collect_data", "shared settings", "Game analytics", false)
__settings_define_toggle("toggle_sprint", "shared settings", "settings", false)
__settings_define_toggle("bunker_animation", "shared settings", "settings", true)
__settings_define_range("item_overlay", "shared settings", "settings", 0.5, 0, 1)
__settings_define_toggle("lost_focus_pause", "shared settings", "settings", true)
__settings_define_range("decrease_minimum_range", "shared settings", "settings", 0, 0, 60)
__settings_define_range("increase_maximum_range", "shared settings", "settings", 0, 0, 20)
__settings_define_string("language", "shared settings", "settings", "english", "english", function() //gml_Script_anon_5242184B_3166
{
}
)
__settings_define_toggle("community_event", "shared settings", "settings", false)
__settings_define_description("master volume", "")
__settings_define_description("radiation volume", "Use this setting to adjust the volume of the geiger counter")
__settings_define_description("heart volume", "Use this setting to adjust the volume of the heartbeat when health points are low")
__settings_define_description("main volume", "")
__settings_define_description("amount grass", "This setting will take effect only from the next map generation.")
__settings_define_description("dynamic grass", "")
__settings_define_description("fog rain", "")
__settings_define_description("low spec", "Low Spec Mode reduces the number of visual effects and particle effects")
__settings_define_description("fullscreen", "")
__settings_define_description("fog of war", "")
__settings_define_description("fog of war alpha", "")
__settings_define_description("FOG FOW", "")
__settings_define_description("black flashbang", "Flashbangs HUD effect is black instead of white")
__settings_define_description("resolution", "")
__settings_define_description("collect_data", "The data collected is used to help the developer balance the game based on community statistics")
__settings_define_description("community_event", "Take part in community events!")
__settings_define_description("toggle_sprint", "")
__settings_define_description("bunker_animation", "Immediate use of food and drink in the bunker without the animation")
__settings_define_description("item_overlay", "Time required for the overlay showing the statistics of an object to appear")
__settings_define_description("lost_focus_pause", "")
__settings_define_description("decrease_minimum_range", "Decrease the minimum range for all weapon by this percentage")
__settings_define_description("increase_maximum_range", "Increase the maximum range for all weapon by this percentage")
__settings_define_description("enable_dinput_devices", "Enable Direct Input devices")
__settings_define_description("enable_gamepad_devices", "Enable gamepad devices")
__settings_define_description("language", "language")
function __settings_define_range(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script___settings_define_range
{
    if (argument6 == undefined)
        argument6 = undefined
    variable_struct_set(global.__settings_data, argument0, 
    {
        __type: "range",
        __name: argument0,
        __db_alias: argument1,
        __db_section: argument2,
        __default: argument3,
        __min: argument4,
        __max: argument5,
        __callback: argument6,
        __description: ""
    }
)
}

function __settings_define_string(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script___settings_define_string
{
    if (argument4 == undefined)
        argument4 = "English"
    if (argument5 == undefined)
        argument5 = undefined
    variable_struct_set(global.__settings_data, argument0, 
    {
        __type: "string",
        __name: argument0,
        __db_alias: argument1,
        __db_section: argument2,
        __default: argument3,
        __str: argument4,
        __callback: argument5,
        __description: ""
    }
)
}

function __settings_define_toggle(argument0, argument1, argument2, argument3, argument4) //gml_Script___settings_define_toggle
{
    if (argument4 == undefined)
        argument4 = undefined
    variable_struct_set(global.__settings_data, argument0, 
    {
        __type: "toggle",
        __name: argument0,
        __db_alias: argument1,
        __db_section: argument2,
        __default: argument3,
        __min: false,
        __max: true,
        __callback: argument4,
        __description: ""
    }
)
}

function __settings_define_description(argument0, argument1) //gml_Script___settings_define_description
{
    variable_struct_get(global.__settings_data, argument0).__description = argument1
}

