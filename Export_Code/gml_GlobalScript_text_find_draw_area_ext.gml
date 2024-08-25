function text_find_draw_area_ext(argument0, argument1, argument2, argument3, argument4) //gml_Script_text_find_draw_area_ext
{
    var _text_width = string_width_ext(argument2, argument3, argument4)
    var _text_height = string_height_ext(argument2, argument3, argument4)
    switch draw_get_halign()
    {
        case 0:
            var _return_left = 0
            var _return_right = _text_width
            break
        case 1:
            _return_left = (-((_text_width / 2)))
            _return_right = _text_width / 2
            break
        case 2:
            _return_left = (-_text_width)
            _return_right = 0
            break
        default:
            show_error("ERROR: text_find_draw_area() didnt know the text alignment. halign.", true)
            break
    }

    switch draw_get_valign()
    {
        case 0:
            var _return_top = 0
            var _return_bottom = _text_height
            break
        case 1:
            _return_top = (-((_text_height / 2)))
            _return_bottom = _text_height / 2
            break
        case 2:
            _return_top = (-_text_height)
            _return_bottom = 0
            break
        default:
            show_error("ERROR: text_find_draw_area() didnt know the text alignment. valign.", true)
            break
    }

    return [(argument0 + _return_left), (argument1 + _return_top), (argument0 + _return_right), (argument1 + _return_bottom)];
}

