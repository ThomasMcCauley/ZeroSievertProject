function player_init_new_game_skills() //gml_Script_player_init_new_game_skills
{
    db_open(inventory_target_db())
    var t_id = db_read("loadout", "id", "equipment_1")
    db_close()
    skills_reset()
    global.sk_lvl[(0 << 0)] = loadout_get_cardio(t_id)
    global.sk_lvl[(4 << 0)] = loadout_get_style(t_id)
    global.sk_lvl[(8 << 0)] = loadout_get_shooting(t_id)
    global.sk_lvl[(12 << 0)] = loadout_get_charisma(t_id)
    global.sk_lvl[(16 << 0)] = loadout_get_medicine(t_id)
    global.sk_lvl[(19 << 0)] = loadout_get_cooking(t_id)
    global.sk_lvl[(22 << 0)] = loadout_get_gunsmith(t_id)
    global.player_money = loadout_get_starting_money(t_id)
    db_open(inventory_target_db())
    db_write("stats", "money", global.player_money)
    db_close()
}

