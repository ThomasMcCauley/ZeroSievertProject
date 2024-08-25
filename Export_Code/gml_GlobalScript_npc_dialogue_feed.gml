function npc_dialogue_feed() //gml_Script_npc_dialogue_feed
{
    if (!player_exists_local())
        return;
    var _player = player_get_local()
    var _price = npc_dialogue_get_food_price()
    if (global.player_money < _price)
    {
        scr_draw_text_with_box("Not enough roubles")
        return;
    }
    trader_transfer_money(undefined, 0, _price)
    _player.energy = 100
    scr_draw_text_with_box("You are no longer hungry")
    audio_play_sound(snd_ui_click_text_npc, 9, false)
}

