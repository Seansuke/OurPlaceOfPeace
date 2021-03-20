#define getChatText
///getChatText(CUT_picked)

var CUT_picked = argument0;
var chatMap;

chatMap[CUT_INTRO] = getIntroChat();
chatMap[CUT_MEET_NAEN] = getMeetNaEnChat();
chatMap[CUT_JOIN_NAEN] = getJoinNaEnChat();
chatMap[CUT_ENTER_MELIORATE] = getEnterMeliorateChat();
chatMap[CUT_LEAVE_MELIORATE] = getLeaveMeliorateChat();
chatMap[CUT_ENTER_LAMPROPHYRE] = getEnterLamprophyreChat();

return chatMap[CUT_picked];

#define newChatLine
///newChatLine(chat, playerName, text);
var chatObject = argument0;
(chatObject).lines[(chatObject).count, CHAT_PLAYERID] = argument1;
(chatObject).lines[(chatObject).count, CHAT_TEXT_ENG] = argument2;
(chatObject).count++;
return chat;

#define newNarratorLine
///newNarratorLine(chat, text);
var chatObject = argument0;
(chatObject).lines[(chatObject).count, CHAT_PLAYERID] = -1;
(chatObject).lines[(chatObject).count, CHAT_TEXT_ENG] = argument1;
(chatObject).count++;
return chat;

#define getIntroChat
var chat = instance_create(0,0, EmptyObject);

chat = newChatLine(chat, Noel, '"You fiend... you are to blame."');

return chat;

#define getMeetNaEnChat
var chat = instance_create(0,0, EmptyObject);

chat = newNarratorLine(chat, 
    "The clear sound of a couple footsteps was heard around a bend further ahead.");
chat = newNarratorLine(chat, 
    "The faint echo indicated that the pace was slow with the intention of stealth.");
chat = newChatLine(chat, Noel, 
    '"There`s no point in hiding," he bellowed confidently in the direction of the approaching noise.');
chat = newChatLine(chat, Sean, 
    '"Apologies, I was unsure if you were hostile or not. I`m sure you can understand why we air on the side of caution in this vicinity," replied an appearring figure. ');
chat = newChatLine(chat, Sean, 
    'The figure was of an average height male, clearly dressed for combat.  A strange symbol lay on his shield that was not initially recognizable for Noel.');
chat = newChatLine(chat, AD, 
    'Behind him stood a shorter, but elegant looking lady.  For such a dusty terrain, her clothes appearred unrealistically clean.');
chat = newChatLine(chat, Noel,
    '"I understand," he responded abruptly. ');
chat = newChatLine(chat, Sean,
    'His tone would clearly end any normal conversation, but it seemed the recipient was equally strange. ');
chat = newNarratorLine(chat, 
    'An awkward silence held far longer than it should have as the two sides simply exchanged curious glances. ');
chat = newChatLine(chat, Sean,
    '"Well, we will be on our way."');
chat = newNarratorLine(chat, 
    'The two walk away at a brisk pace.');
chat = newChatLine(chat, Noel,
    '"Perhaps I should have asked for their help.  This area could get dangerous if too many of those vile fiends appear."');

return chat;

#define getJoinNaEnChat
var chat = instance_create(0,0, EmptyObject);

chat = newChatLine(chat, Noel,
    '"Wait."');
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
chat = newNarratorLine(chat, 
    'Though no words were said, the two simply looked at other to make a concensus');
chat = newChatLine(chat, Sean,
    '"Alright, let`s cooperate!  My name is Naes and thie is Lasy Enne."');
chat = newChatLine(chat, Noel,
    '"I`m Noel.  Thanks for your help."');

return chat;

#define getEnterMeliorateChat
var chat = instance_create(0,0, EmptyObject);

chat = newNarratorLine(chat, 
    "This place looks like crap.");
chat = newNarratorLine(chat, 
    "This is Meliorate village");
chat = newNarratorLine(chat, 
    "Villages talk about how they get attacked so frequently.");
chat = newNarratorLine(chat, 
    "Naes asks about any mines in the area.");
chat = newNarratorLine(chat, 
    "Villager states there is one in the area.");
chat = newNarratorLine(chat, 
    "Naes asks about any mines in the area.");
chat = newNarratorLine(chat, 
    "Villager responds how it is likely overrun by aggressive creatures.");
chat = newNarratorLine(chat, 
    "Naes thanks .");

return chat;

#define getLeaveMeliorateChat
var chat = instance_create(0,0, EmptyObject);

chat = newNarratorLine(chat, 
    "Lady Enne asks where we are going.");
chat = newNarratorLine(chat, 
    "Naes mentions that we could secure a route to the mines.");
chat = newNarratorLine(chat, 
    "Lady Enne asks why he even asked about the mines");
chat = newNarratorLine(chat, 
    "Naes explains that this village will not survive a large raid.");
chat = newNarratorLine(chat, 
    "Naes states if they could get a steady flow of resources, the village can improve.");
chat = newNarratorLine(chat, 
    "Naes states how everything here is old dilapidated wood.");
chat = newNarratorLine(chat, 
    "Noel states that he thinks that they could use some steel.");
chat = newNarratorLine(chat, 
    "Enne responds that she trusts Naes's judgement.");

return chat;

#define getEnterLamprophyreChat
var chat = instance_create(0,0, EmptyObject);

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
