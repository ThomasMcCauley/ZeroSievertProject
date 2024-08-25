function class_daily_type_chance(argument0, argument1, argument2, argument3) constructor //gml_Script_class_daily_type_chance
{
    if (argument0 == undefined)
        argument0 = 0
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    loner = argument0
    scientist = argument1
    green_army = argument2
    crimson = argument3
}

function class_daily_kill(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) constructor //gml_Script_class_daily_kill
{
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = 0
    object = argument0
    name = argument1
    amount = argument2
    lvl_min = argument3
    map = argument4
    choosen = false
    chance_loner = argument5
    chance_scientst = argument6
    chance_ga = argument7
    chance_cc = argument8
}

function class_daily_collect(argument0, argument1, argument2, argument3, argument4, argument5) constructor //gml_Script_class_daily_collect
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    item = argument0
    amount = argument1
    lvl_min = 1
    choosen = false
    chance = 1
    chance_loner = argument2
    chance_scientst = argument3
    chance_ga = argument4
    chance_cc = argument5
}

function class_daily_contract(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor //gml_Script_class_daily_contract
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    object = argument0
    name = argument1
    map = argument2
    lvl_min = argument3
    choosen = false
    chance_loner = argument4
    chance_scientst = argument5
    chance_ga = argument6
    chance_cc = argument7
}

function class_daily_survive(argument0, argument1, argument2, argument3, argument4, argument5, argument6) constructor //gml_Script_class_daily_survive
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    map = argument0
    amount = argument1
    lvl_min = argument2
    choosen = false
    chance_loner = argument3
    chance_scientst = argument4
    chance_ga = argument5
    chance_cc = argument6
}

function class_daily_survive_exp(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor //gml_Script_class_daily_survive_exp
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    map = argument0
    amount = argument1
    lvl_min = argument2
    amount_var = argument3
    choosen = false
    chance_loner = argument4
    chance_scientst = argument5
    chance_ga = argument6
    chance_cc = argument7
}

function class_daily_survive_money(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor //gml_Script_class_daily_survive_money
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    map = argument0
    amount = argument1
    lvl_min = argument2
    amount_var = argument3
    choosen = false
    chance_loner = argument4
    chance_scientst = argument5
    chance_ga = argument6
    chance_cc = argument7
}

function class_daily_retrieve_analyzer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) constructor //gml_Script_class_daily_retrieve_analyzer
{
    if (argument4 == undefined)
        argument4 = -1
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = 0
    ano_id = argument0
    lvl_min = argument3
    item = argument1
    chest_obj = argument2
    map = argument4
    choosen = false
    chance_loner = argument5
    chance_scientst = argument6
    chance_ga = argument7
    chance_cc = argument8
}

function class_daily_place_analyzer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor //gml_Script_class_daily_place_analyzer
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    ano_id = argument0
    object_id = argument3
    lvl_min = argument1
    map = argument2
    choosen = false
    chance_loner = argument4
    chance_scientst = argument5
    chance_ga = argument6
    chance_cc = argument7
}

function class_daily_retrieve_equipment(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) constructor //gml_Script_class_daily_retrieve_equipment
{
    if (argument4 == undefined)
        argument4 = -1
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = 0
    item_id = argument1
    chest_obj = argument2
    faction = argument0
    lvl_min = argument3
    map = argument4
    choosen = false
    chance_loner = argument5
    chance_scientst = argument6
    chance_ga = argument7
    chance_cc = argument8
}

