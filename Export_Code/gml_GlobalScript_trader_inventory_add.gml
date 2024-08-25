function trader_inventory_add(argument0, argument1, argument2, argument3) //gml_Script_trader_inventory_add
{
    with (argument0)
    {
        var _i = 0
        repeat array_length(loot_array)
        {
            var _loot = loot_array[_i]
            if (_loot.item == argument1)
            {
                _loot.quantity += argument2
                return;
            }
            _i++
        }
        var _loot_grid = new class_loot_grid(8, 11)
        loot_array.loot_array.PlaceFromTraderLootArray(item_get_trader_page(argument1), _loot_grid)
        trader_inventory_add_new(argument0, argument1, argument2, argument3, _loot_grid)
        _loot_grid._loot_grid.Destroy()
    }
}

