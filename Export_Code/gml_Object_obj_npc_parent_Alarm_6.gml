if player_any_exists()
{
    target = player_nearest(x, y)
    target_relation = (2 << 0)
    search_target_id = target
    state = "human_encounter_chase"
    enemy_seen = true
    if (!instance_exists(target))
        target = 195
    last_seen_x = target.x
    last_seen_y = target.y
    move_point_x = target.x
    move_point_y = target.y
}
