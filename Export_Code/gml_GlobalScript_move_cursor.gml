function move_cursor_relative(argument0, argument1) //gml_Script_move_cursor_relative
{
    with (obj_cursor)
    {
        x += (argument0 / 2)
        y += (argument1 / 2)
        self.cursor_has_moved()
    }
}

function move_cursor_relative_inc_sensitivity(argument0, argument1) //gml_Script_move_cursor_relative_inc_sensitivity
{
    with (obj_cursor)
    {
        x += (argument0 * mouse_sensitivity)
        y += (argument1 * mouse_sensitivity)
        self.cursor_has_moved()
    }
}

function move_cursor_room(argument0, argument1) //gml_Script_move_cursor_room
{
    with (obj_cursor)
    {
        x = argument0
        y = argument1
        self.cursor_has_moved()
    }
}

function move_cursor_screen(argument0, argument1) //gml_Script_move_cursor_screen
{
    with (obj_cursor)
    {
        var _pos = gui_space_to_world_space(argument0, argument1)
        x = _pos[0]
        y = _pos[1]
        self.cursor_has_moved()
    }
}

function move_cursor_room_with_reset(argument0, argument1) //gml_Script_move_cursor_room_with_reset
{
    move_cursor_room(argument0, argument1)
    var _win_width = window_get_width()
    var _win_height = window_get_height()
    var _win_middle_h = _win_width / 2
    var _win_middle_v = _win_height / 2
    window_mouse_set(_win_middle_h, _win_middle_v)
}

