if obj_gamepad.input_value[(26 << 0)]
{
    current_selected = floor(((obj_gamepad.input_decimal[(27 << 0)]) + angle_of_option / 2) / angle_of_option)
    current_selected %= number_of_options
}
else if (obj_gamepad.action[(33 << 0)].value || obj_gamepad.action[(34 << 0)].value || obj_gamepad.action[(35 << 0)].value || obj_gamepad.action[(36 << 0)].value)
{
    if obj_gamepad.action[(33 << 0)].value
    {
        if obj_gamepad.action[(35 << 0)].value
            current_selected = 3
        else if obj_gamepad.action[(36 << 0)].value
            current_selected = 1
        else
            current_selected = 2
    }
    else if obj_gamepad.action[(34 << 0)].value
    {
        if obj_gamepad.action[(35 << 0)].value
            current_selected = 5
        else if obj_gamepad.action[(36 << 0)].value
            current_selected = 7
        else
            current_selected = 6
    }
    else if obj_gamepad.action[(35 << 0)].value
        current_selected = 4
    else
        current_selected = 0
}
else
    current_selected = -1
if self.select_function()
{
    if (current_selected > -1 && current_selected < array_length(options_data))
    {
        var _this_option = options_data[current_selected]
        _this_option._this_option.script_to_run()
    }
    instance_destroy()
}
if self.close_function()
    instance_destroy()
var _player = player_get_local()
if instance_exists(_player)
{
    x = _player.x
    y = _player.y
}
