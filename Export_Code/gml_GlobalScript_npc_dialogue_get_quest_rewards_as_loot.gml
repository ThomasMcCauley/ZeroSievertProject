function npc_dialogue_get_quest_rewards_as_loot(argument0, argument1) //gml_Script_npc_dialogue_get_quest_rewards_as_loot
{
    var _in_array = npc_dialogue_get_quest_rewards(argument0, argument1)
    var _size = array_length(_in_array)
    var _out_array = array_create(_size, undefined)
    var _i = 0
    repeat array_length(_in_array)
    {
        var _reward_data = _in_array[_i]
        _out_array[_i] = new class_loot(_reward_data.item, _reward_data.amount)
        _i++
    }
    return _out_array;
}

