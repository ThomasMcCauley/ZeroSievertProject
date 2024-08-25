function SnapBufferReadTilemapNew(argument0, argument1, argument2) //gml_Script_SnapBufferReadTilemapNew
{
    if (argument1 != undefined)
    {
        var _oldOffset = buffer_tell(argument0)
        buffer_seek(argument0, buffer_seek_start, argument1)
    }
    var _x = buffer_read(argument0, buffer_f64)
    var _y = buffer_read(argument0, buffer_f64)
    var _width = buffer_read(argument0, buffer_u32)
    var _height = buffer_read(argument0, buffer_u32)
    var _tilesetName = buffer_read(argument0, buffer_string)
    var _assetType = asset_get_type(_tilesetName)
    var _tileset = asset_get_index(_tilesetName)
    if (_tileset < 0)
        show_error(("SNAP:\nTileset \"" + string(_tilesetName) + "\" not found\n "), true)
    if (_assetType != 9)
        show_error(("SNAP:\nAsset \"" + string(_tilesetName) + "\" is not a tileset\n "), true)
    var _tilemap = layer_tilemap_create(argument2, _x, _y, _tileset, _width, _height)
    _x = 0
    repeat _width
    {
        _y = 0
        repeat _height
        {
            tilemap_set(_tilemap, buffer_read(argument0, buffer_u32), _x, _y)
            _y++
        }
        _x++
    }
    if (argument1 != undefined)
        buffer_seek(argument0, buffer_seek_start, _oldOffset)
}

