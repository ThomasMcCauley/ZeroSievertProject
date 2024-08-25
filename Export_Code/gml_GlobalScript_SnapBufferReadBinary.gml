function SnapBufferReadBinary(argument0, argument1) //gml_Script_SnapBufferReadBinary
{
    var _oldOffset = buffer_tell(argument0)
    buffer_seek(argument0, buffer_seek_start, argument1)
    var _value = __SnapFromBinaryValue(argument0)
    buffer_seek(argument0, buffer_seek_start, _oldOffset)
    return _value;
}

function __SnapFromBinaryValue(argument0) //gml_Script___SnapFromBinaryValue
{
    var _datatype = buffer_read(argument0, buffer_u8)
    switch _datatype
    {
        case 1:
            var _count = buffer_read(argument0, buffer_u64)
            var _struct = {}
            repeat _count
            {
                var _name = buffer_read(argument0, buffer_string)
                variable_struct_set(_struct, _name, __SnapFromBinaryValue(argument0))
            }
            return _struct;
        case 2:
            _count = buffer_read(argument0, buffer_u64)
            var _array = array_create(_count, undefined)
            var _i = 0
            repeat _count
            {
                _array[_i] = __SnapFromBinaryValue(argument0)
                _i++
            }
            _struct = _array
            return _struct;
        case 3:
            _struct = buffer_read(argument0, buffer_string)
            return _struct;
        case 4:
            _struct = buffer_read(argument0, buffer_f64)
            return _struct;
        case 5:
            _struct = false
            return _struct;
        case 6:
            _struct = true
            return _struct;
        case 7:
            _struct = undefined
            return _struct;
        case 8:
            _struct = buffer_read(argument0, buffer_s32)
            return _struct;
        case 9:
            _struct = int64(buffer_read(argument0, buffer_u64))
            return _struct;
        case 10:
            _struct = ptr(buffer_read(argument0, buffer_u64))
            return _struct;
        case 11:
            _struct = real(buffer_read(argument0, buffer_u64))
            return _struct;
        default:
            show_error(("SNAP:\nUnsupported datatype " + (string(buffer_peek(argument0, 1, (buffer_tell(argument0) - 1)))) + " (position = " + (string(buffer_tell(argument0) - 1)) + ")\n "), false)
            break
    }

}

