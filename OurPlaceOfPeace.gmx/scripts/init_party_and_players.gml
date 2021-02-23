/// init_party_and_players() 
/// Initializes all party and player data in the system.

// party_set(partyId, isHuman, currentHp, playerId, arteName,arteName,arteName,arteName, arteName,arteName,arteName,arteName);
party_set_all(1, "Human",200,Sean,  "Wave", "", "", "", "Smash", "", "", "");
party_set_all(2, "CPU",  100,AD,    "Medic", "", "", "", "Holy Beam", "", "", "");
party_set_all(3, "CPU",  150,Dan,   "Aimed Arrow", "", "", "", "Combat Knife", "", "", "");
party_set_all(4, "CPU",  240,John,  "Incapacitate", "", "", "", "Jolt", "", "", "");
party_set_all(5, "CPU",  240,Serena,"Ocean's Whirlpool", "", "", "", "Wind's Pierce", "", "", "");
party_set_all(6, "CPU",  280,James, "Petal Storm", "", "", "", "Petal Beam", "", "", "");
party_set_all(7, "CPU",  100,Taliko,"Chill Wounds", "", "", "", "Frosted Defense", "", "", "");
party_set_all(8, "CPU",  310,Noel,  "Shove", "", "", "", "Tension", "", "", "");
party_set_all(9, "CPU",  310,Alister,"Bullet Blaze", "", "", "", "Cross Gun", "", "", "");
party_set_all(10, "CPU",  280,Raka,   "Rushing Leaves", "", "", "", "Falling Tree", "", "", "");
party_set_all(11, "CPU",  240,Chloe,  "Bullet Blaze", "", "", "", "Cross Gun", "", "", "");

//player_new(playerId,   name,hp,sp,   att, def,adef,  spd, lvl,xp);
player_new(Sean,  "Naes",     200,300,  10,  20,  20,    9,   1, 0);
player_new(AD,    "Enneirda", 100,200,   1,   5,  50,    6,   1, 0);
player_new(Dan,   "Shashu",   150,400,   5,  10,  30,    7,   1, 0);
player_new(John,  "Nooj",     240,400,  13,  12,  18,   11,   1, 0);
player_new(Serena,"Saruhime", 240,400,  13,  18,  12,   11,   1, 0);
player_new(James, "Nizzerus", 280,400,   5,  14,  14,    9,   1, 0);
player_new(Taliko,"Taliko",   100,200,   1,   5,  50,    6,   1, 0);
player_new(Noel,  "Noel",     310,100,  21,  10,   8,    6,   1, 0);
player_new(Alister,"Alister", 310,100,  21,  10,   8,    6,   1, 0);
player_new(Raka,  "Raka",     280,400,   5,  14,  14,    9,   1, 0);
player_new(Chloe, "Chloe",    240,400,  13,  14,  14,   11,   1, 0);


