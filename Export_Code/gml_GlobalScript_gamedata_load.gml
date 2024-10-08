function gamedata_load(argument0) //gml_Script_gamedata_load
{
    if is_array(argument0)
    {
        var _i = 0
        repeat array_length(argument0)
        {
            gamedata_load(argument0[_i])
            _i++
        }
        return;
    }
    if (!file_exists(argument0))
        trace_error("\"", argument0, "\" doesn't exist")
    trace("Gamedata: Loading \"", argument0, "\"")
    var _json = json_parse(SnapStringFromFile(argument0))
    if (_json.version != 0)
        trace_error("Gamedata:\nVersion mismatch for \"", argument0, "\"")
    switch _json.usage
    {
        case "npc":
            var _struct_target = global.npc_data
            var _array_target = global.npc_data_array
            break
        case "npc_preset":
            _struct_target = global.npc_preset
            _array_target = global.npc_preset_array
            break
        case "item":
            _struct_target = global.item_data
            _array_target = global.item_data_array
            break
        case "caliber":
            _struct_target = global.caliber_data
            _array_target = global.caliber_data_array
            break
        case "mod_positions":
            _struct_target = global.mod_pos_data
            _array_target = global.mod_pos_data_array
            break
        case "mod_types":
            _struct_target = global.mod_type_data
            _array_target = global.mod_type_data_array
            break
        case "weapon_types":
            _struct_target = global.weapon_type_data
            _array_target = global.weapon_type_data_array
            break
        case "weapon_glance_stats":
            _struct_target = global.weapon_glance_stat
            _array_target = global.weapon_glance_stat_array
            break
        case "loadouts":
            _struct_target = global.loadout_data
            _array_target = global.loadout_data_array
            break
        case "item_categories":
            _struct_target = global.category_data
            _array_target = global.category_data_array
            break
        case "traders":
            _struct_target = global.trader_data
            _array_target = global.trader_data_array
            break
        case "trader_pages":
            _struct_target = global.trader_pages_data
            _array_target = global.trader_pages_data_array
            break
        case "chest_sounds":
            _struct_target = global.chest_sound_data
            _array_target = global.chest_sound_data_array
            break
        case "chests":
            _struct_target = global.chest_data
            _array_target = global.chest_data_array
            break
        case "speakers":
            _struct_target = global.speaker_data
            _array_target = global.speaker_data_array
            break
        case "stats":
            _struct_target = global.stat_data
            _array_target = global.stat_data_array
            break
        case "gamepad":
            _struct_target = global.gamepad_data
            _array_target = global.gamepad_data_array
            break
        case "languages":
            _struct_target = global.language_data
            _array_target = global.language_data_array
            break
        case "index":
            var _directory = filename_dir(argument0)
            var _array = _json.data
            _i = 0
            repeat array_length(_array)
            {
                var _path = _array[_i]
                var _drive = filename_drive(_path)
                if (_drive == "")
                    gamedata_load(_directory + "/" + _path)
                else
                    gamedata_load(_path)
                _i++
            }
            return;
        default:
            trace_error("Gamedata:\nUnrecognised usage \"", _json.usage, "\"")
            break
    }

    var _data = _json.data
    var _names_array = variable_struct_get_names(_data)
    var _size = array_length(_names_array)
    _i = 0
    repeat _size
    {
        var _name = _names_array[_i]
        if (!(variable_struct_exists(_struct_target, _name)))
            array_push(_array_target, _name)
        variable_struct_set(_struct_target, _name, variable_struct_get(_data, _name))
        _i++
    }
    var _order_array = variable_struct_get(_json, "order")
    if is_array(_order_array)
    {
        _i = 0
        repeat array_length(_order_array)
        {
            _name = _order_array[_i]
            var _index = array_find_index(_array_target, _name)
            if (_index != undefined)
                array_delete(_array_target, _index, 1)
            array_push(_array_target, _name)
            _i++
        }
    }
}

