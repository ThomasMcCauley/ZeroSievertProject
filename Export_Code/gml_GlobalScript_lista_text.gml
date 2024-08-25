var arr_nomi, arr_cognomi, pquestion;
function lista_text() //gml_Script_lista_text
{
    global.text_custom_index = -1
    global.dialogue_type_text_box_w = 400
    global.dialogue_type_text_box_h = 250
    global.dialogue_type_text_box_startx = 240 - global.dialogue_type_text_box_w / 2
    global.dialogue_type_text_box_starty = 135 - global.dialogue_type_text_box_h / 2
    _bbox_w[0] = 48
    _bbox_h[0] = 16
    _bbox_w[1] = 64
    _bbox_h[1] = 16
    _bbox_w[2] = 80
    _bbox_h[2] = 16
    _bbox_w[3] = 96
    _bbox_h[3] = 16
    _bbox_w[4] = 128
    _bbox_h[4] = 16
    var a = 0
    global.dialogue_type_text_hover[a] = -1
    var k = 0
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 210
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I accept"
    k++
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 230
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I have to think about it"
    a = 1
    global.dialogue_type_text_hover[a] = -1
    k = 0
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 210
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I want to enlist"
    k++
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 230
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I have to think about it"
    a = 2
    global.dialogue_type_text_hover[a] = -1
    k = 0
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 210
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I want to join"
    k++
    global.dialogue_type_text_x[a][k] = 240
    global.dialogue_type_text_y[a][k] = 230
    global.dialogue_type_text_w[a][k] = _bbox_w[4]
    global.dialogue_type_text_h[a][k] = _bbox_h[4]
    global.dialogue_type_text_text[a][k] = "I have to think about it"
    k = 0
    arr_nomi[k] = "Toma"
    k++
    arr_nomi[k] = "Gedeon"
    k++
    arr_nomi[k] = "Spiridon"
    k++
    arr_nomi[k] = "Koloda"
    k++
    arr_nomi[k] = "Stepan"
    k++
    arr_nomi[k] = "Ludmil"
    k++
    arr_nomi[k] = "Vladimir"
    k++
    arr_nomi[k] = "Rostya"
    k++
    arr_nomi[k] = "Inna"
    k++
    arr_nomi[k] = "Lyosha"
    k++
    arr_nomi[k] = "Ermolai"
    k++
    arr_nomi[k] = "Isidor"
    k++
    arr_nomi[k] = "Anatolii"
    k++
    arr_nomi[k] = "Tikhon"
    k++
    arr_nomi[k] = "Ipatiy"
    k++
    arr_nomi[k] = "Vadim"
    k++
    arr_nomi[k] = "Iov"
    k = 0
    arr_cognomi[k] = "Solovev"
    k++
    arr_cognomi[k] = "Smirnov"
    k++
    arr_cognomi[k] = "Nikitin"
    k++
    arr_cognomi[k] = "Nikolaev"
    k++
    arr_cognomi[k] = "Popo"
    k++
    arr_cognomi[k] = "Pushkin"
    k++
    arr_cognomi[k] = "Vinogradov"
    k++
    arr_cognomi[k] = "Osipov"
    k++
    arr_cognomi[k] = "Frolov"
    k++
    arr_cognomi[k] = "Makarov"
    k++
    arr_cognomi[k] = "Sergeev"
    k++
    arr_cognomi[k] = "Kuzmin"
    k++
    arr_cognomi[k] = "Zhukov"
    k++
    arr_cognomi[k] = "Lebedev"
    k++
    arr_cognomi[k] = "Alexeev"
    var i = speaker_get_index("leader_faction1")
    var j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = true
    speaker_name[i] = "General Artemovich"
    speaker_sprite_idle[i] = 67
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 7
    text_hello[i] = "Priviet comrade! How can I help you?"
    var u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    if quest_is_complete("missing_group_2")
    {
        u++
        text[i][u] = "Join Green Army"
        dia_type[i][u] = "join_ga"
        dia_type_answer[i][u] = "So you want to enlist - NPC Dialogue"
    }
    if (global.az_done[(15 << 0)] == true && global.az_done[(16 << 0)] == false)
    {
        u++
        text[i][u] = "Here are some... parts of Vlasov"
        dia_type[i][u] = "spoke_with_artemovich_after_took_eyes"
        dia_type_answer[i][u] = "Mmm... Tongue and eyes huh - NPC Dialogue"
    }
    if (global.az_done[(12 << 0)] == true && global.az_done[(13 << 0)] == false)
    {
        u++
        text[i][u] = "I have a proposal for you"
        dia_type[i][u] = "ga_risposta_cc_bunker"
        dia_type_answer[i][u] = "So you want a Crimson Corporation trader - NPC Dialogue"
    }
    var pp = 0
    question[i][pp] = "Who are you and why are you here?"
    answer[i][pp] = "My name is Viktor Artemovich - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about the Green Army"
    answer[i][pp] = "The Green Army is a delegation - NPC DIalogue"
    if (!quest_is_complete("kill_orel"))
    {
        pp++
        question[i][pp] = "How can I join the Green Army?"
        answer[i][pp] = "I still don't trust you, go to the barman and get some work from him first. When you are ready he will let you know."
    }
    i = speaker_get_index("trader_faction1")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_name[i] = "Alexei Andreevich"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Priviet comrade! Do you wanna buy something?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    u++
    speaker_quest[i][j] = (105 << 0)
    speaker_quest_chance[i][j] = 50
    j++
    speaker_quest[i][j] = (106 << 0)
    speaker_quest_chance[i][j] = 2
    j++
    speaker_quest[i][j] = (107 << 0)
    speaker_quest_chance[i][j] = 2
    j++
    speaker_quest[i][j] = (109 << 0)
    speaker_quest_chance[i][j] = 2
    j++
    speaker_quest[i][j] = (158 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (157 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (159 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (160 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (163 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (164 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (165 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (166 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (141 << 0)
    speaker_quest_chance[i][j] = 2
    j++
    speaker_quest[i][j] = (142 << 0)
    speaker_quest_chance[i][j] = 2
    j++
    speaker_quest[i][j] = (167 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (168 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    i = speaker_get_index("leader_faction2")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Henry Davies"
    speaker_sprite_idle[i] = 63
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 2
    speaker_quest[i][j] = (105 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (106 << 0)
    speaker_quest_chance[i][j] = 1
    speaker_quest[i][j] = (110 << 0)
    text_hello[i] = "How can I help you?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me more about your faction"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    text[i][u] = "I've found some documents"
    dia_type[i][u] = "task"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is Henry Davies and I was in charge of the lab in Zakov."
    pp++
    question[i][pp] = "What does the Crimson Corporation do?"
    answer[i][pp] = "Crimson Corporation is a multinational company - NPC Dialogue"
    pp++
    question[i][pp] = "What does Crimson Corporation have to do with the accident?"
    answer[i][pp] = "Everyone thinks we were making secret weapons - NPC Dialogue"
    pp++
    question[i][pp] = "If you're just a biomedical company, why are there so many troops?"
    answer[i][pp] = "I can see you're a clever person - NPC Dialogue"
    i = speaker_get_index("trader_faction2")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_name[i] = "Riley Evans"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 2
    speaker_quest[i][j] = (105 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (106 << 0)
    speaker_quest_chance[i][j] = 1
    speaker_quest[i][j] = (110 << 0)
    text_hello[i] = "Do you wanna buy something?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    i = speaker_get_index("crimson_trader_bunker")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_name[i] = "Riley Evans"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 2
    speaker_quest[i][j] = (105 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    speaker_quest[i][j] = (106 << 0)
    speaker_quest_chance[i][j] = 1
    speaker_quest[i][j] = (110 << 0)
    text_hello[i] = "Do you wanna buy something?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    i = speaker_get_index("bar")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = true
    speaker_name[i] = "Barman"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 15
    speaker_quest[i][j] = "first_step_1"
    j++
    text_hello[i] = "Hello stranger! Are you hungry?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    u++
    text[i][u] = "Refill hunger and thirst"
    dia_type[i][u] = "barman_refill"
    u++
    text[i][u] = "I need some equipment"
    dia_type[i][u] = "free_equipment"
    pp = 0
    question[i][pp] = "What is this place"
    answer[i][pp] = "This is the Zero Sievert - NPC Dialogue"
    pp++
    question[i][pp] = "What happened at Zakov"
    answer[i][pp] = "On April 4, 2017, the plant exploded - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about the old nuclear power plant"
    answer[i][pp] = "It was a nuclear power plant active until 2014 - NPC Dialogue"
    pp++
    question[i][pp] = "Where can I find some jobs?"
    answer[i][pp] = "I can give you a few ones - NPC Dialogue"
    pp++
    question[i][pp] = "How can I reach other areas?"
    answer[i][pp] = "Oh, so you wanna be a Hunter - NPC Dialogue"
    pp++
    question[i][pp] = "Where can I store my items?"
    answer[i][pp] = "If you continue to the left you will find a room - NPC Dialogue"
    if (global.quest_unique_done[(91 << 0)] == true)
    {
        pp++
        question[i][pp] = "Why am I always the only one doing these missions?"
        answer[i][pp] = "You're not the only one, you're just the one coming back alive right now - NPC Dialogue"
    }
    i = speaker_get_index("engineer")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = true
    speaker_name[i] = "Engineer Volkov"
    speaker_sprite_idle[i] = 137
    speaker_sprite_move[i] = 138
    speaker_move[i] = false
    speaker_quest_max[i] = 2
    speaker_quest[i][j] = (115 << 0)
    speaker_quest_chance[i][j] = 1
    text_hello[i] = "Hi!"
    text[i][0] = "Bye"
    text[i][1] = "Tell me something"
    text[i][2] = "Task"
    text[i][3] = "Barter and crafting"
    text[i][4] = "Repair equipment"
    pp = 0
    question[i][pp] = "Tell me more about your faction"
    answer[i][pp] = "answer"
    i = speaker_get_index("medic")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 15
    text_hello[i] = "Hey comrade! What do you need?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    u++
    text[i][u] = "Repair armor"
    dia_type[i][u] = "repair_armor"
    u++
    text[i][u] = "Heal me"
    dia_type[i][u] = "heal"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is Viktor Korolev - NPC Dialogue"
    pp++
    question[i][pp] = "How are the studies going?"
    answer[i][pp] = "They proceed slowly, to my chagrin - NPC Dialogue"
    pp++
    question[i][pp] = "How has radiation changed the zone?"
    answer[i][pp] = "In an unbelievable way - NPC Dialogue"
    if (quest_is_complete("laboratory_document") && (!quest_is_complete("the_crystal")))
    {
        pp++
        question[i][pp] = "What happened to those people in the beds?"
        answer[i][pp] = "I don't know, some helicopters have fallen into the swamp recently - NPC Dialogue"
    }
    if (global.quest_unique_done[(68 << 0)] == true)
    {
        pp++
        question[i][pp] = "Are you analysing the flesh tissue I recovered from the lab?"
        answer[i][pp] = "Absolutely! It will take some time though - NPC Dialogue"
    }
    if (global.quest_unique_done[(94 << 0)] == true)
    {
        pp++
        question[i][pp] = "What the hell is that purple crystal?"
        answer[i][pp] = "I don't know hunter - NPC Dialogue"
    }
    if (global.az_done[(5 << 0)] == true)
    {
        pp++
        question[i][pp] = "What can you tell me about an old nuclear power plant in Ukraine?"
        answer[i][pp] = "Who told you about this - NPC Dialogue"
    }
    i = speaker_get_index("the_networker")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = true
    speaker_quest_max[i] = 15
    speaker_quest[i][j] = "daily_quest_0"
    j++
    speaker_quest[i][j] = "daily_quest_1"
    j++
    speaker_quest[i][j] = "daily_quest_6"
    j++
    speaker_quest[i][j] = "daily_quest_7"
    j++
    text_hello[i] = "Hey comrade!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "I am many things - NPC Dialogue"
    pp++
    i = speaker_get_index("random_trader")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_name[i] = "Barman"
    speaker_sprite_idle[i] = 55
    speaker_sprite_move[i] = 56
    speaker_move[i] = false
    speaker_quest_max[i] = 5
    speaker_quest[i][j] = (149 << 0)
    speaker_quest_chance[i][j] = 1
    text_hello[i] = "Hello stranger! Are you hungry?"
    text[i][0] = "Bye"
    text[i][1] = "I want to know something"
    text[i][2] = "Task"
    text[i][3] = "Trade"
    pp = 0
    question[i][pp] = "Tell me more about old nuclear power plant"
    answer[i][pp] = "aaa"
    i = speaker_get_index("quest_dealer")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_name[i] = "aaaa"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = ""
    text[i][0] = "Bye"
    text[i][1] = "I want to know something"
    text[i][2] = "Task"
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "I am Dmitriy - NPC Dialogue"
    pp++
    question[i][pp] = "What kind of tasks can you give me?"
    answer[i][pp] = "Of any kind. People come in here - NPC Dialogue"
    i = speaker_get_index("leader_crimson_base")
    j = 0
    is_a_trader[i] = true
    is_a_quest_giver[i] = true
    speaker_quest_max[i] = 10
    text_hello[i] = "Well well, a hunter. What do you want from the crimson Corporation?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    if quest_is_complete("document_village_2")
    {
        u++
        text[i][u] = "Join Crimson Corporation"
        dia_type[i][u] = "join_cc"
        dia_type_answer[i][u] = "So do you want to join us?That would be a wise choice Hunter - NPC Dialogue"
    }
    if (quest_is_complete("new_arrivals") && global.az_done[(14 << 0)] == false)
    {
        u++
        text[i][u] = "I've helped you dock"
        dia_type[i][u] = "cc_spoke_after_port_quest"
        dia_type_answer[i][u] = "So it was you? Good job Hunter - NPC Dialogue"
    }
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is Reynard, I am the commander of the Crimson Corporation forces stationed at Zakov."
    pp++
    question[i][pp] = "What is the Crimson Corporation?"
    answer[i][pp] = "It's a multinational company - NPC Dialogue"
    pp++
    question[i][pp] = "I have not heard good things about the Crimson Corporation"
    answer[i][pp] = "That's because you're from the ZERO Sievert bunker - NPC Dialogue"
    pp++
    question[i][pp] = "Why all these soldiers? What are you still doing here?"
    answer[i][pp] = "We are trying to find out what happened - NPC Dialogue"
    pp++
    question[i][pp] = "What is your relationship with the Green Army?"
    answer[i][pp] = "Immediately after the accident we were on good terms - NPC Dialogue"
    i = speaker_get_index("forest_trader")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = true
    speaker_name[i] = "Igor Kuzmin"
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 1
    speaker_quest[i][j] = "igor_supplies"
    speaker_quest_chance[i][j] = 1
    text_hello[i] = ""
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    if quest_is_active("old_man")
    {
        if quest_is_complete("igor_supplies")
        {
            text[i][u] = "Bad news my friend..."
            dia_type[i][u] = "speak_with_igor_during_old_man_quest_1"
            dia_type_answer[i][u] = "So they want me dead - NPC Dialogue"
        }
        else
        {
            text[i][u] = "Green army wants you dead"
            dia_type[i][u] = "speak_with_igor_during_old_man_quest_2"
            dia_type_answer[i][u] = "Ah dirty bastards...\nI'm just a poor old man!\nGo ahead Hunter! Do what you must!"
        }
    }
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "Who am I? Who are you - NPC Dialogue"
    pp++
    question[i][pp] = "What are you doing here all alone?"
    answer[i][pp] = "After the disaster those guys came - NPC Dialogue"
    pp++
    question[i][pp] = "What was this place like before the disaster?"
    answer[i][pp] = "A marvel! There is a village in the middle of the forest - NPC Dialogue"
    i = speaker_get_index("junk_trader")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = true
    speaker_name[i] = "Mr. Gears"
    speaker_sprite_idle[i] = 199
    speaker_sprite_move[i] = 199
    speaker_move[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Don't look at Mr Junk's treasure!"
    u = 0
    text[i][u] = "Bye Mr. Junk"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    text[i][u] = "Trade"
    dia_type[i][u] = "trade"
    u++
    speaker_quest[i][j] = "mr_junk_ring"
    speaker_quest_chance[i][j] = 1
    pp = 0
    question[i][pp] = "What a beautiful... costume I guess?"
    answer[i][pp] = "Oh! Oh! Beautiful, isn't it - NPC Dialogue"
    pp++
    question[i][pp] = "Who are you?"
    answer[i][pp] = "What do you mean? Oh! Oh - NPC Dialogue"
    pp++
    question[i][pp] = "What can you tell me about this area?"
    answer[i][pp] = "Oh! This place is beautiful - NPC Dialogue"
    pp++
    question[i][pp] = "What is that thing that looks like a person?"
    answer[i][pp] = "This is Grigoriy! He was the only nice child with Mr. Junk - NPC Dialogue"
    pp++
    question[i][pp] = "What's behind that door?"
    answer[i][pp] = "There's Mr. Junk's treasure - NPC Dialogue"
    i = speaker_get_index("unknown_sewer")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = ""
    speaker_sprite_idle[i] = 2054
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "I bet you have many questions"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is not important, I'm just a Hunter like you - NPC Dialogue"
    pp++
    question[i][pp] = "What are you doing here?"
    answer[i][pp] = "This is my current base, I usually move around - NPC Dialogue"
    pp++
    question[i][pp] = "Where do you come from?"
    answer[i][pp] = "As you may have guessed, I am not a big talker - NPC Dialogue"
    pp++
    question[i][pp] = "What the hell is that big crystal?"
    answer[i][pp] = "Huh, that thing is like shit for flies - NPC Dialogue"
    i = speaker_get_index("scientist_cristallo_viola")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = ""
    speaker_sprite_idle[i] = 81
    speaker_sprite_move[i] = 82
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Are you back to see how the studies are going?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "What did you discover?"
    answer[i][pp] = "Not much... As you can see, this crystal is different from the others - NPC Dialogue"
    i = speaker_get_index("green_army_vicino_branda_elicottero")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = ""
    speaker_sprite_idle[i] = 81
    speaker_sprite_move[i] = 82
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Damn! These poor guys"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "What happened?"
    answer[i][pp] = "Recently helicopters have crashed near the swamp - NPC Dialogue"
    i = speaker_get_index("hunter_neutral")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Markus"
    speaker_sprite_idle[i] = 55
    speaker_sprite_move[i] = 2054
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    var o = 0
    pquestion[o] = "What are you doing out here?"
    panswer[o] = "Nothing in particular, some days I need to get fresh air.\nLiving in the bunker all the time is not easy."
    o++
    pquestion[o] = "What are you doing out here?"
    panswer[o] = "This is none of your business, Hunter."
    o++
    pquestion[o] = "What are you doing out here?"
    panswer[o] = "Just chilling, drinking vodka, smoking cigarettes.\nThat's all."
    o++
    pquestion[o] = "Aren't you scared to be out here?"
    panswer[o] = "Well, obviously a little bit - NPC Dialogue"
    o++
    pquestion[o] = "Aren't you scared to be out here?"
    panswer[o] = "Nah! I am prepared!\nThe only thing that can scare me is running out of vodka! Haha"
    o++
    pquestion[o] = "Any interesting news?"
    panswer[o] = "Well I'm sorry but I can't help you.\nI generally prefer to mind my own business."
    o++
    pquestion[o] = "Any interesting news?"
    panswer[o] = "I heard that an old man lives in the Forest - NPC Dialogue"
    o++
    pquestion[o] = "Any interesting news?"
    panswer[o] = "Try to be careful if you go to the village - NPC Dialogue"
    o++
    pquestion[o] = "Any interesting news?"
    panswer[o] = "Sorry, I don't have any..."
    o++
    pquestion[o] = "Any interesting news?"
    panswer[o] = "I heard that a strange guy lives in Makeshift Camp. I can't remember the name but they said he's kind of crazy."
    var _index = abs(irandom(array_length_1d(pquestion) - 1))
    pp = 0
    question[i][pp] = pquestion[_index]
    answer[i][pp] = panswer[_index]
    i = speaker_get_index("guy")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Markus"
    speaker_sprite_idle[i] = 55
    speaker_sprite_move[i] = 2054
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    i = speaker_get_index("guide")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "The guide"
    speaker_sprite_idle[i] = 124
    speaker_sprite_move[i] = 2054
    speaker_move[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Hello comrade, how can I help you?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is Akim Sokolov, but everyone calls me The Guide - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about The forest"
    answer[i][pp] = "In the forest you will find mainly bandits and wild animals - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about The makeshift camp"
    answer[i][pp] = "It's the area where most of the population was evacuated - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about The industrial area"
    answer[i][pp] = "Is the area where Zakov's major industries used to be - NPC Dialogue"
    pp++
    question[i][pp] = "Tell me more about other areas"
    answer[i][pp] = "After the accident, I never ventured so far north - NPC Dialogue"
    i = speaker_get_index("capotreno")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Conductor"
    speaker_quest_max[i] = 1
    text_hello[i] = "Hello hunter, do you wanna go somewhere?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "I want to leave"
    dia_type[i][u] = "choose_map"
    u++
    pp = 0
    question[i][pp] = "Who are you?"
    answer[i][pp] = "I was a conductor of Zakov's train station - NPC Dialogue"
    pp++
    question[i][pp] = "How can I leave?"
    answer[i][pp] = "I can carry you wherever you want.\nYou just have to pay a fee."
    pp++
    question[i][pp] = "How can I extract from a map?"
    answer[i][pp] = "The only way to leave the map is to find an extraction point - NPC Dialogue"
    speaker_quest[i][j] = (72 << 0)
    speaker_quest_chance[i][j] = 1
    j++
    i = speaker_get_index("sacriel")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Hey Hunter!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    question[i][pp] = "Who are you?"
    answer[i][pp] = "My name is Sacriel - NPC Dialogue"
    pp++
    i = speaker_get_index("green_army_soldier1")
    var nome1 = arr_nomi[irandom(array_length_1d(arr_nomi) - 1)]
    var cognome1 = arr_cognomi[irandom(array_length_1d(arr_cognomi) - 1)]
    var nome_completo = nome1 + " " + cognome1
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = nome_completo
    speaker_sprite_idle[i] = 67
    speaker_sprite_move[i] = 68
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Sorry comrade! I have something else to do"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "Are you happy with your work?"
    answer[i][pp] = "Not much. But orders are orders..."
    i = speaker_get_index("green_army_quest_swamp_leader")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = ""
    speaker_sprite_idle[i] = 67
    speaker_sprite_move[i] = 68
    speaker_move[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Once you are ready, turn on the lights"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "When do we start?"
    answer[i][pp] = "Once you are ready, turn on the lights."
    pp++
    question[i][pp] = "What is the plan?"
    answer[i][pp] = "A light this bright should lure them out into the open, then the slaughter begins."
    i = speaker_get_index("green_army_guardia_ingresso")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Hello comrade!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "What are you doing here?"
    answer[i][pp] = "I'm guarding the front door, can't you tell?"
    pp++
    question[i][pp] = "Is this place safe?"
    answer[i][pp] = "Yes, no mutant or bandit has ever made it through that door"
    i = speaker_get_index("guardia_ingresso_1")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Hello comrade!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "What are you doing here?"
    answer[i][pp] = "My brother Vadim and I have been tasked to guard the main door."
    pp++
    question[i][pp] = "Where are you from?"
    answer[i][pp] = "We come from a small town in Siberia.\nJoining the army was the only way to escape from that life."
    pp++
    question[i][pp] = "So that's your brother Vadim?"
    answer[i][pp] = "Yeah, he used to be nicer before he became an Army Special Agent - NPC Dialogue"
    i = speaker_get_index("guardia_ingresso_2")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "What do you want?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "What are you doing here?"
    answer[i][pp] = "I'm guarding the front door.\nCan't you tell?"
    pp++
    question[i][pp] = "Where are you from?"
    answer[i][pp] = "It's none of your business. Ask my brother Yakim, he has always been the most talkative one."
    pp++
    question[i][pp] = "Is this place really safe?"
    answer[i][pp] = "Of course it is! No mutant or bandit has ever walked through that door."
    i = speaker_get_index("guardia_iniziale")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "What do you want?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "Why can't I go through?"
    answer[i][pp] = "This area is reserved for the Green Army, you do not have authorization."
    i = speaker_get_index("guardia_iniziale_posso_passare")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Don't make a mess"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    i = speaker_get_index("guardia_crimson_base")
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "What do you want?"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "I want to know something"
    dia_type[i][u] = "question"
    if (global.quest_unique_done[(70 << 0)] == false)
    {
        u++
        text[i][u] = "Pay 5000 roubles to pass"
        dia_type[i][u] = "enter_cc_base"
    }
    u++
    pp = 0
    question[i][pp] = "Why can't I go through?"
    answer[i][pp] = "This area is restricted, you do not have permission to pass.\nYou have to pay 5000 roubles every time you want to access."
    i = speaker_get_index("crimson_soldier")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    pp = 0
    question[i][pp] = "Tell me more about your faction"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Where can I find some tasks?"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Tell me more about the nuclear plant disaster"
    answer[i][pp] = "answer"
    i = speaker_get_index("standard_no_question")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    text[i][u] = "Task"
    dia_type[i][u] = "task"
    u++
    i = speaker_get_index("mercenary")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    text[i][0] = "Bye"
    text[i][1] = "Tell me something"
    text[i][2] = "Task"
    pp = 0
    question[i][pp] = "Tell me more about your faction"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Where can I find some tasks?"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Tell me more about the nuclear plant disaster"
    answer[i][pp] = "answer"
    i = speaker_get_index("scientist")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 1
    text_hello[i] = "Hey!"
    u = 0
    text[i][u] = "Bye"
    dia_type[i][u] = "back"
    u++
    text[i][u] = "Tell me something"
    dia_type[i][u] = "question"
    u++
    pp = 0
    question[i][pp] = "Tell me more about your faction"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Where can I find some tasks?"
    answer[i][pp] = "answer"
    pp++
    question[i][pp] = "Tell me more about the nuclear plant disaster"
    answer[i][pp] = "answer"
    i = speaker_get_index("guy2")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Alyosha Egorov"
    speaker_sprite_idle[i] = 130
    speaker_sprite_move[i] = 131
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "Go away! I don't have time to waste on people like you."
    text[i][0] = "Bye"
    text[i][1] = "Tell me something dickhead"
    pp = 0
    question[i][pp] = "Why are you so rude?"
    answer[i][pp] = "WHY? Look where we live now - NPC Dialogue"
    i = speaker_get_index("guy3")
    j = 0
    is_a_trader[i] = false
    is_a_quest_giver[i] = false
    speaker_name[i] = "Yulian Borisov"
    speaker_sprite_idle[i] = 132
    speaker_sprite_move[i] = 133
    speaker_move[i] = true
    speaker_quest_max[i] = 1
    text_hello[i] = "..."
    text[i][0] = "Mmm...Ok bye!"
    text[i][1] = "Tell me something"
    pp = 0
    question[i][pp] = "You're not a man of many words, I see."
    answer[i][pp] = "..."
    i = speaker_get_index("tutorial_npc")
    is_a_trader[i] = true
    is_a_quest_giver[i] = false
    speaker_quest_max[i] = 0
    text_hello[i] = "Hello rookie! Welcome to the tutorial!"
    text[i][0] = "Bye"
    text[i][1] = "I want to know something"
    text[i][2] = "Task"
    text[i][3] = "Trade"
    pp = 0
    question[i][pp] = "What's the point of talking to npc?"
    answer[i][pp] = "Npc can give you usefull information, task and trade with you."
    pp++
}

