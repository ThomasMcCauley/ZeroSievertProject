global.quest_reward_database = 
{
    books: 
    {
        item: [argument[0], argument[1], argument[2]]
    },
    scrap_1: 
    {
        item: [argument[6], argument[7], argument[5], argument[6], argument[7]]
    },
    scrap_2: 
    {
        item: [argument[8], argument[9], argument[10], argument[11], argument[12]]
    },
    scrap_3: 
    {
        item: [argument[13], argument[14], argument[15], argument[16], argument[17]]
    },
    ammo_1: 
    {
        item: [argument[18], argument[19], argument[20], argument[21], argument[22], argument[23], argument[24], argument[25], argument[26], argument[27], argument[28], argument[29], argument[30]]
    },
    ammo_2: 
    {
        item: [argument[31], argument[32], argument[33], argument[34], argument[35], argument[36], argument[37], argument[38], argument[39], argument[40], argument[41], argument[42], argument[43], argument[44], argument[45], argument[46], argument[47], argument[48], argument[49], argument[50], argument[51], argument[52], argument[53], argument[54]]
    },
    ammo_3: 
    {
        item: [argument[55], argument[56], argument[57], argument[58], argument[59], argument[60], argument[61], argument[62], argument[63], argument[64], argument[65], argument[66], argument[67], argument[68], argument[69], argument[70], argument[71], argument[72], argument[73], argument[74], argument[75], argument[76], argument[77], argument[78], argument[79], argument[80], argument[81], argument[82], argument[83], argument[84], argument[85], argument[86]]
    },
    medication_1: 
    {
        item: [argument[87], argument[88], argument[89], argument[90]]
    },
    medication_2: 
    {
        item: [argument[91], argument[92], argument[93], argument[94], argument[95], argument[96], argument[97], argument[98], argument[99], argument[100], argument[101], argument[102], argument[103]]
    },
    medication_3: 
    {
        item: [argument[104], argument[105], argument[106], argument[107], argument[108], argument[109], argument[110], argument[111], argument[112], argument[113], argument[114], argument[115], argument[116], argument[117], argument[118], argument[119]]
    },
    medication_4: 
    {
        item: [argument[120], argument[121], argument[122], argument[123]]
    },
    supplies_1: 
    {
        item: [argument[124], argument[125], argument[126], argument[127], argument[128], argument[129], argument[130]]
    },
    supplies_2: 
    {
        item: [argument[131], argument[132], argument[133], argument[134], argument[135], argument[136], argument[137], argument[138]]
    },
    repair_1: 
    {
        item: [argument[139], argument[140], argument[141], argument[142]]
    },
    repair_2: 
    {
        item: [argument[143], argument[144], argument[145], argument[146]]
    },
    repair_3: 
    {
        item: [argument[147], argument[148], argument[149], argument[150], argument[151], argument[152], argument[153], argument[154]]
    },
    repair_4: 
    {
        item: [argument[155], argument[156], argument[157], argument[158], argument[159], argument[160], argument[161], argument[162]]
    },
    silencer_all: 
    {
        item: [argument[163], argument[164], argument[165], argument[166], argument[167], argument[168], argument[169], argument[170], argument[171], argument[172], argument[173]]
    },
    attachment_1: 
    {
        item: [argument[174], argument[175], argument[176], argument[177], argument[178], argument[179], argument[180], argument[181], argument[182], argument[183], argument[184], argument[185], argument[186], argument[187]]
    },
    attachment_2: 
    {
        item: [argument[188], argument[189], argument[190], argument[191], argument[192], argument[193], argument[194]]
    },
    attachment_3: 
    {
        item: [argument[195], argument[196], argument[197], argument[198], argument[199], argument[200], argument[201], argument[202]]
    },
    attachment_ga_1: 
    {
        item: [argument[203], argument[204], argument[205], argument[206], argument[207], argument[208], argument[209], argument[210], argument[211], argument[212], argument[213], argument[214]]
    },
    attachment_cc_1: 
    {
        item: [argument[215], argument[216], argument[217], argument[218], argument[219], argument[220], argument[221], argument[222], argument[223]]
    },
    building_1: 
    {
        item: [argument[224], argument[225], argument[226], argument[227], argument[228], argument[229], argument[230], argument[231], argument[232]]
    },
    building_2: 
    {
        item: [argument[233], argument[234], argument[235], argument[236], argument[237], argument[238], argument[239], argument[240], argument[241]]
    },
    building_3: 
    {
        item: [argument[242], argument[243], argument[244], argument[245], argument[246], argument[247], argument[248], argument[249]]
    },
    weapon_1: 
    {
        item: [argument[250], argument[251], argument[252], argument[253]]
    }
}

