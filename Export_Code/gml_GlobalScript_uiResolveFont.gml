function uiResolveFont(argument0) //gml_Script_uiResolveFont
{
    if (argument0 == "default")
        return 2;
    var _result = asset_get_index(argument0)
    return ((!font_exists(_result)) ? 2 : _result);
}

