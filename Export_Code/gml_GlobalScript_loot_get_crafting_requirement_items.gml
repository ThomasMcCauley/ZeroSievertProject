function loot_get_crafting_requirement_items(argument0) //gml_Script_loot_get_crafting_requirement_items
{
    if (argument0 == undefined)
        return [];
    var _item_array = variable_struct_get(argument0, "crafting_items_array")
    var _quantity_array = variable_struct_get(argument0, "crafting_item_quantity_array")
    if (!is_array(_item_array))
        return;
    if (!is_array(_quantity_array))
        return;
    var _result_array = []
    var _i = 0
    repeat array_length(_item_array)
    {
        var _item = _item_array[_i]
        var _quantity = _quantity_array[_i]
        if (is_string(_item) && _quantity > 0)
        {
            var _loot = new class_loot(_item, _quantity)
            array_push(_result_array, _loot)
        }
        _i++
    }
    return _result_array;
}

