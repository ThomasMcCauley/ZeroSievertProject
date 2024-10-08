var _error;
function SnapBufferReadJSON(argument0, argument1) //gml_Script_SnapBufferReadJSON
{
    if (argument1 == undefined)
        argument1 = undefined
    if (argument1 != undefined)
    {
        var _oldOffset = buffer_tell(argument0)
        buffer_seek(argument0, buffer_seek_start, argument1)
    }
    var _cacheBuffer = undefined
    var _readStart = undefined
    var _inString = false
    var _stringUsesCache = false
    var _inValue = false
    var _expectingComma = false
    var _expectingColon = false
    var _inStructKey = false
    var _structKey = undefined
    var _inStructValue = false
    var _inArray = false
    var _inComment = false
    var _inMultilineComment = false
    var _newComment = false
    var _newMultilineComment = false
    var _stack = []
    var _root = undefined
    var _stackTop = undefined
    var _bufferSize = buffer_get_size(argument0)
    while (buffer_tell(argument0) < _bufferSize)
    {
        var _byte = buffer_read(argument0, buffer_u8)
        if (_byte == 0)
            break
        else
        {
            if _inComment
            {
                if (_byte == 10 || _byte == 13)
                    _inComment = false
            }
            else if _inMultilineComment
            {
                if (_byte == 42 && buffer_read(argument0, buffer_u8) == 47)
                    _inMultilineComment = false
            }
            else if _inString
            {
                if (_byte == 34)
                {
                    if _stringUsesCache
                    {
                        _stringUsesCache = false
                        var _size = buffer_tell(argument0) - _readStart - 1
                        if (_size > 0)
                        {
                            buffer_copy(argument0, _readStart, _size, _cacheBuffer, buffer_tell(_cacheBuffer))
                            buffer_seek(_cacheBuffer, buffer_seek_relative, _size)
                        }
                        buffer_write(_cacheBuffer, buffer_u8, 0)
                        buffer_seek(_cacheBuffer, buffer_seek_start, 0)
                        var _value = buffer_read(_cacheBuffer, buffer_string)
                    }
                    else
                    {
                        buffer_poke(argument0, (buffer_tell(argument0) - 1), buffer_u8, 0)
                        buffer_seek(argument0, buffer_seek_start, _readStart)
                        _value = buffer_read(argument0, buffer_string)
                    }
                    _inString = false
                    _stringUsesCache = false
                    if _inStructKey
                    {
                        _expectingColon = true
                        _structKey = _value
                    }
                    else if _inStructValue
                    {
                        _expectingComma = true
                        variable_struct_set(_stackTop, _structKey, _value)
                        _structKey = undefined
                    }
                    else if _inArray
                    {
                        _expectingComma = true
                        array_push(_stackTop, _value)
                    }
                }
                else if (_byte == 92)
                {
                    if (!_stringUsesCache)
                    {
                        _stringUsesCache = true
                        if (_cacheBuffer == undefined)
                            _cacheBuffer = buffer_create(1024, buffer_grow, 1)
                        else
                            buffer_seek(_cacheBuffer, buffer_seek_start, 0)
                    }
                    _size = buffer_tell(argument0) - _readStart - 1
                    if (_size > 0)
                    {
                        buffer_copy(argument0, _readStart, _size, _cacheBuffer, buffer_tell(_cacheBuffer))
                        buffer_seek(_cacheBuffer, buffer_seek_relative, _size)
                    }
                    var _next_byte = buffer_read(argument0, buffer_u8)
                    switch _next_byte
                    {
                        case 110:
                            buffer_write(_cacheBuffer, buffer_u8, 10)
                            break
                        case 114:
                            buffer_write(_cacheBuffer, buffer_u8, 13)
                            break
                        case 116:
                            buffer_write(_cacheBuffer, buffer_u8, 9)
                            break
                        case 117:
                            var _old_value = buffer_peek(argument0, (buffer_tell(argument0) + 4), buffer_u8)
                            buffer_poke(argument0, (buffer_tell(argument0) + 4), buffer_u8, 0)
                            var _hex = buffer_read(argument0, buffer_string)
                            buffer_seek(argument0, buffer_seek_relative, -1)
                            buffer_poke(argument0, buffer_tell(argument0), buffer_u8, _old_value)
                            _value = int64(ptr(_hex))
                            if (_value <= 127)
                                buffer_write(_cacheBuffer, buffer_u8, _value)
                            else if (_value <= 2047)
                            {
                                buffer_write(_cacheBuffer, buffer_u8, (192 | ((_value >> 6) & 31)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | (_value & 63)))
                            }
                            else if (_value <= 65535)
                            {
                                buffer_write(_cacheBuffer, buffer_u8, (192 | (_value & 15)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | ((_value >> 4) & 63)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | ((_value >> 10) & 63)))
                            }
                            else if (_value <= 65536)
                            {
                                buffer_write(_cacheBuffer, buffer_u8, (192 | (_value & 7)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | ((_value >> 3) & 63)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | ((_value >> 9) & 63)))
                                buffer_write(_cacheBuffer, buffer_u8, (128 | ((_value >> 15) & 63)))
                            }
                            break
                        default:
                            if ((_next_byte & 224) == 192)
                            {
                                buffer_copy(argument0, (buffer_tell(argument0) + 1), 1, _cacheBuffer, buffer_tell(_cacheBuffer))
                                buffer_seek(argument0, buffer_seek_relative, 1)
                                buffer_seek(_cacheBuffer, buffer_seek_relative, 1)
                            }
                            else if ((_next_byte & 240) == 224)
                            {
                                buffer_copy(argument0, (buffer_tell(argument0) + 1), 2, _cacheBuffer, buffer_tell(_cacheBuffer))
                                buffer_seek(argument0, buffer_seek_relative, 2)
                                buffer_seek(_cacheBuffer, buffer_seek_relative, 2)
                            }
                            else if ((_next_byte & 248) == 240)
                            {
                                buffer_copy(argument0, (buffer_tell(argument0) + 1), 3, _cacheBuffer, buffer_tell(_cacheBuffer))
                                buffer_seek(argument0, buffer_seek_relative, 3)
                                buffer_seek(_cacheBuffer, buffer_seek_relative, 3)
                            }
                            else
                                buffer_write(_cacheBuffer, buffer_u8, _next_byte)
                            break
                    }

                    _readStart = buffer_tell(argument0)
                }
            }
            else if _inValue
            {
                if (_byte == 47)
                {
                    _next_byte = buffer_peek(argument0, buffer_tell(argument0), buffer_u8)
                    if (_next_byte == 47)
                        _newComment = true
                    else if (_next_byte == 42)
                        _newMultilineComment = true
                }
                if (_byte <= 32 || _byte == 44 || _byte == 93 || _byte == 125 || _newComment || _inMultilineComment)
                {
                    _old_value = buffer_peek(argument0, (buffer_tell(argument0) - 1), buffer_u8)
                    buffer_poke(argument0, (buffer_tell(argument0) - 1), buffer_u8, 0)
                    buffer_seek(argument0, buffer_seek_start, _readStart)
                    _value = buffer_read(argument0, buffer_string)
                    buffer_poke(argument0, (buffer_tell(argument0) - 1), buffer_u8, _old_value)
                    switch _value
                    {
                        case "true":
                            _value = true
                            break
                        case "false":
                            _value = false
                            break
                        case "null":
                            _value = undefined
                            break
                        default:
                            @@try_hook@@(4232, 4348)
                            _value = real(_value)
                            @@try_unhook@@()
                            break
                    }

                    _inValue = false
                    if _inStructValue
                    {
                        variable_struct_set(_stackTop, _structKey, _value)
                        _structKey = undefined
                    }
                    else if _inArray
                        array_push(_stackTop, _value)
                    if _newComment
                    {
                        _newComment = false
                        _inComment = true
                        buffer_seek(argument0, buffer_seek_relative, 1)
                    }
                    else if _newMultilineComment
                    {
                        _newMultilineComment = false
                        _inMultilineComment = true
                        buffer_seek(argument0, buffer_seek_relative, 1)
                    }
                    else
                    {
                        _expectingComma = true
                        buffer_seek(argument0, buffer_seek_relative, -1)
                    }
                }
            }
            else
            {
                switch _byte
                {
                    case 44:
                        if _expectingComma
                        {
                            _expectingComma = false
                            if _inStructValue
                            {
                                _inStructKey = true
                                _inStructValue = false
                            }
                        }
                        else
                            show_error("SNAP:\nFound unexpected comma\n ", true)
                        break
                    case 58:
                        if _expectingColon
                        {
                            _expectingColon = false
                            _inStructKey = false
                            _inStructValue = true
                        }
                        else
                            show_error("SNAP:\nFound unexpected colon\n ", true)
                        break
                    case 34:
                        if _expectingComma
                            show_error("SNAP:\nFound \", was expecting comma\n ", true)
                        else if _expectingColon
                            show_error("SNAP:\nFound \", was expecting colon\n ", true)
                        else
                        {
                            _readStart = buffer_tell(argument0)
                            _inString = true
                        }
                        break
                    case 91:
                        if _expectingComma
                            show_error("SNAP:\nFound [, was expecting comma\n ", true)
                        else if _expectingColon
                            show_error("SNAP:\nFound [, was expecting colon\n ", true)
                        else
                        {
                            var _new_stack_top = []
                            if _inStructKey
                                show_error("SNAP:\nCannot use an array as a struct key\n ", true)
                            else if _inStructValue
                                variable_struct_set(_stackTop, _structKey, _new_stack_top)
                            else if _inArray
                                array_push(_stackTop, _new_stack_top)
                            if (_root == undefined)
                                _root = _new_stack_top
                            array_push(_stack, _new_stack_top)
                            _stackTop = _new_stack_top
                            _expectingComma = false
                            _inStructKey = false
                            _inStructValue = false
                            _inArray = true
                        }
                        break
                    case 93:
                        if _inArray
                        {
                            _expectingComma = true
                            array_pop(_stack)
                            _stackTop = (array_length(_stack) <= 0 ? undefined : _stack[(array_length(_stack) - 1)])
                            if is_struct(_stackTop)
                            {
                                _inStructKey = true
                                _inStructValue = false
                                _inArray = false
                            }
                            else if is_array(_stackTop)
                            {
                                _inStructKey = false
                                _inStructValue = false
                                _inArray = true
                            }
                        }
                        else
                            show_error("SNAP:\nFound unexpected ]\n ", true)
                        break
                    case 123:
                        if _expectingComma
                            show_error("SNAP:\nFound {, was expecting comma\n ", true)
                        else if _expectingColon
                            show_error("SNAP:\nFound {, was expecting colon\n ", true)
                        else if _inStructKey
                            show_error("SNAP:\nCannot use a struct as a struct key\n ", true)
                        else
                        {
                            _new_stack_top = {}
                            if _inStructValue
                            {
                                _expectingComma = true
                                variable_struct_set(_stackTop, _structKey, _new_stack_top)
                            }
                            else if _inArray
                                array_push(_stackTop, _new_stack_top)
                            if (_root == undefined)
                                _root = _new_stack_top
                            array_push(_stack, _new_stack_top)
                            _stackTop = _new_stack_top
                            _expectingComma = false
                            _inStructKey = true
                            _inStructValue = false
                            _inArray = false
                        }
                        break
                    case 125:
                        if _expectingColon
                            show_error("SNAP:\nFound }, was expecting colon\n ", true)
                        else if (_inStructKey || _inStructValue)
                        {
                            _expectingComma = true
                            array_pop(_stack)
                            _stackTop = (array_length(_stack) <= 0 ? undefined : _stack[(array_length(_stack) - 1)])
                            if is_struct(_stackTop)
                            {
                                _inStructKey = true
                                _inStructValue = false
                                _inArray = false
                            }
                            else if is_array(_stackTop)
                            {
                                _inStructKey = false
                                _inStructValue = false
                                _inArray = true
                            }
                        }
                        else
                            show_error("SNAP:\nFound unexpected }\n ", true)
                        break
                    default:
                        if (_byte == 47)
                        {
                            _next_byte = buffer_peek(argument0, buffer_tell(argument0), buffer_u8)
                            if (_next_byte == 47)
                            {
                                _inComment = true
                                buffer_seek(argument0, buffer_seek_relative, 1)
                            }
                            else if (_next_byte == 42)
                            {
                                _inMultilineComment = true
                                buffer_seek(argument0, buffer_seek_relative, 1)
                            }
                        }
                        else if (_byte > 32)
                        {
                            if _expectingComma
                                show_error("SNAP:\nWas expecting comma\n ", true)
                            else if _expectingColon
                                show_error("SNAP:\nWas expecting colon\n ", true)
                            else if _inStructKey
                                show_error("SNAP:\nStruct keys must be strings\n ", true)
                            _readStart = buffer_tell(argument0) - 1
                            _inValue = true
                        }
                        break
                }

            }
            continue
        }
    }
    if (_cacheBuffer != undefined)
        buffer_delete(_cacheBuffer)
    if (array_length(_stack) > 0)
        show_error("SNAP:\nOne or more JSON objects/arrays not terminataed\n ", true)
    if (argument1 != undefined)
        buffer_seek(argument0, buffer_seek_start, _oldOffset)
    return _root;
}

