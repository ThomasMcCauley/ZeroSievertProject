var item_id = "grenade_mine_pmn"
throw_min = item_grenade_get_throw_min(item_id)
throw_max = item_grenade_get_throw_max(item_id)
fuse_time = item_grenade_get_fuse_time(item_id)
throw_type = item_grenade_get_throw_type(item_id)
damage_max = item_grenade_get_damage_max(item_id)
damage_min = item_grenade_get_damage_min(item_id)
detonation_type = item_grenade_get_detonation_type(item_id)
detonation_duration = item_grenade_get_detonation_duration(item_id)
radius_max_damage = item_grenade_get_radius_max_damage(item_id)
radius_min_damage = item_grenade_get_radius_min_damage(item_id)
radius_effect = item_grenade_get_radius_effect(item_id)
throw_direction = 0
throw_speed = 0
detonation_point = 1
sprite_index = item_get_sprite_ingame(item_id)
event_inherited()
