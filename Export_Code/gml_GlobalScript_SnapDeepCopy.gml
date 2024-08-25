function SnapDeepCopy(argument0) //gml_Script_SnapDeepCopy
{
    return __SnapDeepCopyInner(argument0, self, self);
}

function __SnapDeepCopyInner(argument0, argument1, argument2) //gml_Script___SnapDeepCopyInner
{
    var _copy = argument0
    if is_method(argument0)
    {
        var _self = method_get_self(argument0)
        if (_self == argument1)
            argument0 = method(argument2, method_get_index(argument0))
        else if (_self != undefined)
            trace("SnapDeepCopy(): Warning! Deep copy found a method reference that could not be appropriately handled")
    }
    else if is_struct(argument0)
    {
        var _namesArray = variable_struct_get_names(argument0)
        _copy = {}
        var _i = 0
        repeat array_length(_namesArray)
        {
            var _name = _namesArray[_i]
            variable_struct_set(_copy, _name, __SnapDeepCopyInner(variable_struct_get(argument0, _name), argument0, _copy))
            _i++
        }
    }
    else if is_array(argument0)
    {
        var _count = array_length(argument0)
        _copy = array_create(_count)
        _i = 0
        repeat _count
        {
            _copy[_i] = __SnapDeepCopyInner(argument0[_i], argument1, argument2)
            _i++
        }
    }
    return _copy;
}

