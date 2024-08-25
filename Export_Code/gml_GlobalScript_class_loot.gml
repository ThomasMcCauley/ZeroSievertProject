function class_loot(argument0, argument1, argument2, argument3, argument4, argument5, argument6) constructor //gml_Script_class_loot
{
    if (argument0 == undefined)
        argument0 = "no_item"
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = undefined
    if (argument6 == undefined)
        argument6 = 100
    item = argument0
    quantity = argument1
    x = argument2
    y = argument3
    rotation = argument4
    durability = argument6
    placement = argument5
    if (item_get_category(argument0) == "weapon")
        loot_add_weapon_data(self)
}

