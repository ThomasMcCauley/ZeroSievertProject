function stash_get_total_of_item(argument0) //gml_Script_stash_get_total_of_item
{
    var _total = 0
    var _c = 0
    repeat global.storage_slot_unlocked
    {
        var _loot_array = db_read_ext("chest", ("chest_" + string(_c)), "items", [])
        var _i = 0
        repeat array_length(_loot_array)
        {
            var _loot = _loot_array[_i]
            if (_loot.item == argument0)
                _total += _loot.quantity
            _i++
        }
        _c++
    }
    return _total;
}

