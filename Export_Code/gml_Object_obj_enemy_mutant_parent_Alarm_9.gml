if (hp_set == false)
{
    hp *= gml_Script_difficulty_get("enemy_mutant_hp")
    hp = clamp(hp, 1, 99999)
    hp_set = true
}
event_inherited()
