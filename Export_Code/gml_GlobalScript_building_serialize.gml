function building_serialize(argument0, argument1, argument2) //gml_Script_building_serialize
{
    if (!instance_exists(obj_editor))
    {
        __building_error("Cannot call building_serialize() outside of the editor")
        return;
    }
    var _editor = obj_editor
    var _grid_w16 = room_width div 16
    var _grid_h16 = room_height div 16
    var _grid_w96 = room_width div 96
    var _grid_h96 = room_height div 96
    var _buffer = buffer_create(1024, buffer_grow, 1)
    buffer_write(_buffer, buffer_string, "ZS")
    buffer_write(_buffer, buffer_u64, 1)
    buffer_write(_buffer, buffer_string, argument0)
    buffer_write(_buffer, buffer_string, json_stringify(argument2))
    var _chunk_tell = buffer_tell(_buffer)
    buffer_write(_buffer, buffer_u16, 0)
    var _chunk_count = 0
    if (argument1 == (0 << 0))
    {
        var _objects_serialize_array = [148, 198, 291, 210, 229, 136, 194, 928, 185, 991, 992, 278, 977, 169, 990, 782, 46]
        _chunk_count++
        buffer_write(_buffer, buffer_string, "inst")
        var _chunk_byte_size_tell = buffer_tell(_buffer)
        buffer_write(_buffer, buffer_u16, 0)
        var _instance_count_tell = buffer_tell(_buffer)
        buffer_write(_buffer, buffer_u16, 0)
        var _instance_count = 0
        var _i = 0
        repeat array_length(_objects_serialize_array)
        {
            var _object = _objects_serialize_array[_i]
            with (_object)
            {
                if (_object == obj_npc_parent)
                {
                    if (!(variable_struct_exists(global.npc_data, npc_id)))
                    {
                    }
                    else
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_string, object_get_name(object_index))
                        _instance_count++
                    }
                }
                else if (_object == obj_chest_general)
                {
                    if (!(variable_struct_exists(global.chest_data, tipo)))
                    {
                    }
                    else
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_string, object_get_name(object_index))
                        _instance_count++
                    }
                }
                else if (_object == obj_solid)
                {
                    if (object_index != obj_solid)
                    {
                    }
                    else
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_string, object_get_name(object_index))
                        _instance_count++
                    }
                }
                else
                {
                    buffer_write(_buffer, buffer_f64, x)
                    buffer_write(_buffer, buffer_f64, y)
                    buffer_write(_buffer, buffer_string, object_get_name(object_index))
                    _instance_count++
                }
            }
            _i++
        }
        buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
        buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count)
        buffer_write(_buffer, buffer_u64, 0)
        if instance_exists(obj_indoor)
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "tele")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _instance_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, instance_number(obj_indoor))
            _instance_count = 0
            with (obj_indoor)
            {
                buffer_write(_buffer, buffer_f64, x)
                buffer_write(_buffer, buffer_f64, y)
                _instance_count++
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("solid_layer")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "inst")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _instance_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            var _solid_layer = layer_tilemap_get_id("solid_layer")
            _instance_count = 0
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_solid_layer, _x, _y)
                    if (_cell > 0)
                    {
                        _object = (_cell == 2 ? obj_solid_can_see : obj_solid)
                        buffer_write(_buffer, buffer_f64, (_x * 16))
                        buffer_write(_buffer, buffer_f64, (_y * 16))
                        buffer_write(_buffer, buffer_string, object_get_name(_object))
                        _instance_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("fence_serialize")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "fence grid")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            var _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            var _cell_count = 0
            var _tilemap = layer_tilemap_get_id("fence_serialize")
            for (_x = 0; _x < _grid_w16; _x++)
            {
                for (_y = 0; _y < _grid_h16; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        var _id = undefined
                        switch _cell
                        {
                            case 1:
                                _id = 1
                                break
                            case 2:
                                _id = 2
                                break
                            case 3:
                                _id = 3
                                break
                            default:
                                __building_error("Unhandled cell type for \"fence_serialize\" layer ", _cell)
                                break
                        }

                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u8, _id)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if instance_exists(obj_editor_fence_parent)
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "fence grid")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _cell_count = 0
            with (obj_editor_fence_parent)
            {
                _x = x div 16
                _y = y div 16
                _id = undefined
                switch fence
                {
                    case 1597:
                        _id = 1
                        break
                    case 1599:
                        _id = 2
                        break
                    case 1600:
                        _id = 3
                        break
                }

                buffer_write(_buffer, buffer_u16, _x)
                buffer_write(_buffer, buffer_u16, _y)
                buffer_write(_buffer, buffer_u8, _id)
                _cell_count++
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if instance_exists(obj_decor_parent)
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "decor")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _instance_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _instance_count = 0
            with (obj_decor_parent)
            {
                if (object_index != obj_solid)
                {
                    var _index = array_find_index(_editor.decor_obj, object_index)
                    if (_index != undefined)
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_u16, _index)
                        _instance_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("floor2")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "grid")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_string, "floor2")
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _cell_count = 0
            _tilemap = layer_tilemap_get_id("floor2")
            for (_x = 0; _x < _grid_w16; _x++)
            {
                for (_y = 0; _y < _grid_h16; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        _id = undefined
                        switch _cell
                        {
                            case 1:
                                _id = 0
                                break
                            case 2:
                                _id = 1
                                break
                            case 3:
                                _id = 6
                                break
                            case 5:
                                _id = 8
                                break
                            case 6:
                                _id = 10
                                break
                            default:
                                __building_error("Unhandled cell type for \"floor2\" layer ", _cell)
                                break
                        }

                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u16, _id)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("road")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "grid + tiles")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_string, "strada")
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_u16, 1)
            _cell_count = 0
            _tilemap = layer_tilemap_get_id("road")
            for (_x = 0; _x < _grid_w96; _x++)
            {
                for (_y = 0; _y < _grid_h96; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u32, _cell)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("water")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "water")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            _cell_count = 0
            _tilemap = layer_tilemap_get_id("water")
            for (_x = 0; _x < _grid_w16; _x++)
            {
                for (_y = 0; _y < _grid_h16; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u32, _cell)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("parking")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "grid + tiles")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_string, "parking")
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_u16, 1)
            _cell_count = 0
            _tilemap = layer_tilemap_get_id("parking")
            for (_x = 0; _x < _grid_w96; _x++)
            {
                for (_y = 0; _y < _grid_h96; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u32, _cell)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        if layer_exists("railroad")
        {
            _chunk_count++
            buffer_write(_buffer, buffer_string, "grid + tiles")
            _chunk_byte_size_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_string, "railroad")
            _cell_count_tell = buffer_tell(_buffer)
            buffer_write(_buffer, buffer_u16, 0)
            buffer_write(_buffer, buffer_u16, 2)
            _cell_count = 0
            _tilemap = layer_tilemap_get_id("railroad")
            for (_x = 0; _x < _grid_w96; _x++)
            {
                for (_y = 0; _y < _grid_h96; _y++)
                {
                    _cell = tilemap_get(_tilemap, _x, _y)
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x)
                        buffer_write(_buffer, buffer_u16, _y)
                        buffer_write(_buffer, buffer_u32, _cell)
                        _cell_count++
                    }
                }
            }
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
            buffer_write(_buffer, buffer_u64, 0)
        }
        var _tile_layer_serialize_array = [
        {
            layer: "indoor_floor",
            scale: 1
        }
, 
        {
            layer: "indoor_wall_below",
            scale: 1
        }
, 
        {
            layer: "indoor_wall_above",
            scale: 1
        }
, 
        {
            layer: "indoor_cartelli",
            scale: 1
        }
]
        _i = 0
        repeat array_length(_tile_layer_serialize_array)
        {
            var _layer_data = _tile_layer_serialize_array[_i]
            var _layer_name = _layer_data.layer
            var _layer_scale = _layer_data.scale
            if (!layer_exists(_layer_name))
                _i++
            else
            {
                _chunk_count++
                buffer_write(_buffer, buffer_string, "tiles")
                _chunk_byte_size_tell = buffer_tell(_buffer)
                buffer_write(_buffer, buffer_u16, 0)
                buffer_write(_buffer, buffer_string, _layer_name)
                buffer_write(_buffer, buffer_u8, _layer_scale)
                _cell_count_tell = buffer_tell(_buffer)
                buffer_write(_buffer, buffer_u16, 0)
                var _layer_width = (_layer_scale == 6 ? _grid_w96 : _grid_w16)
                var _layer_height = (_layer_scale == 6 ? _grid_h96 : _grid_h16)
                _cell_count = 0
                _tilemap = layer_tilemap_get_id(_layer_name)
                for (_x = 0; _x < _layer_width; _x++)
                {
                    for (_y = 0; _y < _layer_height; _y++)
                    {
                        _cell = tilemap_get(_tilemap, _x, _y)
                        if (_cell > 0)
                        {
                            buffer_write(_buffer, buffer_u16, _x)
                            buffer_write(_buffer, buffer_u16, _y)
                            buffer_write(_buffer, buffer_u32, _cell)
                            _cell_count++
                        }
                    }
                }
                buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
                buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count)
                buffer_write(_buffer, buffer_u64, 0)
                _i++
            }
        }
    }
    else if (argument1 == (1 << 0))
    {
        _objects_serialize_array = [135, 136, 198]
        _chunk_count++
        buffer_write(_buffer, buffer_string, "inst")
        _chunk_byte_size_tell = buffer_tell(_buffer)
        buffer_write(_buffer, buffer_u16, 0)
        _instance_count_tell = buffer_tell(_buffer)
        buffer_write(_buffer, buffer_u16, 0)
        _instance_count = 0
        _i = 0
        repeat array_length(_objects_serialize_array)
        {
            _object = _objects_serialize_array[_i]
            with (_object)
            {
                if (_object == 135)
                {
                    if (!(array_contains(_editor.decor_sprite, sprite_index)))
                    {
                    }
                    else
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_string, object_get_name(object_index))
                        _instance_count++
                    }
                }
                else if (_object == 198)
                {
                    if (!(variable_struct_exists(global.npc_data, npc_id)))
                    {
                    }
                    else
                    {
                        buffer_write(_buffer, buffer_f64, x)
                        buffer_write(_buffer, buffer_f64, y)
                        buffer_write(_buffer, buffer_string, object_get_name(object_index))
                        _instance_count++
                    }
                }
                else
                {
                    buffer_write(_buffer, buffer_f64, x)
                    buffer_write(_buffer, buffer_f64, y)
                    buffer_write(_buffer, buffer_string, object_get_name(object_index))
                    _instance_count++
                }
            }
            _i++
        }
        buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer))
        buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count)
        buffer_write(_buffer, buffer_u64, 0)
    }
    buffer_poke(_buffer, _chunk_tell, buffer_u16, _chunk_count)
    buffer_resize(_buffer, buffer_tell(_buffer))
    return _buffer;
}

