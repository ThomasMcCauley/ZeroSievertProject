function SnapBufferWriteXML(argument0, argument1) //gml_Script_SnapBufferWriteXML
{
    var _prologStruct = variable_struct_get(argument1, "prolog")
    if is_struct(_prologStruct)
    {
        var _attributeStruct = variable_struct_get(_prologStruct, "attributes")
        if is_struct(_attributeStruct)
        {
            var _names = variable_struct_get_names(_attributeStruct)
            var _count = array_length(_names)
            if (_count > 0)
            {
                buffer_write(argument0, buffer_text, "<?xml")
                var _i = 0
                repeat _count
                {
                    var _key = _names[_i]
                    var _value = variable_struct_get(_attributeStruct, _key)
                    buffer_write(argument0, buffer_text, " ")
                    buffer_write(argument0, buffer_text, _key)
                    buffer_write(argument0, buffer_text, "=\"")
                    buffer_write(argument0, buffer_text, string(_value))
                    buffer_write(argument0, buffer_text, "\"")
                    _i++
                }
                buffer_write(argument0, buffer_text, "?>\n")
            }
        }
    }
    var _children = variable_struct_get(argument1, "children")
    if is_array(_children)
    {
        _i = 0
        repeat array_length(_children)
        {
            __SnapToXMLBufferInner(argument0, _children[_i], "")
            _i++
        }
    }
}

function __SnapToXMLBufferInner(argument0, argument1, argument2) //gml_Script___SnapToXMLBufferInner
{
    buffer_write(argument0, buffer_text, argument2)
    buffer_write(argument0, buffer_text, "<")
    buffer_write(argument0, buffer_text, argument1.type)
    _attributeStruct = variable_struct_get(argument1, "attributes")
    if is_struct(_attributeStruct)
    {
        _names = variable_struct_get_names(_attributeStruct)
        _i = 0
        repeat array_length(_names)
        {
            _key = _names[_i]
            _value = variable_struct_get(_attributeStruct, _key)
            buffer_write(argument0, buffer_text, " ")
            buffer_write(argument0, buffer_text, _key)
            buffer_write(argument0, buffer_text, "=\"")
            buffer_write(argument0, buffer_text, string(_value))
            buffer_write(argument0, buffer_text, "\"")
            _i++
        }
    }
    buffer_write(argument0, buffer_text, ">")
    var _content = variable_struct_get(argument1, "text")
    if (_content != undefined)
        buffer_write(argument0, buffer_text, string(_content))
    else
    {
        _children = variable_struct_get(argument1, "children")
        if is_array(_children)
        {
            _count = array_length(_children)
            if (_count > 0)
            {
                var _preIndent = argument2
                argument2 += "	"
                _i = 0
                repeat _count
                {
                    buffer_write(argument0, buffer_u8, 13)
                    __SnapToXMLBufferInner(argument0, _children[_i], argument2)
                    _i++
                }
                argument2 = _preIndent
                buffer_write(argument0, buffer_u8, 13)
                buffer_write(argument0, buffer_text, argument2)
            }
        }
    }
    buffer_write(argument0, buffer_text, "</")
    buffer_write(argument0, buffer_text, argument1.type)
    buffer_write(argument0, buffer_text, ">")
}

