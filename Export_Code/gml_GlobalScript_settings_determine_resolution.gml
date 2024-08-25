function settings_determine_resolution() //gml_Script_settings_determine_resolution
{
    var _resolution = settings_get("resolution")
    while true
    {
        switch _resolution
        {
            case (0 << 0):
                var _width = 1280
                var _height = 720
                var _lower = (0 << 0)
                break
            case (1 << 0):
                _width = 1920
                _height = 1080
                _lower = (0 << 0)
                break
            case (2 << 0):
                _width = 2560
                _height = 1440
                _lower = (1 << 0)
                break
            case (3 << 0):
                _width = 3840
                _height = 2160
                _lower = (2 << 0)
                break
            default:
                _resolution = (1 << 0)
                _width = 1920
                _height = 1080
                _lower = (0 << 0)
                break
        }

        if ((0.9 * display_get_width()) >= _width || (0.9 * window_get_height()) >= _height)
            break
        else
        {
            _resolution = _lower
            if (_resolution == (0 << 0))
                break
            else
                continue
        }
    }
    settings_set("resolution", _resolution)
}

