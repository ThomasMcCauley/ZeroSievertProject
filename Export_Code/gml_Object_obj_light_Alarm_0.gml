switch light_id
{
    case "general":
        light_sprite = 238
        scale_start = 1
        alpha_togliere = 0.25
        alpha_mettere = 0
        light_color = 16777215
        flickering_amount = 0
        flickering_range = 0
        break
    case "player_torch":
        light_sprite = 236
        scale_start = 0.75
        alpha_togliere = 0.2
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0
        flickering_range = 0
        break
    case "headset_lamp_1":
        light_sprite = 239
        scale_start = 0.5
        alpha_togliere = 0.2
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0
        flickering_range = 0
        break
    case "headset_lamp_2":
        light_sprite = 233
        scale_start = 2
        alpha_togliere = 0.2
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0
        flickering_range = 0
        break
    case "mod_torch_1":
        light_sprite = 236
        scale_start = 0.75
        alpha_togliere = 0.2
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0
        flickering_range = 0
        break
    case "enemy_torch":
        light_sprite = 236
        scale_start = 0.75
        alpha_togliere = 0.2
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0
        flickering_range = 0
        break
    case "fire_barrel":
        light_sprite = 229
        scale_start = 1
        alpha_togliere = 0.5
        alpha_mettere = 0.5
        light_color = 7844583
        flickering_amount = 0.005
        flickering_range = 0.1
        break
    case "weapon_shoot":
        light_sprite = 229
        scale_start = 0.4
        alpha_togliere = 0.3
        alpha_mettere = 0.5
        light_color = 7844583
        alarm[1] = 4
        break
    case "wall_lamp_bulb":
        light_sprite = 234
        scale_start = 0.25
        alpha_togliere = 0.3
        alpha_mettere = 0.9
        light_color = 6997759
        break
    case "wall_lamp_light":
        light_sprite = 229
        scale_start = 1
        alpha_togliere = 0.3
        alpha_mettere = 0.2
        light_color = 7844583
        break
    case "wraith_fire":
        light_sprite = 229
        scale_start = 0.5
        alpha_togliere = 0.4
        alpha_mettere = 0.9
        light_color = 7327743
        flickering_amount = 0.005
        flickering_range = 0.1
        break
    case "wraith_fire_dead":
        light_sprite = 229
        scale_start = 1
        alpha_togliere = 0.4
        alpha_mettere = 0.7
        light_color = 7327743
        flickering_amount = 0.01
        flickering_range = 0.15
        break
    case "wraith_electricity":
        light_sprite = 229
        scale_start = 0.5
        alpha_togliere = 0.4
        alpha_mettere = 0.9
        light_color = 16769165
        flickering_amount = 0.005
        flickering_range = 0.1
        break
    case "anomaly_electric":
        light_sprite = 229
        scale_start = 0.5
        alpha_togliere = 0.4
        alpha_mettere = 0.9
        light_color = 16769165
        flickering_amount = 0.005
        flickering_range = 0.1
        break
    case "electric_spark":
        light_sprite = 229
        scale_start = 0.2
        alpha_togliere = 0.3
        alpha_mettere = 0.4
        light_color = 16769165
        flickering_amount = 0.01
        flickering_range = 0
        break
    case "faro_swamp":
        light_sprite = 237
        scale_start = 1
        alpha_togliere = 0.8
        alpha_mettere = 0.1
        light_color = 11009010
        flickering_amount = 0
        flickering_range = 0
        break
    case "cristallo_viola":
        light_sprite = 229
        scale_start = 2
        alpha_togliere = 0.8
        alpha_mettere = 0.7
        light_color = 16711912
        flickering_amount = 0
        flickering_range = 0
        break
    case "lampione_2":
        light_sprite = 229
        scale_start = 1
        alpha_togliere = 0.9
        alpha_mettere = 0.2
        light_color = 16777215
        flickering_amount = 0
        flickering_range = 0
        break
    case "square_80x80":
        light_sprite = 235
        scale_start = 1
        alpha_togliere = 1
        alpha_mettere = 0
        light_color = 16777215
        only_day = true
        break
    case "black_128":
        light_sprite = 233
        scale_start = 1
        alpha_togliere = 1
        alpha_mettere = 1
        light_color = 0
        only_day = true
        break
    case "natale_luci":
        light_sprite = 233
        scale_start = 1
        alpha_togliere = 0.8
        alpha_mettere = 1
        light_color = 65535
        break
    case "flashbang":
        light_sprite = 229
        scale_start = 1
        alpha_togliere = 0.8
        alpha_mettere = 0.5
        light_color = 16777215
        break
    case "hs_pumpkin":
        light_sprite = 2161
        scale_start = 1
        alpha_togliere = 1
        alpha_mettere = 0.4
        light_color = 65535
        break
    case "extraction_point":
        light_sprite = 229
        scale_start = 0.75
        alpha_togliere = 0.4
        alpha_mettere = 0.65
        light_color = 6140479
        flickering_amount = 0.005
        flickering_range = 0.1
        break
}

scale = scale_start
