function quest_create_kill(argument0, argument1, argument2, argument3, argument4, argument5) constructor //gml_Script_quest_create_kill
{
    if (argument1 == undefined)
        argument1 = ""
    if (argument2 == undefined)
        argument2 = -1
    if (argument3 == undefined)
        argument3 = []
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = ""
    type = "kill"
    amount_max = argument0
    faction = argument1
    map = argument2
    array_kill = argument3
    marker_radius = argument4
    text = argument5
}

function quest_create_collect(argument0, argument1, argument2, argument3) constructor //gml_Script_quest_create_collect
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = ""
    type = "collect"
    amount_max = argument1
    item = argument0
    marker_radius = argument2
    text = argument3
}

function quest_create_survive_map(argument0, argument1, argument2, argument3) constructor //gml_Script_quest_create_survive_map
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = ""
    type = "survive"
    amount_max = argument1
    map = argument0
    marker_radius = argument2
    text = argument3
}

function quest_create_survive_min_money(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_quest_create_survive_min_money
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = ""
    type = "survive_money"
    amount_max = argument1
    map = argument0
    money_amount = argument2
    marker_radius = argument3
    text = argument4
}

function quest_create_survive_min_exp(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_quest_create_survive_min_exp
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = ""
    type = "survive_exp"
    amount_max = argument1
    map = argument0
    exp_amount = argument2
    marker_radius = argument3
    text = argument4
}

function quest_create_approach(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_quest_create_approach
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = ""
    type = "approach"
    amount_max = 1
    map = argument2
    object = argument0
    distance = argument1
    marker_radius = argument3
    text = argument4
}

function quest_create_contract(argument0, argument1, argument2, argument3, argument4, argument5) constructor //gml_Script_quest_create_contract
{
    if (argument1 == undefined)
        argument1 = -1
    if (argument2 == undefined)
        argument2 = ""
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = ""
    if (argument5 == undefined)
        argument5 = false
    type = "contract"
    amount_max = 1
    map = argument1
    object = argument0
    object_name = argument2
    marker_radius = argument3
    text = argument4
    already_created = argument5
}

function quest_create_interact_obj(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) constructor //gml_Script_quest_create_interact_obj
{
    if (argument1 == undefined)
        argument1 = -1
    if (argument3 == undefined)
        argument3 = ""
    if (argument4 == undefined)
        argument4 = -1
    if (argument5 == undefined)
        argument5 = -1
    if (argument6 == undefined)
        argument6 = -1
    if (argument7 == undefined)
        argument7 = -4
    if (argument8 == undefined)
        argument8 = 0
    if (argument9 == undefined)
        argument9 = ""
    type = "interact_obj"
    amount_max = 1
    object = argument0
    item_id = argument1
    distance = argument2
    text_prompt = argument3
    map = argument4
    text_if_item = argument5
    text_if_no_item = argument6
    marker_object = argument7
    marker_radius = argument8
    text = argument9
}

function quest_create_place_marker(argument0, argument1, argument2, argument3) constructor //gml_Script_quest_create_place_marker
{
    if (argument1 == undefined)
        argument1 = -1
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = ""
    type = "place_marker"
    amount_max = 1
    map = argument1
    object = argument0
    marker_radius = argument2
    text = argument3
}

function quest_create_retrieve_analyzer(argument0, argument1, argument2, argument3, argument4, argument5) constructor //gml_Script_quest_create_retrieve_analyzer
{
    if (argument1 == undefined)
        argument1 = -1
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = ""
    type = "retrieve_analyzer"
    amount_max = 1
    map = argument1
    item = argument0
    chest_obj = argument2
    anomaly_generator_id = argument3
    marker_radius = argument4
    text = argument5
}

function quest_create_retrieve(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_quest_create_retrieve
{
    if (argument1 == undefined)
        argument1 = -1
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = ""
    type = "retrieve"
    amount_max = 1
    map = argument1
    item = argument0
    chest_id = argument2
    marker_radius = argument3
    text = argument4
}

function quest_create_scripted(argument0, argument1) constructor //gml_Script_quest_create_scripted
{
    if (argument0 == undefined)
        argument0 = 0
    if (argument1 == undefined)
        argument1 = ""
    type = "scripted"
    amount_max = 1
    marker_radius = argument0
    text = argument1
}

function quest_create_place_analyzer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) constructor //gml_Script_quest_create_place_analyzer
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument4 == undefined)
        argument4 = ""
    if (argument5 == undefined)
        argument5 = -1
    if (argument6 == undefined)
        argument6 = -1
    if (argument7 == undefined)
        argument7 = -1
    if (argument8 == undefined)
        argument8 = -4
    if (argument9 == undefined)
        argument9 = 0
    if (argument10 == undefined)
        argument10 = ""
    type = "place_analyzer"
    amount_max = 1
    anomaly_generator_id = argument0
    object = argument1
    item_id = argument2
    distance = argument3
    text_prompt = argument4
    map = argument5
    text_if_item = argument6
    text_if_no_item = argument7
    marker_object = argument8
    marker_radius = argument9
    text = argument10
}

function quest_create_retrieve_equipment(argument0, argument1, argument2, argument3, argument4, argument5) constructor //gml_Script_quest_create_retrieve_equipment
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument3 == undefined)
        argument3 = -4
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = ""
    type = "retrieve_equipment"
    amount_max = 1
    item = argument1
    faction = argument0
    map = argument2
    marker_object = argument3
    marker_radius = argument4
    text = argument5
}

