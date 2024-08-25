function building_deserialize(argument0, argument1, argument2, argument3, argument4) //gml_Script_building_deserialize
{
    if (argument3 == undefined)
        argument3 = undefined
    if (argument4 == undefined)
        argument4 = undefined
    if is_string(argument0)
        var _building_name = argument0
    else
    {
        if (!room_exists(argument0))
            __building_error("Room ", argument0, " doesn't exist")
        _building_name = room_get_name(argument0)
    }
    var _room_x = 16 * argument1
    var _room_y = 16 * argument2
    var _grid_x96 = argument1 div 6
    var _grid_y96 = argument2 div 6
    var _buffer = variable_struct_get(global.building_buffer_dict, _building_name)
    if (_buffer == undefined)
        __building_error("Couldn't find a buffer for building \"", _building_name, "\"")
    buffer_seek(_buffer, buffer_seek_start, 0)
    var _zs_header = buffer_read(_buffer, buffer_string)
    if (_zs_header != "ZS")
    {
        __building_error("Building header corrupted")
        return;
    }
    var _building_version = buffer_read(_buffer, buffer_u64)
    if (_building_version != 1)
    {
        __building_error("Building name mismatch (expected 1 vs. found ", _building_version, ")")
        return;
    }
    var _building_found_name = buffer_read(_buffer, buffer_string)
    if (_building_found_name != _building_name)
    {
        __building_error("Building name mismatch (expected \"", _building_name, "\" vs. found \"", _building_found_name, "\")")
        return;
    }
    var _header_string = buffer_read(_buffer, buffer_string)
    var _chunk_count = buffer_read(_buffer, buffer_u16)
    var _chunk_index = 0
    repeat _chunk_count
    {
        var _chunk_name = buffer_read(_buffer, buffer_string)
        var _chunk_size = buffer_read(_buffer, buffer_u16)
        switch _chunk_name
        {
            case "decor":
                var _element_count = buffer_read(_buffer, buffer_u16)
                repeat _element_count
                {
                    var _x = (buffer_read(_buffer, buffer_f64)) + _room_x
                    var _y = (buffer_read(_buffer, buffer_f64)) + _room_y
                    var _id = buffer_read(_buffer, buffer_u16)
                    scr_place_obj_map(_id, _x, _y)
                }
                break
            case "inst":
                _element_count = buffer_read(_buffer, buffer_u16)
                repeat _element_count
                {
                    _x = (buffer_read(_buffer, buffer_f64)) + _room_x
                    _y = (buffer_read(_buffer, buffer_f64)) + _room_y
                    var _object_name = buffer_read(_buffer, buffer_string)
                    var _object = asset_get_index(_object_name)
                    if (!object_exists(_object))
                        trace_error("\"", _object_name, "\" doesn't exist")
                    instance_create_depth(_x, _y, 0, _object)
                }
                break
            case "tele":
                _element_count = buffer_read(_buffer, buffer_u16)
                repeat _element_count
                {
                    _x = (buffer_read(_buffer, buffer_f64)) + _room_x
                    _y = (buffer_read(_buffer, buffer_f64)) + _room_y
                    var _instance = instance_create_depth(_x, _y, 0, obj_indoor)
                    _instance.tele_x = argument3
                    _instance.tele_y = argument4
                    _instance = instance_create_depth((x + obj_map_generator.b_x[decor_id][image_index]), (y + obj_map_generator.b_y[decor_id][image_index]), 0, obj_indoor)
                    _instance.tele_x = _x + 8
                    _instance.tele_y = _y + 5
                }
                break
            case "tiles":
                var _tilemap_name = buffer_read(_buffer, buffer_string)
                var _tilemap_scale = buffer_read(_buffer, buffer_u8)
                var _tile_count = buffer_read(_buffer, buffer_u16)
                var _tilemap = undefined
                switch _tilemap_name
                {
                    case "indoor_floor":
                        _tilemap = obj_map_generator.layer_tileset_floor_indoor
                        break
                    case "indoor_wall_below":
                        _tilemap = obj_map_generator.layer_tileset_wall_below_indoor
                        break
                    case "indoor_wall_above":
                        _tilemap = obj_map_generator.layer_tileset_wall_above_indoor
                        break
                    case "indoor_cartelli":
                        _tilemap = obj_map_generator.layer_tileset_cartelli
                        break
                    default:
                        __building_error("Unhandled tilemap layer name \"", _tilemap_name, "\"")
                        break
                }

                switch _tilemap_scale
                {
                    case 1:
                        repeat _tile_count
                        {
                            _x = (buffer_read(_buffer, buffer_u16)) + argument1
                            _y = (buffer_read(_buffer, buffer_u16)) + argument2
                            _id = buffer_read(_buffer, buffer_u32)
                            tilemap_set(_tilemap, _id, _x, _y)
                        }
                        break
                    case 6:
                        repeat _tile_count
                        {
                            _x = (buffer_read(_buffer, buffer_u16)) + _grid_x96
                            _y = (buffer_read(_buffer, buffer_u16)) + _grid_y96
                            _id = buffer_read(_buffer, buffer_u32)
                            tilemap_set(_tilemap, _id, _x, _y)
                        }
                        break
                    default:
                        __building_error("Unhandled tile scale ", _tilemap_scale)
                        break
                }

                break
            case "fence grid":
                var _fence_grid = obj_map_generator.grid_fence
                var _cell_count = buffer_read(_buffer, buffer_u16)
                repeat _cell_count
                {
                    _x = (buffer_read(_buffer, buffer_u16)) + argument1
                    _y = (buffer_read(_buffer, buffer_u16)) + argument2
                    _id = buffer_read(_buffer, buffer_u8)
                    var _sprite = undefined
                    switch _id
                    {
                        case 1:
                            _sprite = 1597
                            break
                        case 2:
                            _sprite = 1599
                            break
                        case 3:
                            _sprite = 1600
                            break
                        default:
                            __building_error("Unhandled fence id \"", _id, "\"")
                            break
                    }

                    ds_grid_set(_fence_grid, _x, _y, _sprite)
                }
                break
            case "grid":
                var _grid_name = buffer_read(_buffer, buffer_string)
                _cell_count = buffer_read(_buffer, buffer_u16)
                var _grid = undefined
                switch _grid_name
                {
                    case "floor2":
                        _grid = obj_map_generator.grid_floor2
                        break
                    default:
                        __building_error("Unhandled grid name \"", _grid_name, "\"")
                        break
                }

                repeat _cell_count
                {
                    _x = (buffer_read(_buffer, buffer_u16)) + argument1
                    _y = (buffer_read(_buffer, buffer_u16)) + argument2
                    var _value = buffer_read(_buffer, buffer_u16)
                    ds_grid_set(_grid, _x, _y, _value)
                }
                break
            case "grid + tiles":
                var _name = buffer_read(_buffer, buffer_string)
                _cell_count = buffer_read(_buffer, buffer_u16)
                _grid = undefined
                _tilemap = undefined
                switch _name
                {
                    case "strada":
                        _grid = obj_map_generator.grid_strada
                        _tilemap = obj_map_generator.layer_tileset_road
                        break
                    case "parking":
                        _grid = obj_map_generator.grid_parking
                        _tilemap = obj_map_generator.layer_tileset_parking
                        break
                    case "railroad":
                        _grid = obj_map_generator.grid_train
                        _tilemap = obj_map_generator.layer_tileset_railroad
                        break
                    default:
                        __building_error("Unhandled grid+tiles name \"", _name, "\"")
                        break
                }

                var _grid_value = buffer_read(_buffer, buffer_u16)
                repeat _cell_count
                {
                    _x = (buffer_read(_buffer, buffer_u16)) + _grid_x96
                    _y = (buffer_read(_buffer, buffer_u16)) + _grid_y96
                    var _tilemap_cell = buffer_read(_buffer, buffer_u32)
                    ds_grid_set(_grid, _x, _y, _grid_value)
                    tilemap_set(_tilemap, _tilemap_cell, _x, _y)
                }
                break
            case "water":
                _cell_count = buffer_read(_buffer, buffer_u16)
                var _water_grid = obj_map_generator.grid_water
                var _map_grid = obj_map_generator.grid_map
                _tilemap = obj_map_generator.layer_tileset_water
                repeat _cell_count
                {
                    _x = (buffer_read(_buffer, buffer_u16)) + argument1
                    _y = (buffer_read(_buffer, buffer_u16)) + argument2
                    _tilemap_cell = buffer_read(_buffer, buffer_u32)
                    ds_grid_set(_water_grid, _x, _y, -1)
                    ds_grid_set(_map_grid, (_x div 2), (_y div 2), -1)
                    tilemap_set(_tilemap, _tilemap_cell, _x, _y)
                }
                break
        }

        var _terminating_null = buffer_read(_buffer, buffer_u64)
        if (_terminating_null != 0)
            __building_error("Error in building \"", _building_name, "\": Terminating null missing for chunk (name=\"", _chunk_name, "\", index=", _chunk_index, ")")
        _chunk_index++
    }
}