global.quest_kill_array = 
{
    bandit: ["bandit_boss", "bandit_boss_guard", "bandit_boss_outpost", "bandit_expert", "bandit_intermediate", "bandit_master", "bandit_novice", "bandit_regular", "bandit_rookie", "bandit_skilled", "bandit_veteran"],
    hunter: ["hunter_cyclops", "hunter_expert", "hunter_intermediate", "hunter_master", "hunter_rookie", "hunter_skilled", "hunter_veteran"],
    green_army: ["green_army_cyclops", "green_army_expert", "green_army_intermediate", "green_army_master", "green_army_rookie", "green_army_skilled", "green_army_soldier", "green_army_veteran"],
    crimson: ["crimson_cyclops", "crimson_expert", "crimson_intermediate", "crimson_master", "crimson_rookie", "crimson_skilled", "crimson_soldier", "crimson_veteran"]
}

global.quest_database = 
{
    first_step_1: 
    {
        id: "first_step_1",
        name: "First steps",
        experience: 100,
        reputation: 30,
        money: 3000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[0]],
        removable: false,
        text: "Hey stranger! Welcome to the ZERO Sievert bunker.\nI don't know how you got here and frankly I don't care.\nIt's nothing personal, it's just that we see a lot of new faces here and only a few of them come back, so I won't waste my time remembering yours for now.\nFirst let's see what you can do...",
        objective: [argument[1], argument[2]],
        reward: argument[3]
    },
    valuable_item: 
    {
        id: "valuable_item",
        name: "Valuable item",
        experience: 120,
        reputation: 40,
        money: 4000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[8]],
        removable: false,
        text: "Very good Hunter! I didn't expect you to come back alive!\nI have another job for you. When the bandits took over the village in the forest, an old friend of mine left behind an item that is considered very valuable these days.\nThe item should be inside a bag in the southern part of the village, go there and retrieve it.",
        objective: [argument[5]],
        reward: [argument[6], argument[7], argument[8]]
    },
    unlock_makeshift_camp: 
    {
        id: "unlock_makeshift_camp",
        name: "Towards makeshift camp",
        experience: 150,
        reputation: 45,
        money: 6000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[9]],
        removable: false,
        text: "Bandits continue to assault the train at the forest area, preventing us from reaching the makeshift camp.\nYou will have to eliminate some bandits and specific targets, that way I am sure they will calm down for a while.\n\nOnce this mission is completed I will give you access to the bunker area where the Green Army is located. I don't think Artemovich will give you any jobs just yet, but I'm sure you can trade with them.",
        objective: [argument[10], argument[11], argument[12]],
        reward: argument[13]
    },
    the_radio_tower: 
    {
        id: "the_radio_tower",
        name: "The radio tower",
        experience: 100,
        reputation: 30,
        money: 4000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[14]],
        removable: false,
        text: "Well done Hunter!\nNow that we have access to the makeshift camp we can finally see if the old radio station is still active.\nWe don't know the coordinates but I think it will be easy to find it on the map, it should be a paved area.\nAll I ask you to do is go there and see what the situation is like and report back, if you encounter any strange anomalies or mutants there is no need to engage in a fight.",
        objective: [argument[15]],
        reward: argument[16]
    },
    fix_the_radio_tower: 
    {
        id: "fix_the_radio_tower",
        name: "Fix the radio tower",
        experience: 150,
        reputation: 40,
        money: 6000,
        faction: "Loners",
        daily: false,
        initial_item: [argument[17]],
        rep_min: 0,
        quest_next: [argument[18], argument[19]],
        removable: false,
        text: "Strange electrical anomalies you say? Damn!\nWe need to repair that radio tower Hunter, it will allow us to get news from the surrounding areas.\nDon't worry about the anomalies, I'm sure anything that moves can be killed eheh.\nI will also give you the repair kit, the tower is located inside the fence in the northwest part.\nGood luck!",
        objective: [argument[20]],
        reward: argument[21]
    },
    find_usb: 
    {
        id: "find_usb",
        name: "Oh no... Not again!",
        experience: 150,
        reputation: 40,
        money: 6000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Hunter! Last night I had the strangest dream!\nI don't know for what reason but I had to find two flash drives and take them to a strange guy with a beanie. The crazy thing was that I couldn't find these flash drives anywhere, ANYWHERE!\nCan you imagine what that feels like? To have to find two flash drives but not be able to do it?\nWell, you'll figure it out for yourself. Find two and bring them to me",
        objective: [argument[22]],
        reward: argument[23]
    },
    kill_orel: 
    {
        id: "kill_orel",
        name: "Clear the way",
        experience: 200,
        reputation: 50,
        money: 8000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[24], argument[25], argument[26], argument[27], argument[28]],
        removable: false,
        text: "Good job Hunter!\nNow we should be able to pick up radio signals from the surrounding areas.\nWhile you were in the makeshift camp you may have noticed an old train station, it was used by the Green Army during the evacuation after the explosion at the plant to get supplies to the camp. After a short time they were forced to leave that area because of radiation.\nNow that train station is under the control of bandits, it wouldn't be a problem because there is very little left to loot now but it is the only way to the industrial zone and the other maps.\nIf we want to get to them you have to clear the station. No need to kill them all, just eliminate Orel, he is the leader in that area.\nAfter you do that I am sure they will let us pass every time.\nAfter this work I am sure the Green Army will give you some missions to do so make sure you talk to Artemovich.",
        objective: [argument[29]],
        reward: [argument[30], argument[31]]
    },
    new_arrivals: 
    {
        id: "new_arrivals",
        name: "New arrivals",
        experience: 100,
        reputation: 30,
        money: 5000,
        faction: "Loners",
        daily: false,
        initial_item: [argument[32]],
        rep_min: 0,
        quest_next: [argument[33], argument[34], argument[35]],
        removable: false,
        text: "Thanks to the radio tower, we intercepted conversations from the Crimson Corporation.\nIt seems that new agreements between them and the local government allow their presence in the bunker....\nHa! Unbelievable!\nI'd be really curious to know what Artemovich's face looked like when he heard about this, he did everything he could to keep them away from here and now he has to take them in.\nIt seems that the Crimson Corporation is coming with a ship and wants to dock at the port in the industrial zone.\nThe only hope Artemovich has is that they won't succeed, and I think that will be the case since the first Hunters reported a massive Ghoul presence in that area.\nNow it's up to you Hunter, if you want you can take care of the Ghouls and allow the Crimson Corporation to land and come to the bunker.\nYou will also have to place a GPS signal in the main dock, the one between the two abandoned ships.",
        objective: [argument[36], argument[37], argument[38], argument[39]],
        reward: argument[40]
    },
    laboratory_key: 
    {
        id: "laboratory_key",
        name: "The key to the laboratory",
        experience: 150,
        reputation: 35,
        money: 5000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[41]],
        removable: false,
        text: "When you went to the radio station you must have noticed the building there, maybe you even tried to go inside.\nWord on the street is that it was an old lab for the Crimson Corporation.\nThe entrance is locked and you need a key card to get in, unfortunately none of us here have one.\nSo I sent my man, Marat Loginov, to look for the key. He seems to have found a damaged one but we may be able to fix it or make a copy.\nMy man is operating in the industrial zone, he has a small base in the north-west, among the abandoned wagons. I haven't heard from him in days, but that's not unusual.\nGo to the industrial area, find him and bring me the key.",
        objective: [argument[42]],
        reward: [argument[43], argument[44], argument[45]]
    },
    laboratory_document: 
    {
        id: "laboratory_document",
        name: "The lab",
        experience: 300,
        reputation: 60,
        money: 10000,
        faction: "Loners",
        daily: false,
        initial_item: [argument[46]],
        rep_min: 0,
        quest_next: [argument[47]],
        removable: false,
        text: "Hmm...the key is ruined but I think it still works.\nTo be safe I will make a few copies and if you lose it you can buy it back from me.Alright Hunter! I think you already know what to do, I have no idea what will be inside the lab nor what you will have to look for but your goal is to find information that can open the way to the nuclear power plant for us.\nCurrently the railroad to the mall is flooded but it was not always so.\nI think it was purposely flooded by the Crimson Corporation a few days after the explosion, evidently they did not want more people to reach the areas around the plant to buy time and get organized.\nAs I said, the laboratory in the makeshift camp was under the control of the Crimson Corporation, so I think it will contain important information for us.\nGood luck!",
        objective: [argument[48]],
        reward: [argument[49], argument[50], argument[51]]
    },
    gate_sewer: 
    {
        id: "gate_sewer",
        name: "The sewers",
        experience: 200,
        reputation: 20,
        money: 8000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[52], argument[53]],
        removable: false,
        text: "Ah! As I thought...\nThe railroad was flooded by the Crimson Corporation.\nSmart move...\nThey used the old drainage system found in the sewers in the swamp.\nThey are easily visible on the minimap. What you have to do is go into the sewers and close the control valve. Good luck Hunter!",
        objective: [argument[54]],
        reward: argument[55]
    },
    weird_phenomena: 
    {
        id: "weird_phenomena",
        name: "Weird phenomena",
        experience: 150,
        reputation: 30,
        money: 5000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[56]],
        removable: false,
        text: "You must have noticed those bodies at the entrance to the bunker, we don't know what's going on yet.\nSome of Green Army helicopters crashed in the vicinity of the swamp, no call for help or malfunction, just crashed for no apparent reason.\nWhen they recovered the first bodies, we realised that something very strange was happening in that area.\nDid you see the condition of the bodies? My God, I've never seen anything like it.\nThe last helicopter fell recently, if you hurry you should get there before the Green Army and be able to get the flight recorder.",
        objective: [argument[57], argument[58]],
        reward: argument[59]
    },
    clear_swamp: 
    {
        id: "clear_swamp",
        name: "Clear the swamp",
        experience: 400,
        reputation: 70,
        money: 10000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[60]],
        removable: false,
        text: "From the helicopter's black box we were able to discover that the crew had spotted a strange purple crystal in the swamp.\nShortly thereafter, there appears to have been an unusual burst of radiation.\nThe crystal appears to be in the swamp village… There are good and bad news Hunter... The bad news is that there is a large amount of Ghouls in the village in the swamp, and I don't think you will make it alone.\nThe good one is that I contacted the Green Army, they are interested in cleaning up the village to get to the crystal.\nHere's the plan, Hunter.\nEntering the village with all those Ghouls would be a certain death sentence.\nThe village has only one entrance so you will try to lure them out with a very bright light, it will have to be done at night.\nGet into the swamp from 10pm to 3am, Green Army soldiers will be waiting for you.\nIt is advisable to bring an automatic weapon or a shotgun with a large magazine so that you have to reload as little as possible. Good luck Hunter!",
        objective: [argument[61]],
        reward: argument[62]
    },
    the_crystal: 
    {
        id: "the_crystal",
        name: "The crystal",
        experience: 100,
        reputation: 20,
        money: 5000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Heeeey! The Ghoul slaughterer is back!\nOkay Hunter, now it's time to go deeper into the village and find out more about that crystal.\nBe careful",
        objective: [argument[63]],
        reward: [argument[64], argument[65], argument[66]]
    },
    mall_scouting: 
    {
        id: "mall_scouting",
        name: "Mall scouting",
        experience: 100,
        reputation: 20,
        money: 3000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[67]],
        removable: false,
        text: "Great, Hunter!\nNow that we have access to the mall it's time to see what it looks like. You'll have to scout around and find the location of some stores.\nWhat do you say? Is this mission familiar to you?\nI don't understand how that could be possible.\nWhatever, back to us... Go to the mall and find these stores.",
        objective: [argument[68], argument[69], argument[70], argument[71], argument[72]],
        reward: argument[73]
    },
    stilysh_one: 
    {
        id: "stilysh_one",
        name: "Stylish one",
        experience: 500,
        reputation: 60,
        money: 20000,
        faction: "Loners",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "You must know about the guy who hangs around the mall, a very tough guy.\nAnyway, his armour is of incredible quality. If you kill him a few times, I'll give you one.",
        objective: [argument[74]],
        reward: [argument[75]]
    },
    documents_sawmill: 
    {
        id: "documents_sawmill",
        name: "Lost informations",
        experience: 100,
        reputation: 50,
        money: 5000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[76], argument[77]],
        removable: false,
        text: "The Barman told me about you; you seem to have potential.\nThe sawmill in the forest is occupied by bandits, inside there is a safe, we believe it contains important information for us.\nI need you to head there and bring back the contents of the safe.\nI think you can find the location of the sawmill easily in your map, it is a paved area.\nWhat information does the safe contain you say?\nIt's none of your business Hunter, learn to stand your ground and follow orders.",
        objective: [argument[78]],
        reward: [argument[79]]
    },
    old_man: 
    {
        id: "old_man",
        name: "The old man",
        experience: 400,
        reputation: 90,
        money: 2000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "This is more of a personal favour than a real job.\nAfter the explosion at the nuclear power plant, we were instructed to evacuate all the surrounding areas.\nWhen we arrived at the forest my men came across an old man, I think his name was Igor.\nThe fact is that the old man did not want to leave his home and threatened my men, he was very angry. \nWe have a few men stationed in the forest and I would not want Igor to interfere with our operations, so I ask you to take care of him, it should not be a problem, he is old and weak now.",
        objective: [argument[80]],
        reward: [argument[81]]
    },
    motel_1: 
    {
        id: "motel_1",
        name: "The motel p.1",
        experience: 100,
        reputation: 30,
        money: 5000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 40,
        quest_next: [argument[82]],
        removable: false,
        text: "I have an easy job if you're interested, it's about scouting.\nYou need to head into the makeshift camp and find the old motel, check for any threats.",
        objective: [argument[83]],
        reward: argument[84]
    },
    motel_2: 
    {
        id: "motel_2",
        name: "The motel p.2",
        experience: 200,
        reputation: 60,
        money: 6000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 80,
        quest_next: [argument[85]],
        removable: false,
        text: "I sent some of my men to clear out the entrance to the motel. There seems to be a ghoul infestation in the parking lot. Our goal is to eliminate it and retrieve some documents from a soldier who died long ago, when the makeshift camp was still inhabited and we didn't know that radiation could spread that far.\nHe was one of my advisers, his name was Yuli Antonov.\nHis body should be in one of the motel rooms.\nIt will be some time before we intervene so the job is yours if you are interested, Hunter",
        objective: [argument[86], argument[87]],
        reward: [argument[88], argument[89], argument[90], argument[91]]
    },
    missing_group_1: 
    {
        id: "missing_group_1",
        name: "The missing group p.1",
        experience: 100,
        reputation: 30,
        money: 5000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 150,
        quest_next: [argument[92]],
        removable: false,
        text: "Damn!\nOne of our scout teams has just been attacked by something in the swamp, these are their last coordinates.\nHurry up Hunter!\nMaybe someone is still alive...",
        objective: [argument[93]],
        reward: argument[94]
    },
    missing_group_2: 
    {
        id: "missing_group_2",
        name: "The missing group p.2",
        experience: 200,
        reputation: 40,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 150,
        quest_next: [],
        removable: false,
        text: "Were they all torn apart then?\nMost likely it was a Big, another team just spotted one in the swamp.\nI don't want to risk any more men, so the job is yours Hunter.",
        objective: [argument[95]],
        reward: argument[96]
    },
    find_convoy_ga: 
    {
        id: "find_convoy_ga",
        name: "Surprise assault",
        experience: 200,
        reputation: 30,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 400,
        quest_next: [argument[97]],
        removable: false,
        text: "Ok Soldier! Some of my trusted men were part of a convoy that was carrying equipment.\nThey were ambushed in the swamp and from the last radio contact it seems to have been the Crimson Corporation, which is very strange since very few people knew about this convoy...\nHopefully they are just bandits otherwise I have to consider the idea that there is a spy in our ranks...\nGo to the swamp, find the convoy and see what you can find out.",
        objective: [argument[98]],
        reward: [argument[99]]
    },
    retaliation: 
    {
        id: "retaliation",
        name: "Retaliation",
        experience: 200,
        reputation: 30,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 400,
        quest_next: [argument[100]],
        removable: false,
        text: "Damn!\nThen it is very likely that there is a spy among my men, I will see what I can find out.\nIn the meantime, we are planning a retaliation against the Crimson Corporation.\nDo your part soldier, you must eliminate some targets.",
        objective: [argument[101], argument[102], argument[103]],
        reward: [argument[104], argument[105], argument[106]]
    },
    building_outpost: 
    {
        id: "building_outpost",
        name: "Building an outpost",
        experience: 200,
        reputation: 50,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 525,
        quest_next: [argument[107]],
        removable: false,
        text: "Thanks to the retaliation we now have some time to build an outpost in the makeshift camp.,Your orders are to go to the industrial area and find a bag of cement.\nI think you can find one in the port area, where all those disused concrete blocks are.",
        objective: [argument[108]],
        reward: argument[109]
    },
    find_cctv: 
    {
        id: "find_cctv",
        name: "Find the CCTV cameras",
        experience: 200,
        reputation: 20,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 550,
        quest_next: [argument[110]],
        removable: false,
        text: "The Crimson corporation attacked the outpost we were building, by now I know for a fact that there is a spy and fortunately I sent more men than they needed and because of that they were able to repel the attack.\nSurely that filthy rat must have put some CCTV cameras here in the bunker, see if you can find some.",
        objective: [argument[111], argument[112], argument[113]],
        reward: argument[114]
    },
    eliminate_the_spy: 
    {
        id: "eliminate_the_spy",
        name: "Eliminate the spy",
        experience: 200,
        reputation: 40,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 600,
        quest_next: [argument[115], argument[116]],
        removable: false,
        text: "Well done soldier!\nNow you have to deal with that bastard. His name is Ermolai Vlasov, he has been a Green Army recruit for a few weeks.\nI must say the son of a bitch did well, it's not easy to fool me.\nMy men spotted him but he managed to escape, now he is near the makeshift camp.\nKilling on sight soldier, no mercy. Once eliminated take his dogtag too, let's prepare a gift for Reynard...",
        objective: [argument[117], argument[118]],
        reward: argument[119]
    },
    find_empty_room_mall: 
    {
        id: "find_empty_room_mall",
        name: "Mall's outpost",
        experience: 200,
        reputation: 40,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 640,
        quest_next: [argument[120]],
        removable: false,
        text: "Good job on that spy, Soldier!\nNow we can get on with the next move, go recon inside the mall and look for a fairly empty place that can become our outpost on the spot.\nFrom the mall map, it looks like the area south of the loading/unloading area of the supermarket is empty.\nGo there and see if it is still like that.",
        objective: [argument[121]],
        reward: argument[122]
    },
    truck_and_generator: 
    {
        id: "truck_and_generator",
        name: "Trucks and generator",
        experience: 200,
        reputation: 40,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [argument[123], argument[124]],
        rep_min: 650,
        quest_next: [argument[125]],
        removable: false,
        text: "Okay soldier! The location you found should work well.\nYour next goals are to find a generator inside the mall and trucks.\nI think you can find the generator in the northeast area inside the mall.\nMeanwhile, there should be many trucks in the underground parking lot in the north area where the back exit is.\nOnce you find them, place GPS markers, my men will take care of the rest.",
        objective: [argument[126], argument[127]],
        reward: argument[128]
    },
    kill_assassins: 
    {
        id: "kill_assassins",
        name: "Eliminate the assassins",
        experience: 200,
        reputation: 40,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 650,
        quest_next: [argument[129]],
        removable: false,
        text: "OK Soldier! The outpost is almost ready.\nA trusted man of mine is leading operations at the outpost, and I know that the Crimson Corporation is about to eliminate him.\nWhat you need to do is to eliminate the Crimson Corporation assassins present inside the mall. From my information there should be three of them.\nThe first one should be inside the LIO-JU clothing store.\nThe second in the area where the Abibas shoe store and the Tools store are.\nThe third in the TECH Store, next to the GUNS Store.\nGood luck soldier, do a clean job.",
        objective: [argument[130], argument[131], argument[132]],
        reward: argument[133]
    },
    mall_unlock_equipment_ga: 
    {
        id: "mall_unlock_equipment_ga",
        name: "New equipment",
        experience: 200,
        reputation: 20,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 700,
        quest_next: [],
        removable: false,
        text: "It's time to see what's left in the GUNS store in the mall. Go there and look for a crate with equipment.\nMaybe we can get some new equipment",
        objective: [argument[134]],
        reward: [argument[135], argument[136], argument[137], argument[138], argument[139], argument[140], argument[141], argument[142]]
    },
    the_war_ga: 
    {
        id: "the_war_ga",
        name: "The War",
        experience: 200,
        reputation: 85,
        money: 7000,
        faction: "Green Army",
        daily: false,
        initial_item: [],
        rep_min: 800,
        quest_next: [],
        removable: false,
        text: "Soldier!\nMy men have reported a large amount of Crimson Corporation soldiers present everywhere. There are Crimson Captains in the field, one on each map. Your task will be to eliminate them.\nGet ready Soldier... It will be a bloodbath...",
        objective: [argument[143], argument[144], argument[145], argument[146], argument[147], argument[148]],
        reward: [argument[149], argument[150]]
    },
    lost_convoy: 
    {
        id: "lost_convoy",
        name: "The lost convoy",
        experience: 100,
        reputation: 35,
        money: 5000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[151], argument[152]],
        removable: false,
        text: "Hey Hunter!\nThanks again for clearing the harbor!\nIf you want a job I have one for you, one of the convoys that was carrying supplies is delayed.\nThe last known location is in the forest, go there and find out what's going on.",
        objective: [argument[153]],
        reward: [argument[154]]
    },
    vendetta: 
    {
        id: "vendetta",
        name: "Vendetta",
        experience: 100,
        reputation: 40,
        money: 5000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Damn it! Was it the bandits then?\nI'm not surprised, they are creating quite a few problems for our supplies.\nHelp us to fix the situation Hunter, clear out the bandits.",
        objective: [argument[155]],
        reward: argument[156]
    },
    equipment_bag: 
    {
        id: "equipment_bag",
        name: "Retrieve the briefcase",
        experience: 300,
        reputation: 30,
        money: 10000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 150,
        quest_next: [argument[157]],
        removable: false,
        text: "While disembarking at the industrial area port, my men forgot a briefcase with electronic components in it.\nDamned recruits, in such an emergency situation the Crimson Corporation sent infants.\nGo there and retrieve it Hunter, it should be in the southeastern part of the harbor.",
        objective: [argument[158]],
        reward: [argument[159], argument[160], argument[161]]
    },
    document_village_1: 
    {
        id: "document_village_1",
        name: "Find the Hunter",
        experience: 100,
        reputation: 30,
        money: 5000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 200,
        quest_next: [argument[162]],
        removable: false,
        text: "\nA Hunter was working for us near the forest. He hasn't been heard from for more than 24 hours now; I think he's dead by now.\nHis job was to find out what happened to the documents we were transporting to the bunker.\nHis last known location was in the forest village in the northern area.\nSearch for his body and bring back what you find, let's see if he discovered anything before he died.",
        objective: [argument[163]],
        reward: argument[164]
    },
    document_village_2: 
    {
        id: "document_village_2",
        name: "Retrieve the documents",
        experience: 300,
        reputation: 60,
        money: 10000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 200,
        quest_next: [],
        removable: false,
        text: "Mmm... Okay it seems that Hunter had found the documents but then he ran into Lazar, the bandit leader in the forest village.\nI'm sure he still has the documents; he must have hidden them somewhere inside the police station.\nGo there and look for them....\nOh and while you're at it, kill Lazar too. This is not the first time he has interfered with our operations",
        objective: [argument[165], argument[166]],
        reward: argument[167]
    },
    cctv_camera: 
    {
        id: "cctv_camera",
        name: "The CCTV Camera",
        experience: 100,
        reputation: 35,
        money: 5000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [argument[168]],
        rep_min: 400,
        quest_next: [argument[169]],
        removable: false,
        text: "Ok Hunter! First job for you.\nThe Green Army does not yet know that you are now part of the Crimson Corporation, we must take advantage of this opportunity.\nGo to their bunker area, where Artemovich is, and place a CCTV camera.\nTry to hide it among the shelves.",
        objective: [argument[170]],
        reward: [argument[171]]
    },
    high_profile_targets_cc: 
    {
        id: "high_profile_targets_cc",
        name: "High-Profile Targets",
        experience: 200,
        reputation: 50,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 400,
        quest_next: [argument[172]],
        removable: false,
        text: "Nice Work Hunter!\nNow it is only a matter of time before we receive information about their movements. Your next task is to eliminate some Green Army sergeants.\nThey will definitely be replaced but this will create some disorganization in their ranks and we will have some time for our operations.",
        objective: [argument[173], argument[174], argument[175]],
        reward: [argument[176], argument[177], argument[178], argument[179]]
    },
    place_gps_outpost_for_cc: 
    {
        id: "place_gps_outpost_for_cc",
        name: "Green Army outpost",
        experience: 200,
        reputation: 40,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [argument[180]],
        rep_min: 550,
        quest_next: [argument[181]],
        removable: false,
        text: "We know that the Green Army is building a new outpost in the makeshift camp but at the moment we do not know the exact location.\nI'm asking you to go out on scout, find the outpost, and place a GPS signal.\nFor now there shouldn't be many Green Army soldiers yet so you should make it on your own.",
        objective: [argument[182]],
        reward: argument[183]
    },
    locate_spy_for_cc: 
    {
        id: "locate_spy_for_cc",
        name: "The missing spy",
        experience: 200,
        reputation: 30,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 600,
        quest_next: [argument[184], argument[185]],
        removable: false,
        text: "Good job Hunter! Now my men will take care of cleaning up the place and make it our outpost.\nIn the meantime you can take care of another matter. It seems that the Green Army has discovered the CCTV camera you planted in their bunker area.\nThey have begun to scour their soldiers and I think they have discovered one of our spies working in their ranks.\nThe last known location is in the swamp, go there and see if you can find it before the Green Army.",
        objective: [argument[186]],
        reward: argument[187]
    },
    place_transmitter: 
    {
        id: "place_transmitter",
        name: "Monitoring p. 1",
        experience: 200,
        reputation: 60,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [argument[188], argument[189], argument[190]],
        rep_min: 625,
        quest_next: [argument[191]],
        removable: false,
        text: "Ah poor man... So when you arrived he was still alive and reported that the Green Army is heading toward the mall?\nThey probably want to build a base there.\nOk Hunter! We must have eyes inside the mall.\nKeep these transmitters, you'll have to place them in three different locations. The first two are inside the mall, near the main entrance and the east entrance. Near these entrances there are monitoring rooms, you have to place the transmitters on those monitors.\nThe third location is in the underground parking lot, in the central area. There should be a monitoring room there as well.\nGood luck!",
        objective: [argument[192], argument[193], argument[194]],
        reward: argument[195]
    },
    place_CCTV_mall: 
    {
        id: "place_CCTV_mall",
        name: "Monitoring p. 2",
        experience: 200,
        reputation: 30,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [argument[196]],
        rep_min: 650,
        quest_next: [argument[197]],
        removable: false,
        text: "Good job Hunter!\nWe are already getting the first pictures, it looks like the Green Army is setting up near the shoe store located on the west side of the Mall.\nThey have tampered with the mall cameras in that area so we are blind.\nGo there and place a CCTV camera inside the shoe store so we can see their movements.",
        objective: [argument[198]],
        reward: argument[199]
    },
    target_ga_mall_base: 
    {
        id: "target_ga_mall_base",
        name: "Raid the outpost",
        experience: 200,
        reputation: 50,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 700,
        quest_next: [argument[200]],
        removable: false,
        text: "There is movement at the new Green Army base in the mall.\nIt seems that a Green Army sergeant has arrived on site to coordinate operations.\nTry to eliminate him Hunter, if you do we may take control of that area.",
        objective: [argument[201]],
        reward: argument[202]
    },
    mall_unlock_equipment_cc: 
    {
        id: "mall_unlock_equipment_cc",
        name: "New equipment",
        experience: 200,
        reputation: 20,
        money: 8000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 700,
        quest_next: [],
        removable: false,
        text: "It's time to see what's left in the GUNS store in the mall. Go there and look for a crate with equipment.\nMaybe we can get some new equipment",
        objective: [argument[203]],
        reward: [argument[204], argument[205], argument[206], argument[207], argument[208], argument[209], argument[210], argument[211], argument[212], argument[213]]
    },
    the_war_cc: 
    {
        id: "the_war_cc",
        name: "The War",
        experience: 200,
        reputation: 85,
        money: 7000,
        faction: "Crimson Corporation",
        daily: false,
        initial_item: [],
        rep_min: 800,
        quest_next: [],
        removable: false,
        text: "After the recent events at the Mall, the Green Army requested many reinforcements in the field.\nWe are prepared for this...\nYou must eliminate all Green Army captains, there is one on each map.\nGood luck Hunter! You'll need it...",
        objective: [argument[214], argument[215], argument[216], argument[217], argument[218], argument[219]],
        reward: [argument[220], argument[221]]
    },
    igor_meat: 
    {
        id: "igor_meat",
        name: "Meat for Igor",
        experience: 50,
        reputation: 20,
        money: 100,
        faction: "Player",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Would you bring me 10 pieces of raw meat?\nYou'd be doing me a big favour.",
        objective: [argument[222]],
        reward: argument[223]
    },
    igor_supplies: 
    {
        id: "igor_supplies",
        name: "Supplies for Igor",
        experience: 100,
        reputation: 20,
        money: 3000,
        faction: "Player",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [argument[224]],
        removable: false,
        text: "My leg is still not fully healed.\nThanks to my experience I can still move through the forest somehow.\nCould you bring me some medicine? It would heal faster",
        objective: [argument[225], argument[226], argument[227]],
        reward: argument[228]
    },
    igor_revenge: 
    {
        id: "igor_revenge",
        name: "Revenge for Igor",
        experience: 100,
        reputation: 20,
        money: 3000,
        faction: "Player",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Hey Hunter!\nListen... I have a big favor to ask of you....\nThe Green Army soldier who shot me in the leg is called Bogdanov, that damn bastard must pay....\nNow I think he is in the Makeshift camp, you know what you have to do....\nThank you Hunter",
        objective: [argument[229]],
        reward: [argument[230]]
    },
    mr_junk_ring: 
    {
        id: "mr_junk_ring",
        name: "Grigory's ring",
        experience: 150,
        reputation: 20,
        money: 100,
        faction: "Player",
        daily: false,
        initial_item: [],
        rep_min: 0,
        quest_next: [],
        removable: false,
        text: "Oh! Oh! Can you do something for Mr. Junk?\nNow that Grigoriy has come back to life he would love to get his ring back.\nMr. Junk hid it in the swamp before he came to this place.\nIf you do this for Mr. Junk then he will sell you some of his treasure.\nNo! No! No! Mr. Junk loves his treasure...\nOh! Oh! But it's more important to make Grigoriy happy.\nYes! Yes! Yes!\nYou bring Mr. Junk the ring and he'll sell you some of his treasure.\nMr. Junk will also give you this costume he found",
        objective: [argument[231]],
        reward: [argument[232], argument[233], argument[234]]
    }
}

