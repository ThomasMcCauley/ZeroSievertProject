function glance_angle(argument0, argument1, argument2, argument3, argument4) //gml_Script_glance_angle
{
    if (argument2 == undefined)
        argument2 = 30
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    var _dis = point_distance(x, y, obj_cursor.aa_x, obj_cursor.aa_y)
    var _def = argument2
    if (argument0 == "no_item")
        return 1;
    var _get_type_eff_range = item_ammo_get_eff_range(argument0)
    if (_get_type_eff_range == "{use_weapon}")
        _get_type_eff_range = item_weapon_get_type_effective_range(argument1)
    if (_get_type_eff_range == undefined)
        return 1;
    var _min = glance_get_mouse_dis_min(_get_type_eff_range)
    var _max = glance_get_mouse_dis_max(_get_type_eff_range)
    var _ignore_min = glance_get_player_ignore_dis(_get_type_eff_range)
    var _ignore_mult = glance_get_player_ignore_mult_max(_get_type_eff_range)
    if (argument3 < _ignore_min)
    {
        _min = lerp(_min, (_min * _ignore_mult), (argument3 / _ignore_min))
        _max = lerp(_max, (_max * _ignore_mult), (argument3 / _ignore_min))
    }
    var _mult_scope = 1
    if instance_exists(player_get_local())
    {
        var _player = player_get_local()
        var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope")
        if item_exists(_scope)
            _mult_scope = item_mod_get_scope_glance_mouse_dis_mult(_scope)
    }
    _min *= _mult_scope
    _max *= _mult_scope
    var _mult_dis_mouse = 1
    if (argument4 > _min && argument4 <= _max)
        _mult_dis_mouse = lerp(1, 0, ((argument4 - _min) / (_max - _min)))
    if (argument4 > _max)
        _mult_dis_mouse = 0
    var _mult_dis_player = 1
    _mult_dis_player = glance_effective_range(argument0, argument1, argument3, true)
    return (_def * _mult_dis_mouse * _mult_dis_player);
}

