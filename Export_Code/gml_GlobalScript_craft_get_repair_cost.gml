function craft_get_repair_cost(argument0) //gml_Script_craft_get_repair_cost
{
    var _struct = {}
    _struct.array_item[0] = "scrap_weapon"
    _struct.array_item[1] = "scrap_material"
    var _damage_pc = (100 - argument0.durability) / 100
    var k_repair = 0.005 * (global.sk_k[(66 << 0)])
    if item_fits_category(argument0.item, "armor")
    {
        var _armor_class = item_armor_get_class(argument0.item)
        var _value = ceil(_armor_class * _armor_class * 10 * (global.sk_k[(66 << 0)]) * _damage_pc)
    }
    else
        _value = ceil(item_get_value(argument0.item) * k_repair * _damage_pc)
    _struct.array_item_quantity[0] = _value
    _struct.array_item_quantity[1] = ceil(_value * 0.4)
    return _struct;
}

