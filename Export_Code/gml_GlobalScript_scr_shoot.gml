/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_ammo_item

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_ammo_item

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function scr_shoot(argument0, argument1, argument2, argument3) //gml_Script_scr_shoot
{
    var shoot_dir = argument0
    var bullet_target = argument1
    var bullet_damage = argument2
    var precisione = argument3
    if object_is_player(object_index)
        var _ammo_id = gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now)
    else
        _ammo_id = ammo_id_now
    if (!item_exists(_ammo_id))
    {
        if object_is_player(object_index)
            player_loadout_set_ammo_item(weapon_slot_now, item_weapon_get_ammo(arma_now))
    }
    var _quanti_bullet = item_ammo_get_number(_ammo_id)
    var _pen = item_ammo_get_pen(_ammo_id)
    bullet_damage *= ((100 + item_ammo_get_damage(_ammo_id)) / 100)
    precisione *= ((100 - item_ammo_get_acc(_ammo_id)) / 100)
    var _prec_to_offset = precisione
    weapon_pointing_direction = shoot_dir
    var arma_sound_ = item_weapon_get_sound(arma_now)
    var _player_has_silencer = false
    if object_is_player(object_index)
    {
        _player_has_silencer = item_weapon_get_modded_silenced(arma_now, player_loadout_get_mod_container(self, weapon_slot_now))
        if _player_has_silencer
            arma_sound_ = item_mod_get_silencer_sound(player_loadout_get_mod(self, weapon_slot_now, "brake"))
    }
    else if item_weapon_get_modded_silenced(arma_now, mod_container)
        arma_sound_ = item_mod_get_silencer_sound(loot_mod_cont_get(mod_container, "brake"))
    var _pitch = random_range(0.95, 1.05)
    audio_play_sound_on(emitter_shoot, arma_sound_, false, 10, 1, 0, _pitch)
    var shell = instance_create_depth(x, y, (-y), obj_bullet_shell)
    shell.stop_y = y + 8 + (random_range(-2, 2))
    shell.image_index = item_ammo_get_shell(item_weapon_get_ammo(arma_now))
    if (image_xscale == 1)
    {
        shell.image_angle = weapon_pointing_direction
        shell.direction = weapon_pointing_direction + 90 + (random_range(20, 45))
    }
    else
    {
        shell.image_angle = weapon_pointing_direction
        shell.direction = weapon_pointing_direction - 90 + (random_range(-45, -20))
    }
    if object_is_player(object_index)
        shell.audio_can = true
    if (_quanti_bullet == 1)
    {
        var offset = random_range((-_prec_to_offset), _prec_to_offset)
        if object_is_player(object_index)
            offset = scr_gauss(0, (_prec_to_offset / 2))
        var dir = shoot_dir + offset
        var sprite_weapon = item_get_sprite_ingame(arma_now)
        if (image_xscale == 1)
            var off_dir = 90
        else
            off_dir = -90
        var weapon_sprite_w = sprite_get_width(sprite_weapon) * 0.4
        var diffx = weapon_sprite_w - sprite_get_xoffset(sprite_weapon) * 0.4
        var bullet_spawn_x = x + (lengthdir_x(diffx, weapon_pointing_direction)) + (lengthdir_x(2, (weapon_pointing_direction + off_dir)))
        var bullet_spawn_y = y + (lengthdir_y(diffx, weapon_pointing_direction)) + (lengthdir_y(2, (weapon_pointing_direction + off_dir))) + 5
        laser_startx = bullet_spawn_x
        laser_starty = bullet_spawn_y
        var muzzle = instance_create_depth(bullet_spawn_x, bullet_spawn_y, ((-y) - 10), obj_muzzle_fire)
        muzzle.image_angle = weapon_pointing_direction
        var scope = false
        if object_is_player(object_index)
        {
            if player_get_local_var("aiming", false)
            {
                if instance_exists(obj_surface_aim)
                {
                    if instance_position(obj_surface_aim.x, obj_surface_aim.y, obj_npc_parent)
                    {
                        var enemy_scoped = instance_position(obj_surface_aim.x, obj_surface_aim.y, obj_npc_parent)
                        if instance_line_of_sight(x, y, enemy_scoped)
                            scope = true
                    }
                }
            }
        }
        if (scope == false)
        {
            var bull = instance_create_depth(bullet_spawn_x, bullet_spawn_y, (-y), item_weapon_get_bullet_obj(arma_now))
            bull.direction = dir
            bull.image_angle = dir
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir)
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir)
            bull.damage = bullet_damage
            bull.timer = item_weapon_get_damage(arma_now) / 5
            bull.shooter_faction = faction
            bull.shooter_id = id
            bull.penetration = _pen
            bull.fin_x = obj_cursor.aa_x
            bull.fin_y = obj_cursor.aa_y
            bull.weapon_used = arma_now
            bull.ammo_id_used = _ammo_id
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name
                bull.npc_id = npc_id
            }
        }
        else
        {
            enemy_scoped = instance_position(obj_surface_aim.x, obj_surface_aim.y, obj_npc_parent)
            bull = instance_create_depth(enemy_scoped.x, enemy_scoped.y, (-y), item_weapon_get_bullet_obj(arma_now))
            bull.direction = dir
            bull.image_angle = dir
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir)
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir)
            bull.damage = bullet_damage * (global.sk_k[(19 << 0)])
            bull.timer = item_weapon_get_damage(arma_now) / 5
            bull.shooter_faction = faction
            bull.shooter_id = id
            bull.penetration = _pen
            bull.fin_x = obj_cursor.aa_x
            bull.fin_y = obj_cursor.aa_y
            bull.weapon_used = arma_now
            bull.ammo_id_used = _ammo_id
            bull.scoped = true
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name
                bull.npc_id = npc_id
            }
        }
    }
    else if (_quanti_bullet > 1)
    {
        sprite_weapon = item_get_sprite_ingame(arma_now)
        if (image_xscale == 1)
            off_dir = 90
        else
            off_dir = -90
        weapon_sprite_w = sprite_get_width(sprite_weapon) * 0.4
        diffx = weapon_sprite_w - sprite_get_xoffset(sprite_weapon) * 0.4
        bullet_spawn_x = x + (lengthdir_x(diffx, weapon_pointing_direction)) + (lengthdir_x(2, (weapon_pointing_direction + off_dir)))
        bullet_spawn_y = y + (lengthdir_y(diffx, weapon_pointing_direction)) + (lengthdir_y(2, (weapon_pointing_direction + off_dir))) + 5
        laser_startx = bullet_spawn_x
        laser_starty = bullet_spawn_y
        muzzle = instance_create_depth(bullet_spawn_x, bullet_spawn_y, ((-y) - 10), obj_muzzle_fire)
        muzzle.image_angle = weapon_pointing_direction
        for (var i = 1; i <= _quanti_bullet; i++)
        {
            offset = _prec_to_offset * 2 / _quanti_bullet * i
            dir = shoot_dir - _prec_to_offset + offset
            sprite_weapon = item_get_sprite_ingame(arma_now)
            if (image_xscale == 1)
                off_dir = 90
            else
                off_dir = -90
            laser_startx = bullet_spawn_x
            laser_starty = bullet_spawn_y
            bull = instance_create_depth(bullet_spawn_x, bullet_spawn_y, (-y), item_weapon_get_bullet_obj(arma_now))
            bull.direction = dir
            bull.image_angle = dir
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir)
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir)
            bull.damage = bullet_damage / _quanti_bullet
            bull.timer = item_weapon_get_damage(arma_now) / 5
            bull.shooter_faction = faction
            bull.shooter_id = id
            bull.penetration = _pen
            bull.fin_x = obj_cursor.aa_x
            bull.fin_y = obj_cursor.aa_y
            bull.weapon_used = arma_now
            bull.n_bullet = _quanti_bullet
            bull.ammo_id_used = _ammo_id
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name
                bull.npc_id = npc_id
            }
        }
    }
    var lx = bullet_spawn_x + (lengthdir_x(5, weapon_pointing_direction))
    var ly = bullet_spawn_y + (lengthdir_y(5, weapon_pointing_direction))
    var l = instance_create_depth(lx, ly, (-y), obj_light)
    l.light_id = "weapon_shoot"
    if (image_alpha > 0.1)
    {
        var p = obj_particles_controller
        var _a = (43 << 0)
        var _amount = round(clamp((bullet_damage / 5), 3, 8))
        repeat _amount
        {
            lx = bullet_spawn_x + (lengthdir_x(irandom_range(-5, 1), weapon_pointing_direction))
            ly = bullet_spawn_y + (lengthdir_y(irandom_range(-5, 1), weapon_pointing_direction))
            part_particles_create(p.particles_system[_a], lx, ly, p.particles_type[_a], 1)
        }
    }
    var d = 0
    var a = (29 << 0)
    var c = obj_particles_controller
    var angle = 30
    part_type_orientation(c.particles_type[a], (shoot_dir - angle), (shoot_dir + angle), 0, 0, 0)
    part_type_direction(c.particles_type[a], (shoot_dir - angle), (shoot_dir + angle), 0, 0)
    part_emitter_region(c.particles_system[a], c.partciles_emitter[a], (bullet_spawn_x - d), (bullet_spawn_x + d), (bullet_spawn_y - d), (bullet_spawn_y + d), 1, 1)
    part_emitter_burst(c.particles_system[a], c.partciles_emitter[a], c.particles_type[a], 5)
    var _id = id
    var _faction = faction
    var _x = x
    var _y = y
    if (!_player_has_silencer)
    {
        with (obj_npc_parent)
        {
            if (_id != id && _faction != faction && target == _id && target_relation != (2 << 0) && point_distance(x, y, other.x, other.y) < 300)
            {
                last_seen_delay_x = _x
                last_seen_delay_y = _y
                last_seen_delay = true
                if (!(instance_line_of_sight(x, y, other)))
                    hear_target_shoot = true
            }
        }
    }
}

