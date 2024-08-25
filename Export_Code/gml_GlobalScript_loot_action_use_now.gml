function loot_action_use_now(argument0) //gml_Script_loot_action_use_now
{
    if (!player_exists_local())
        return;
    var _player = player_get_local()
    var _item = argument0.item
    switch item_get_category(_item)
    {
        case "medication":
            _player.arms_holder = new class_player_arms(_player, _item, item_med_get_animation(_item))
            loot_decrement(argument0)
            ui_inventory_close_all()
            gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete("inventory layer")
            break
        case "repair_weapon":
            var _dur_min = item_repair_get_condition_min(_item)
            var _dur_max = item_repair_get_condition_max(_item)
            var _dur_gain = item_repair_get_condition_gain(_item)
            var _target_loot = inventory_find_loot("weapon slot 1")
            if is_struct(_target_loot)
            {
                with (_target_loot)
                {
                    if item_repair_caliber_fits_weapon(_item, item)
                    {
                        if (durability >= _dur_min && durability < _dur_max)
                        {
                            durability = clamp((durability + _dur_gain), 0, 100)
                            scr_draw_text_with_box("Weapon repaired")
                            loot_decrement(argument0)
                        }
                        else if (durability < _dur_min)
                            scr_draw_text_with_box("The weapon's condition is too low for this repair kit")
                        else if (durability >= _dur_max)
                            scr_draw_text_with_box("The weapon's condition is too high for this repair kit")
                    }
                    else
                        scr_draw_text_with_box("This repair kit doesn't match the weapon's caliber")
                }
            }
            break
        case "repair_armor":
            _dur_min = item_repair_get_condition_min(_item)
            _dur_max = item_repair_get_condition_max(_item)
            _dur_gain = item_repair_get_condition_gain(_item)
            _target_loot = inventory_find_loot("armor slot")
            if is_struct(_target_loot)
            {
                with (_target_loot)
                {
                    if (durability >= _dur_min && durability < _dur_max)
                    {
                        durability = clamp((durability + _dur_gain), 0, 100)
                        scr_draw_text_with_box("Armor repaired")
                        loot_decrement(argument0)
                    }
                    else if (durability < _dur_min)
                        scr_draw_text_with_box("The armor's condition is too low for this repair kit")
                    else if (durability >= _dur_max)
                        scr_draw_text_with_box("The armor's condition is too high for this repair kit")
                }
            }
            break
        case "injector":
            global.injector_factor[(0 << 0)] += item_inj_get_max_hp(_item)
            global.injector_factor[(1 << 0)] += item_inj_get_hp_regen(_item)
            global.injector_factor[(2 << 0)] += item_inj_get_bleed_rec(_item)
            global.injector_factor[(3 << 0)] += item_inj_get_bleed_immune(_item)
            global.injector_factor[(4 << 0)] += item_inj_get_stamina_max(_item)
            global.injector_factor[(5 << 0)] += item_inj_get_stamina_regen(_item)
            global.injector_factor[(6 << 0)] += item_inj_get_max_weight(_item)
            global.injector_factor[(7 << 0)] += item_inj_get_rad_regen(_item)
            global.injector_factor[(8 << 0)] += item_inj_get_rad_def(_item)
            global.injector_factor[(9 << 0)] += item_inj_get_hunger(_item)
            global.injector_factor[(10 << 0)] += item_inj_get_hunger_regen(_item)
            global.injector_factor[(11 << 0)] += item_inj_get_thirst(_item)
            global.injector_factor[(12 << 0)] += item_inj_get_thirst_regen(_item)
            with (_player)
            {
                hp_max += item_inj_get_max_hp(_item)
                bleed_immune += item_inj_get_bleed_immune(_item)
                stamina_max += item_inj_get_stamina_max(_item)
                radiation_defence += item_inj_get_rad_def(_item)
                energy += item_inj_get_hunger(_item)
                thirst += item_inj_get_thirst(_item)
                var in = instance_create_depth(x, y, 0, obj_injector_timer)
                in.injector_id = _item
                in.injector_timer = item_inj_get_duration(_item)
            }
            loot_decrement(argument0)
            break
        case "book":
            var _decrement = false
            switch _item
            {
                case "book_gunsmith1":
                    db_open(inventory_target_db())
                    db_write("Book", "gunsmith1", true)
                    db_close()
                    break
                case "book_gunsmith2":
                    db_open(inventory_target_db())
                    db_write("Book", "gunsmith2", true)
                    db_close()
                    break
                case "book_cardio":
                    _decrement = scr_level_up_skill((0 << 0), 1)
                    break
                case "book_style":
                    _decrement = scr_level_up_skill((4 << 0), 1)
                    break
                case "book_shooting":
                    _decrement = scr_level_up_skill((8 << 0), 1)
                    break
                case "book_charisma":
                    _decrement = scr_level_up_skill((12 << 0), 1)
                    break
                case "book_medicine":
                    _decrement = scr_level_up_skill((16 << 0), 1)
                    break
                case "book_gunsmith":
                    _decrement = scr_level_up_skill((22 << 0), 1)
                    break
                case "book_cooking":
                    _decrement = scr_level_up_skill((19 << 0), 1)
                    break
            }

            if _decrement
                loot_decrement(argument0)
            else
                scr_draw_text_with_box("You can't use this book: max level reached")
            break
        case "book_r":
            if is_in_hub()
            {
                _decrement = false
                switch _item
                {
                    case "book_cardio_r":
                        _decrement = scr_respec_skill((0 << 0))
                        break
                    case "book_style_r":
                        _decrement = scr_respec_skill((4 << 0))
                        break
                    case "book_shooting_r":
                        _decrement = scr_respec_skill((8 << 0))
                        break
                    case "book_charisma_r":
                        _decrement = scr_respec_skill((12 << 0))
                        break
                    case "book_medicine_r":
                        _decrement = scr_respec_skill((16 << 0))
                        break
                    case "book_gunsmith_r":
                        _decrement = scr_respec_skill((22 << 0))
                        break
                    case "book_cooking_r":
                        _decrement = scr_respec_skill((19 << 0))
                        break
                }

                if _decrement
                    loot_decrement(argument0)
                scr_save_skill_and_base()
            }
            else
                scr_draw_text_with_box("You can only use this item in the bunker")
            break
        case "grenade":
            if (!is_in_hub())
            {
                player_get_local().arms_holder = new class_player_arms(player_get_local(), _item, item_grenade_get_animation(_item))
                destroy_consumable = true
                global.last_quick_slot_pressed = "inventory"
                var _sound = choose(4, 0, 219)
                audio_play_sound_on(player_get_local().emitter_walk, _sound, false, 18)
                loot_decrement(argument0)
            }
            else
                scr_draw_text_with_box("You can not use this item in the bunker!")
            break
        case "upgrade_base_kit":
            if is_in_hub()
            {
                var _loot_name = ""
                with (gml_Script_uiGetData())
                    _loot_name = loot_name
                if (string_pos("Stash", _loot_name) != 0)
                {
                    scr_draw_text_with_box("Cannot upgrade storage while stash is open!")
                    return;
                }
                var get_base_id = base_name_to_component(item_base_upgrade_get_id(_item))
                var have_i_this_module_installed = false
                for (var i = 0; i < array_length(global.sl_id); i++)
                {
                    if (global.sl_free[i] == 2 && global.sl_base_id[i] == get_base_id)
                        have_i_this_module_installed = true
                }
                if have_i_this_module_installed
                {
                    if (global.base_lvl[get_base_id] == item_base_upgrade_get_lvl_req(_item))
                    {
                        global.base_lvl[get_base_id] += 1
                        scr_save_skill_and_base()
                        obj_base_parent.alarm[0] = 1
                        if (_item == "base_storage_1")
                            scr_increase_storage_slot(3)
                        if (_item == "base_storage_2")
                            scr_increase_storage_slot(4)
                        scr_draw_text_with_box("The module has been installed")
                        loot_decrement(argument0)
                    }
                    else
                        scr_draw_text_with_box("Module and building kit levels do not match")
                }
                else
                    scr_draw_text_with_box("You don't have this module installed")
            }
            else
                scr_draw_text_with_box("You can install modules only in the bunker")
            break
        case "base_storage_use":
            if is_in_hub()
            {
                _loot_name = ""
                with (gml_Script_uiGetData())
                    _loot_name = loot_name
                if (string_pos("Stash", _loot_name) != 0)
                {
                    scr_draw_text_with_box("Cannot upgrade storage while stash is open!")
                    return;
                }
                scr_increase_storage_slot(1)
                scr_draw_text_with_box("Stash upgraded")
                loot_decrement(argument0)
            }
            else
                scr_draw_text_with_box("You can only use this item in the bunker")
            break
    }

    if (_item == "natale_luci_kit")
    {
        if is_in_hub()
        {
            global.luci_natale_built = true
            db_open("general")
            db_write("Christman", "lights built", true)
            db_close()
            var lay_id = layer_get_id("Natale_luci")
            layer_set_visible(lay_id, true)
            loot_decrement(argument0)
        }
        else
            scr_draw_text_with_box("You can only use this item in the bunker")
    }
}

