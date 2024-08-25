depth = -9750
if player_exists_local()
{
    if player_get_local().aiming
    {
        var ergo = player_get_local().total_ergo * (global.sk_k[(18 << 0)])
        var _prec = player_get_local().now_precision
        _prec = clamp(_prec, 0, 100)
        var _amount = (0 + _prec * _prec * 2 + ergo * ergo) * 0.0000055
        x = lerp(x, obj_cursor.aa_x, _amount)
        y = lerp(y, obj_cursor.aa_y, _amount)
    }
    else
    {
        x = obj_cursor.aa_x
        y = obj_cursor.aa_y
    }
}
