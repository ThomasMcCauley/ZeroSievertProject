/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_catspeak_force_init

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_catspeak_force_init

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function __catspeak_string(argument0) //gml_Script___catspeak_string
{
    return (is_string(argument0) ? argument0 : string(argument0));
}

function __catspeak_error() //gml_Script___catspeak_error
{
    var msg = "Catspeak v3.0.0"
    if (argument_count > 0)
    {
        msg += ": "
        for (var i = 0; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i])
    }
    show_error(msg, false)
}

function __catspeak_error_silent() //gml_Script___catspeak_error_silent
{
    msg = "Catspeak v3.0.0"
    if (argument_count > 0)
    {
        msg += ": "
        for (i = 0; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i])
    }
    show_debug_message(msg)
}

function __catspeak_error_got(argument0, argument1) //gml_Script___catspeak_error_got
{
    if is_numeric(argument1)
        var gotStr = string(argument1)
    else if (is_string(argument1) && string_length(argument1) < 16)
        gotStr = argument1
    else
        gotStr = typeof(argument1)
    __catspeak_error(argument0, ", got '", gotStr, "'")
}

function __catspeak_error_bug() //gml_Script___catspeak_error_bug
{
    __catspeak_error("you have likely encountered a compiler bug! ", "please get in contact and report this as an issue on the official ", "GitHub page: https://github.com/katsaii/catspeak-lang/issues")
}

function __catspeak_error_unimplemented(argument0) //gml_Script___catspeak_error_unimplemented
{
    __catspeak_error("the feature '", argument0, "' has not been implemented yet")
}

function __catspeak_check_init() //gml_Script___catspeak_check_init
{
    if gml_Script_catspeak_force_init()
        __catspeak_error("Catspeak was not initialised at this point, make sure to call ", "'catspeak_force_init' at the start of your code if you are ", "using Catspeak inside of a script resource")
}

function __catspeak_check_arg(argument0, argument1, argument2, argument3) //gml_Script___catspeak_check_arg
{
    if (argument3 == undefined)
        argument3 = undefined
    if self.argument2(argument1)
        return;
    if (argument3 == undefined)
    {
        switch argument2
        {
            case is_string:
                argument3 = "string"
                break
            case is_real:
                argument3 = "real"
                break
            case is_numeric:
                argument3 = "numeric"
                break
            case is_bool:
                argument3 = "bool"
                break
            case is_array:
                argument3 = "array"
                break
            case is_struct:
                argument3 = "struct"
                break
            case is_method:
                argument3 = "method"
                break
            case is_ptr:
                argument3 = "pointer"
                break
            case is_int32:
                argument3 = "int32"
                break
            case is_int64:
                argument3 = "int64"
                break
            case is_undefined:
                argument3 = "undefined"
                break
            case is_nan:
                argument3 = "NaN"
                break
            case is_infinity:
                argument3 = "infinity"
                break
            case buffer_exists:
                argument3 = "number"
                break
        }

    }
    __catspeak_error("expected argument '", argument0, "' to be of type '", argument3, "'", ", but got '", typeof(argument1), "' instead")
}

function __catspeak_check_arg_struct(argument0, argument1) //gml_Script___catspeak_check_arg_struct
{
    __catspeak_check_arg(argument0, argument1, is_struct)
    for (i = 2; i < argument_count; i += 2)
    {
        var varName = argument[i]
        var varFunc = argument[(i + 1)]
        if (!(variable_struct_exists(argument1, varName)))
            __catspeak_error("expected struct argument '", argument0, "' to contain a variable '", varName, "'")
        if (varFunc != undefined)
            __catspeak_check_arg((argument0 + "." + varName), variable_struct_get(argument1, varName), varFunc)
    }
}

function __catspeak_check_arg_struct_instanceof(argument0, argument1, argument2) //gml_Script___catspeak_check_arg_struct_instanceof
{
    __catspeak_check_arg(argument0, argument1, is_struct)
    var actual = instanceof(argument1)
    if (actual != argument2)
        __catspeak_error("expected struct argument '", argument0, "' to be an instance of '", argument2, "', but got '", actual, "'")
}

function __catspeak_check_arg_size_bits(argument0, argument1, argument2) //gml_Script___catspeak_check_arg_size_bits
{
    __catspeak_check_arg(argument0, argument1, is_numeric)
    if (argument1 < 0)
        __catspeak_error("argument '", argument0, "' must not be negative, got", argument1)
    if (argument1 >= power(2, argument2))
        __catspeak_error("argument '", argument0, "' is too large (", argument1, ") it must fit within ", argument2, " bits")
}

function __catspeak_check_global_exists(argument0) //gml_Script___catspeak_check_global_exists
{
    if (!variable_global_exists(argument0))
        __catspeak_error("global variable '", argument0, "' does not exist")
}

