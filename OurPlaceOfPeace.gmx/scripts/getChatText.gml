#define getChatText
///getChatText(CUT_picked)

var CUT_picked = argument0;
var chatMap;

// TODO - Optimize this now
chatMap[CUT_INTRO] = getIntroChat();
chatMap[CUT_HOUSE_FIRE] = getHouseFireChat();
chatMap[CUT_MEET_NAEN] = getMeetNaEnChat();
chatMap[CUT_JOIN_NAEN] = getJoinNaEnChat();
chatMap[CUT_ENTER_MELIORATE] = getEnterMeliorateChat();
chatMap[CUT_LEAVE_MELIORATE] = getLeaveMeliorateChat();
chatMap[CUT_ENTER_LAMPROPHYRE] = getEnterLamprophyreChat();

return chatMap[CUT_picked];

#define newChat
/// newChat()
var chat = instance_create(0,0, EmptyObject);
(chat).count = 0;
return chat;

#define newChatLine
///newChatLine(chat, playerName, text);
var chatObject = argument0;
(chatObject).lines[(chatObject).count, CHAT_PLAYERID] = argument1;
(chatObject).lines[(chatObject).count, CHAT_TEXT_ENG] = argument2;
(chatObject).count++;
return chatObject;

#define newNarratorLine
///newNarratorLine(chat, text);
var chatObject = argument0;
(chatObject).lines[(chatObject).count, CHAT_PLAYERID] = noone;
(chatObject).lines[(chatObject).count, CHAT_TEXT_ENG] = argument1;
(chatObject).count++;
return chatObject;

#define getIntroChat
var chat = newChat();

chat = newChatLine(chat, Noel, 
    '"Ugh, after working two doubles in a row, I can finally go home and get some sleep..."');
chat = newNarratorLine(chat, 
    'You can destroy obstacles on the field with the attack button.');

return chat;

#define getHouseFireChat
var chat = newChat();

chat = newChatLine(chat, Noel, '"A total of 6 hours of sleep through the last three days, but TODAY was the day someone sets my house on fire."');
chat = newChatLine(chat, Noel, '"I wouldn`t be nearly as upset except my bed is in there.  A bed I should be sleeping in."');
chat = newChatLine(chat, Noel, '"Time to let off some steam against the creepy shadow bat thing."');
chat = newNarratorLine(chat, 
    'Touching foes will initiate combat mode.');


return chat;

#define getMeetNaEnChat
var chat = newChat();

chat = newNarratorLine(chat, 
    "The clear sound of a couple footsteps was heard around a bend further ahead.");
chat = newNarratorLine(chat, 
    "The faint echo indicated that the pace was slow with the intention of stealth.");
chat = newChatLine(chat, Noel, 
    '"If you are here to jump me, I have no money and my house just burned down.');
chat = newChatLine(chat, Sean, 
    '"Apologies, I was unsure if you were hostile or not. I`m sure you can understand why we air on the side of caution in this vicinity," replied an appearring figure. ');
chat = newChatLine(chat, Sean, 
    'The figure was of an average height male, clearly dressed for combat.  A strange symbol lay on his shield that was not initially recognizable for Noel.');
chat = newChatLine(chat, AD, 
    'Behind him stood a shorter, but elegant looking lady.  For such a dusty terrain, her clothes appearred unrealistically clean.');
chat = newChatLine(chat, Noel,
    '"It would be much more believable if you didn`t tiptoe around," he responded abruptly. ');
chat = newChatLine(chat, Sean,
    'His tone would clearly end any normal conversation, but it seemed the recipient was equally strange. ');
chat = newNarratorLine(chat, 
    'An awkward silence held far longer than it should have as the two sides simply exchanged curious glances. ');
chat = newChatLine(chat, Sean,
    '"Well, we will be on our way."');
chat = newNarratorLine(chat, 
    'The two walk away at a brisk pace.  Noel takes the moment to rest, but the sense of danger in the area puts him on edge.');
chat = newChatLine(chat, Noel,
    '"I probably should have joined up with them... maybe I can catch up with them."');

return chat;

#define getJoinNaEnChat
var chat = newChat();

chat = newNarratorLine(chat,
    'Noel captures line of sight with the couple.');
