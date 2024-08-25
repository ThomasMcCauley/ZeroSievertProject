function catspeak_location_create(argument0, argument1) //gml_Script_catspeak_location_create
{
    var bitsRow = argument0 & 1048575
    var bitsCol = (argument1 << 20) & 4293918720
    return (bitsRow | bitsCol);
}

function catspeak_location_get_row(argument0) //gml_Script_catspeak_location_get_row
{
    return (argument0 & 1048575);
}

function catspeak_location_get_column(argument0) //gml_Script_catspeak_location_get_column
{
    return ((argument0 & 4293918720) >> 20);
}

function __catspeak_location_show(argument0) //gml_Script___catspeak_location_show
{
    var msg = "in a file"
    if (argument0 != undefined)
        msg += (" at (line " + __catspeak_string(catspeak_location_get_row(argument0)) + ", column " + __catspeak_string(catspeak_location_get_column(argument0)) + ")")
    return msg;
}

function __catspeak_location_show_ext(argument0) //gml_Script___catspeak_location_show_ext
{
    msg = __catspeak_location_show(argument0)
    if (argument_count > 1)
    {
        msg += " -- "
        for (var i = 1; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i])
    }
    return msg;
}

