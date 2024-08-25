function text_split(argument0, argument1, argument2) //gml_Script_text_split
{
    var pos_space = -1
    var pos_current = 1
    var text_current = argument0
    var text_output = ""
    while (string_length(text_current) >= pos_current)
    {
        if (string_width(string_copy(text_current, 1, pos_current)) > argument1)
        {
            if (pos_space != -1)
            {
                text_output += ((string_copy(text_current, 1, pos_space)) + "\n")
                text_current = string_copy(text_current, (pos_space + 1), (string_length(text_current) - pos_space))
                pos_current = 1
                pos_space = -1
            }
            else if argument2
            {
                text_output += ((string_copy(text_current, 1, (pos_current - 1))) + "\n")
                text_current = string_copy(text_current, pos_current, (string_length(text_current) - (pos_current - 1)))
                pos_current = 1
                pos_space = -1
            }
        }
        if (string_char_at(text_current, pos_current) == " ")
            pos_space = pos_current
        pos_current += 1
    }
    if (string_length(text_current) > 0)
        text_output += text_current
    return text_output;
}

