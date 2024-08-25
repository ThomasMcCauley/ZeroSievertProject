function __catspeak_operator_from_token(argument0) //gml_Script___catspeak_operator_from_token
{
    return (argument0 - (16 << 0) - 1);
}

function __catspeak_operator_assign_from_token(argument0) //gml_Script___catspeak_operator_assign_from_token
{
    return (argument0 - (10 << 0) - 1);
}

function __catspeak_operator_get_binary(argument0) //gml_Script___catspeak_operator_get_binary
{
    var opFunc = global.__catspeakBinOps[argument0]
    if (false && opFunc == undefined)
        __catspeak_error_bug()
    return opFunc;
}

function __catspeak_operator_get_unary(argument0) //gml_Script___catspeak_operator_get_unary
{
    opFunc = global.__catspeakUnaryOps[argument0]
    if (false && opFunc == undefined)
        __catspeak_error_bug()
    return opFunc;
}

function __catspeak_op_remainder(argument0, argument1) //gml_Script___catspeak_op_remainder
{
    return (argument0 % argument1);
}

function __catspeak_op_multiply(argument0, argument1) //gml_Script___catspeak_op_multiply
{
    return (argument0 * argument1);
}

function __catspeak_op_divide(argument0, argument1) //gml_Script___catspeak_op_divide
{
    return (argument0 / argument1);
}

function __catspeak_op_divide_int(argument0, argument1) //gml_Script___catspeak_op_divide_int
{
    return (argument0 div argument1);
}

function __catspeak_op_subtract(argument0, argument1) //gml_Script___catspeak_op_subtract
{
    return (argument0 - argument1);
}

function __catspeak_op_plus(argument0, argument1) //gml_Script___catspeak_op_plus
{
    return (argument0 + argument1);
}

function __catspeak_op_equal(argument0, argument1) //gml_Script___catspeak_op_equal
{
    return argument0 == argument1;
}

function __catspeak_op_not_equal(argument0, argument1) //gml_Script___catspeak_op_not_equal
{
    return argument0 != argument1;
}

function __catspeak_op_greater(argument0, argument1) //gml_Script___catspeak_op_greater
{
    return argument0 > argument1;
}

function __catspeak_op_greater_equal(argument0, argument1) //gml_Script___catspeak_op_greater_equal
{
    return argument0 >= argument1;
}

function __catspeak_op_less(argument0, argument1) //gml_Script___catspeak_op_less
{
    return argument0 < argument1;
}

function __catspeak_op_less_equal(argument0, argument1) //gml_Script___catspeak_op_less_equal
{
    return argument0 <= argument1;
}

function __catspeak_op_shift_right(argument0, argument1) //gml_Script___catspeak_op_shift_right
{
    return (argument0 >> argument1);
}

function __catspeak_op_shift_left(argument0, argument1) //gml_Script___catspeak_op_shift_left
{
    return (argument0 << argument1);
}

function __catspeak_op_bitwise_and(argument0, argument1) //gml_Script___catspeak_op_bitwise_and
{
    return (argument0 & argument1);
}

function __catspeak_op_bitwise_xor(argument0, argument1) //gml_Script___catspeak_op_bitwise_xor
{
    return (argument0 ^ argument1);
}

function __catspeak_op_bitwise_or(argument0, argument1) //gml_Script___catspeak_op_bitwise_or
{
    return (argument0 | argument1);
}

function __catspeak_op_subtract_unary(argument0) //gml_Script___catspeak_op_subtract_unary
{
    return (-argument0);
}

function __catspeak_op_plus_unary(argument0) //gml_Script___catspeak_op_plus_unary
{
    return argument0;
}

function __catspeak_op_not_unary(argument0) //gml_Script___catspeak_op_not_unary
{
    return (!argument0);
}

function __catspeak_op_bitwise_not_unary(argument0) //gml_Script___catspeak_op_bitwise_not_unary
{
    return (~argument0);
}

function __catspeak_init_operators() //gml_Script___catspeak_init_operators
{
    var binOps = array_create((19 << 0), undefined)
    var unaryOps = array_create((19 << 0), undefined)
    binOps[(0 << 0)] = gml_Script___catspeak_op_remainder
    binOps[(1 << 0)] = gml_Script___catspeak_op_multiply
    binOps[(2 << 0)] = gml_Script___catspeak_op_divide
    binOps[(3 << 0)] = gml_Script___catspeak_op_divide_int
    binOps[(4 << 0)] = gml_Script___catspeak_op_subtract
    binOps[(5 << 0)] = gml_Script___catspeak_op_plus
    binOps[(6 << 0)] = gml_Script___catspeak_op_equal
    binOps[(7 << 0)] = gml_Script___catspeak_op_not_equal
    binOps[(8 << 0)] = gml_Script___catspeak_op_greater
    binOps[(9 << 0)] = gml_Script___catspeak_op_greater_equal
    binOps[(10 << 0)] = gml_Script___catspeak_op_less
    binOps[(11 << 0)] = gml_Script___catspeak_op_less_equal
    binOps[(14 << 0)] = gml_Script___catspeak_op_shift_right
    binOps[(15 << 0)] = gml_Script___catspeak_op_shift_left
    binOps[(16 << 0)] = gml_Script___catspeak_op_bitwise_and
    binOps[(17 << 0)] = gml_Script___catspeak_op_bitwise_xor
    binOps[(18 << 0)] = gml_Script___catspeak_op_bitwise_or
    unaryOps[(4 << 0)] = gml_Script___catspeak_op_subtract_unary
    unaryOps[(5 << 0)] = gml_Script___catspeak_op_plus_unary
    unaryOps[(12 << 0)] = gml_Script___catspeak_op_not_unary
    unaryOps[(13 << 0)] = gml_Script___catspeak_op_bitwise_not_unary
    global.__catspeakBinOps = binOps
    global.__catspeakUnaryOps = unaryOps
}

