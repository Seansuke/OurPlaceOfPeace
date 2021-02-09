//party_set(num, hmn,hp,player, A1 idle, up, side, down, A2 idle, up, side, down);
party_set_all(1, "Human",200,Sean,  "Wave", "", "Smash", "", "", "", "", "");
party_set_all(2, "CPU",  100,AD,    "Medic", "", "Holy Beam", "", "", "", "", "");
party_set_all(3, "CPU",  150,Dan,   "Aimed Arrow", "", "Combat Knife", "", "", "", "", "");
party_set_all(4, "CPU",  240,John,  "Incapacitate", "", "", "", "Jolt", "", "", "");
party_set_all(5, "CPU",  240,Serena,"Ocean's Whirlpool", "", "", "", "Wind's Pierce", "", "", "");
party_set_all(6, "CPU",  280,James, "Petal Storm", "", "", "", "Petal Beam", "", "", "");

//player_new(player,hp,sp, att, def,adef, spd, lvl,xp);
player_new(Sean,  200,300,  10,  20,  20,    9,   1, 0);
player_new(AD,    100,200,   1,   5,  50,    6,   1, 0);
player_new(Dan,   150,400,   5,  10,  30,    7,   1, 0);
player_new(John,  240,400,  13,  12,  18,   11,   1, 0);
player_new(Serena,240,400,  13,  18,  12,   11,   1, 0);
player_new(James, 280,400,   5,  14,  14,    9,   1, 0);

//ctrl_new(num,"type". up,right,down,left, att,guard,arte1,arte2, target,action, menu);
ctrl_new(1,"Keyboard", vk_up,vk_right,vk_down,vk_left, ord('Z'),ord('X'),ord('A'),ord('S'), ord('W'),ord('Q'), ord('C'));
ctrl_new(2,"Keyboard", ord('9'),ord('0'),ord('9'),ord('0'), ord('9'),ord('0'),ord('9'),ord('0'), ord('9'),ord('0'), ord('9'));
ctrl_new(3,"Keyboard", ord('9'),ord('0'),ord('9'),ord('0'), ord('9'),ord('0'),ord('9'),ord('0'), ord('9'),ord('0'), ord('9'));
global.touchList = ds_list_create();

init_game_artes();

//faces
global.face[Sean] = spr_sean_face;
global.name[Sean] = "Naes";
global.face[AD] = spr_ad_face;
global.name[AD] = "Enneirda";
global.face[Dan] = spr_dan_face;
global.name[Dan] = "Shashu";
global.face[John] = spr_john_face;
global.name[John] = "Nooj";
global.face[Serena] = spr_serena_face;
global.name[Serena] = "Saruhime";
global.face[James] = spr_james_face;
global.name[James] = "Nizzerus";

//other stuff
draw_set_color(c_white);
draw_set_font(font_courier);
draw_set_halign(fa_left);
global.menu = false;
global.areaPlayerX = 320;
global.areaPlayerY = 240;
global.currentMap = rm_area_outskirts
global.marker = -1;
global.monsterLevel = 1;
global.menu_plyr = -1;
global.monFight[1] = MAX_MONSTERS;
global.monFight[2] = MAX_MONSTERS;
global.monFight[3] = MAX_MONSTERS;
global.subimg = 0;