chat = newChatLine(chat, Noel,
    '"Hey, paladin and cleric... person," his presentation holding very weak direction.');
chat = newChatLine(chat, Noel,
    '"The creatures around here are really aggressive."');
chat = newChatLine(chat, Noel,
    '"I would stand a better chance with more people," he stated as he averted his gaze from direct eye contact');
chat = newNarratorLine(chat,
    'The hint was about as subtle as a landslide to the face.');
chat = newChatLine(chat, Sean,
    '"Well..." the warrior stated as he trailed his words.');
chat = newNarratorLine(chat, 
    'The man and young lady simply looked at each other without saying a word.');
chat = newChatLine(chat, Sean,
    '"Alright, let`s cooperate!  I`m Naes and thie is Lady Enne."');
chat = newChatLine(chat, Noel,
    '"They call me Noel back at home.  You know, the one in ashes."');
chat = newNarratorLine(chat, 
    'Naes and Enneirda have joined the party!');

return chat;

#define getEnterMeliorateChat
var chat = newChat();

chat = newNarratorLine(chat, 
    "The town bellows with the sound of tedious labor.");
chat = newNarratorLine(chat, 
    'An older gentleman greets the travellers upon arrival, "Welcome to the Town of Meliorate, strangers."');
chat = newChatLine(chat, Sean,
    '"Greetings friend, I`m hoping you could give us a very simple explanation of the state of things here?", Naes swiftly requested.');
chat = newNarratorLine(chat, 
    'The gnarled man chuckles, "Straight to the point then, eh?  Well..."');
chat = newNarratorLine(chat, 
    '"-we have zero excess food supply"');
chat = newNarratorLine(chat, 
    '"-our tools are at least forty percent rust"');
chat = newNarratorLine(chat, 
    '"-and a handful of youngsters with pitchforks stand between us and the fiends that attack on practically a daily basis."');
chat = newNarratorLine(chat, 
    '"A real paradise," he concludes with a vat of sarcasm.');
chat = newChatLine(chat, Sean,
    'Naes then thinks to himself for a moment then pipes up, "Are there any functioning mines in the area?"');
chat = newNarratorLine(chat, 
    '"There`s a fiend invested source of iron to the west," the archaic human bluntly responds.');
chat = newChatLine(chat, Noel,
    '"`ppreciate the info, gramps!"');

return chat;

#define getLeaveMeliorateChat
var chat = newChat();

chat = newNarratorLine(chat, 
    "Naes immediately begins heading west, clearly towards the previously mentioned mines.");
chat = newChatLine(chat, AD,
    '"Naes, why are we going this way?" the shy cleric questions.');
chat = newChatLine(chat, Sean,
    '"Look at this town.  Everything is dilapidated wood.  It wouldn`t survive if there were a large raid, therefore-"');
chat = newChatLine(chat, Sean,
    '"-we are heading to the mines.  If we can secure a route, we can create a steady flow of resources.  The ore can be used to create significantly better tools for defenses and rate of food creation. "');
chat = newChatLine(chat, Noel,
    '"Some steel would give this giant fossil called a town some backbone.  As long as I can take out my traumatic memories on a couple fiends, I`m for it," Noel huffs as he marches much further.');
chat = newChatLine(chat, AD, 
    'Once Noel is out of audible range, Lady Enne whispers to herself, "Naes... why are you really helping them?"');

return chat;

#define getEnterLamprophyreChat
var chat = newChat();

chat = newNarratorLine(chat, 
    "Naes mentions that they will secure a route, pick up some iron deep within and then present it as proof to the town/");
chat = newNarratorLine(chat, 
    "Noel asks why they are endangering yourself for this town");
chat = newNarratorLine(chat, 
    "Naes mentions that they need a safe village to stay at that is well fortified if looked at from a strategic point of view.");
chat = newNarratorLine(chat, 
    "Enne mentions that more than that, she will do anything she can to improve the well being of the people.");
chat = newNarratorLine(chat, 
    "Enne mentions that Noel had no need to come, even though he is welcome.");
chat = newNarratorLine(chat, 
    "Noel states that it is a sense of repenting for things he could not do.");

return chat;