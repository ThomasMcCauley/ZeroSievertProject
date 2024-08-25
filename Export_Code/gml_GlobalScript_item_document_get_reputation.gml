function item_document_get_reputation(argument0) //gml_Script_item_document_get_reputation
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "document")
    if (!is_struct(_struct))
        return 0;
    return _struct.reputation;
}

