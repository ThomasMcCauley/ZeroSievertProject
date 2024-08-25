function player_update_weapon_laser_specific(argument0) //gml_Script_player_update_weapon_laser_specific
{
    var _found = false
    var _laser_struct = variable_struct_get(laser_container_array[weapon_slot_now].data, argument0)
    var _mod = player_loadout_get_mod(self, weapon_slot_now, argument0)
    if (_mod != undefined && item_mod_get_type(_mod) == "laser")
    {
        _found = true
        var _handguard_mod = player_loadout_get_mod(self, weapon_slot_now, "handguard")
        if item_exists(_handguard_mod)
        {
            var _x = (item_mod_get_handguard_x(_handguard_mod, argument0)) + (item_weapon_pos_get_x(arma_now, "handguard"))
            var _y = (item_mod_get_handguard_y(_handguard_mod, argument0)) + (item_weapon_pos_get_y(arma_now, "handguard"))
        }
        else if (!(item_weapon_pos_get_moddable(arma_now, "handguard")))
        {
            _x = item_weapon_pos_get_x(arma_now, argument0)
            _y = item_weapon_pos_get_y(arma_now, argument0)
        }
        var _ox = sprite_get_xoffset(item_get_sprite_ingame(arma_now))
        var _oy = sprite_get_yoffset(item_get_sprite_ingame(arma_now))
        var _diff_x = abs(_x - _ox)
        var _diff_y = _y - _oy + (argument0 == "att_4" ? -4 : 0)
        if (x >= mouse_x)
        {
            var _dir = weapon_holder.image_angle + 180
            var _off_dir = 90
        }
        else
        {
            _dir = weapon_holder.image_angle
            _off_dir = -90
        }
        var nx = 0.4 * ((lengthdir_x(_diff_x, _dir)) + (lengthdir_x(_diff_y, (_dir + _off_dir))))
        var ny = 0.4 * ((lengthdir_y(_diff_x, _dir)) + (lengthdir_y(_diff_y, (_dir + _off_dir)))) + 5
        _laser_struct.x = nx
        _laser_struct.y = ny
        _laser_struct.have = true
        _laser_struct.color = item_mod_get_laser_color(_mod)
        _laser_struct.icon = item_get_sprite_inv(_mod)
    }
    if (!_found)
    {
        _laser_struct.have = false
        _laser_struct.on = false
    }
}

