function npc_dialogue_get_quest_state(argument0, argument1) //gml_Script_npc_dialogue_get_quest_state
{
    var _id = npc_dialogue_get_quest_id(argument0, argument1)
    if (_id == undefined)
        return "???";
    var _quest_id = argument0.quest_array[argument1]
    var _npc_id = argument0.npc_id
    var _i = 0
    repeat (30)
    {
        var _quest_state = global.quest_state[_i]
        if (_quest_id == _quest_state.id && _npc_id == _quest_state.giver)
            return _quest_state.state;
        _i++
    }
    return undefined;
}

