function class_dynamic_npc(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_class_dynamic_npc
{
    if (argument3 == undefined)
        argument3 = false
    if (argument4 == undefined)
        argument4 = ""
    npc_id = argument0
    object = argument1
    amount = argument2
    unique = argument3
    quest_required = argument4
}

