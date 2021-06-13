#define init_game
init_party_and_players();
init_game_controls();
init_game_artes();
init_game_gfx();
init_game_monsters();
init_game_items();
init_game_misc();

#define init_game_gfx

new_gfx(Sean, spr_sean_face, spr_sean_idle, spr_sean_run, spr_sean_def, spr_sean_evade, 
    spr_sean_dmg, spr_sean_dead, spr_sean_def, 
    spr_sean_att, spr_sean_att_up, spr_sean_att_down, spr_sean_att_down, spr_sean_att_air);
    
new_gfx(AD, spr_ad_face, spr_ad_idle, spr_ad_run, spr_ad_def, spr_ad_def, 
    spr_ad_dmg, spr_ad_dead, spr_ad_cast, 
    spr_ad_att, spr_ad_att, spr_ad_att, spr_ad_att, spr_ad_att);
    
new_gfx(Dan, spr_dan_face, spr_dan_idle, spr_dan_run, spr_dan_def, spr_dan_evade, 
    spr_dan_dmg, spr_dan_dead, spr_dan_knife, 
    spr_dan_att, spr_dan_att, spr_dan_att, spr_dan_att, spr_dan_att);
    
new_gfx(John, spr_john_face, spr_john_idle, spr_john_run, spr_john_def, spr_john_evade, 
    spr_john_dmg, spr_john_dead, spr_john_cast, 
    spr_john_att, spr_john_att_up, spr_john_att_down, spr_john_att_down, spr_john_att_air);
    
new_gfx(Serena, spr_serena_face, spr_serena_idle, spr_serena_run, spr_serena_def, spr_serena_evade, 
    spr_serena_dmg, spr_serena_dead, spr_serena_cast, 
    spr_serena_att, spr_serena_att_up, spr_serena_att_down, spr_serena_att_down, spr_serena_att_air);
    
new_gfx(James, spr_james_face, spr_james_idle, spr_james_run, spr_james_def, spr_james_evade, 
    spr_james_dmg, spr_james_dead, spr_james_cast, 
    spr_james_att, spr_james_att_up, spr_james_att_down, spr_james_att_down, spr_james_att_air);
    
new_gfx(Taliko, TalikoFaceSprite, TalikoIdleSprite, TalikoRunSprite, TalikoDefendSprite, 
    TalikoEvadeSprite, TalikoHurtSprite, TalikoDownSprite, TalikoCastSprite, 
    TalikoAttackSprite, TalikoAttackSprite, TalikoAttackSprite, TalikoAttackSprite, TalikoAttackSprite);

new_gfx(Alister, AlisterFaceSprite, AlisterIdleSprite, AlisterDashSprite, AlisterDefendSprite, 
    AlisterDefendSprite, AlisterHurtSprite, AlisterDownSprite, AlisterGunsSprite, 
    AlisterSlashSprite, AlisterSlashSprite, AlisterSlashSprite, AlisterSlashSprite, AlisterSlashSprite);

new_gfx(Noel, NoelFaceSprite, NoelIdleSprite, NoelRunSprite, NoelDefendSprite, 
    NoelDashSprite, NoelHurtSprite, NoelDownSprite, NoelShoveSprite, 
    NoelHammerSlashSprite, NoelGolfSwingSprite, NoelHammerSlashSprite, NoelHammerSlashSprite, NoelHammerSlashSprite);

new_gfx(Raka, RakaFaceSprite, RakaIdleSprite, RakaFlyForward, RakaDefendSprite, 
    RakaFlyBackwards, RakaHurtSprite, RakaDownSprite, RakaCastSprite, 
    RakaHammerSwingSprite, RakaHammerSwingSprite, RakaHammerSwingSprite, RakaHammerSwingSprite, RakaHammerSwingSprite);

new_gfx(Chloe, ChloeFaceSprite, ChloeIdleSprite, ChloeDashSprite, ChloeDefendSprite, 
    ChloeDefendSprite, ChloeDefendSprite, ChloeDownSprite, ChloeGunsSprite, 
    ChloeHammerSlashSprite, ChloeHammerSlashSprite, ChloeHammerSlashSprite, ChloeHammerSlashSprite, ChloeHammerSlashSprite);


#define init_game_artes

arte_init();

//======================Sean======================
//melee
arteId = arte_new(Sean,"Smash",spr_sean_att_up,GFX_ATTACK_UP,    
    1.2,3.0,   6,100,  1,
    "Hold [ARTE] to charge attack to push foes back.",
    ARTE_EFFECT_BACK, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_VISIBLE, false);
arte_set(arteId, ARTE_POST_WAIT, 3*5);

arteId = arte_new(Sean,"Wall",spr_wall,GFX_DEF,
    0.4,2.0,    1,100,  3,
    "Foes that melee will be sent flying.",
    ARTE_EFFECT_BACK, TYPE_PHYSICAL, 3*7);
arte_set(arteId, ARTE_POST_WAIT, 3*9);

arteId = arte_new(Sean,"Divide",spr_divide,GFX_ATTACK_AIR,                     
    1.5,1.5,  9,300,  5,
    "Hold [ARTE] to charge attack to push foes back.",
    ARTE_EFFECT_NONE, TYPE_SELF, 3*4);
arte_set(arteId, ARTE_POST_WAIT, 3*6);
    
//range
arteId = arte_new(Sean,"Wave",spr_wave,GFX_ATTACK_UP,          
    0.3,2.0,  6,50,   1,
    "Produce a wave of pressure that pushes back foes.",
    ARTE_EFFECT_BACK, TYPE_SHOT, 3*5);
arte_set(arteId, ARTE_MOVE_SPEED, 20);
arte_set(arteId, ARTE_POST_WAIT, 3);

arteId = arte_new(Sean,"Uprise",spr_uprise,GFX_ATTACK_UP,       
    0.7,1.5,  6,200,  2,
    "Force foes upward at a distance.",
    ARTE_EFFECT_LIFT, TYPE_PLACE, 3*6);
arte_set(arteId, ARTE_MOVE_SPEED, 60);
arte_set(arteId, ARTE_POST_WAIT, 3*8);

//======================AD======================
//heal
arteId = arte_new(AD,"Medic",spr_medic,GFX_CAST,          
    0.1,1.0,  16,100, 1,
    "Hold [ARTE] to regenerate an ally's HP.",
    ARTE_EFFECT_HEAL, TYPE_ALLY_TARGET, 3*6);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(AD,"Restore",spr_restore,GFX_CAST,      
    0.5,5.0, 48,200, 5,
    "Give an ally a burst of HP, hold [ARTE] to increase effect.",
    ARTE_EFFECT_HEAL, TYPE_ALLY_TARGET, 3*16);
arte_set(arteId, ARTE_POST_WAIT, 3*18);

//buff
arteId = arte_new(AD,"Might",spr_might,GFX_CAST,          
    1.4,2.0, 32,100, 3,
    "Ally will give more damage to foes.",
    ARTE_EFFECT_ATT_BUFF, TYPE_ALLY_TARGET, 3*15);
arte_set(arteId, ARTE_POST_WAIT, 3*17);

arteId = arte_new(AD,"Endure",spr_endure,GFX_CAST,        
    1.4,2.0, 32,100, 2,
    "Ally will recieve less damage from foes.",
    ARTE_EFFECT_DEF_BUFF, TYPE_ALLY_TARGET, 3*15);
arte_set(arteId, ARTE_POST_WAIT, 3*17);

//offense
arteId = arte_new(AD,"Holy Beam",spr_holy,GFX_CAST,       
    3.0,3.0,  48,200, 1,
    "Blast foes with a condensation of holy energy.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*9);
arte_set(arteId, ARTE_POST_WAIT, 3*11);

//======================Dan======================
//knife
arteId = arte_new(Dan,"Combat Knife",spr_dan_knife,GFX_CAST,      
    1.2,1.2,  3,100,  1,
    "Quickly unleash a knife that pushes foes back.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*2);
arte_set(arteId, ARTE_VISIBLE, false);
arte_set(arteId, ARTE_POST_WAIT, 3*2);

//arrows
arteId = arte_new(Dan,"Aimed Arrow",spr_arrow,GFX_ATTACK_SIDE,     
    0.5,0.1,    9,100,  1,
    "Fire an arrow diagonally.",
    ARTE_EFFECT_NONE, TYPE_AIR_SHOT, 3*10);
arte_set(arteId, ARTE_MOVE_SPEED, 15);
arte_set(arteId, ARTE_POST_WAIT, 3*12);

arteId = arte_new(Dan,"Ice Arrow",spr_icearrow,GFX_ATTACK_SIDE,    
    0.4,0.1,    9,100,  2,
    "Fire a fast but weak arrow infused with ice.",
    ARTE_EFFECT_NONE, TYPE_GRAVITY_SHOT, 3*10);
arte_set(arteId, ARTE_MOVE_SPEED, 25);
arte_set(arteId, ARTE_POST_WAIT, 3*12);

arteId = arte_new(Dan,"Fire Arrow",spr_firearrow,GFX_ATTACK_SIDE,  
    1.0,3.0,   9,100,  3,
    "Fire a slow but strong arrow infused with fire.",
    ARTE_EFFECT_NONE, TYPE_GRAVITY_SHOT, 3*10);
arte_set(arteId, ARTE_MOVE_SPEED, 10);
arte_set(arteId, ARTE_POST_WAIT, 3*12);

//======================John======================
//melee
arteId = arte_new(John,"Incapacitate",spr_thrust,GFX_ATTACK_SIDE,  
    1.0,0.1,   3,200,  1,
    "Strike at such speed that stuns the opponent.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

//range
arteId = arte_new(John,"Jolt",spr_jolt,GFX_CAST,                   
    1.0,0.1,   9,100,  1,
    "Fire a ball of lightning forward",
    ARTE_EFFECT_NONE, TYPE_SHOT, 3*5);
arte_set(arteId, ARTE_MOVE_SPEED, 20);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(John,"Spark",SparkSprite,GFX_CAST,
    2.0,0.1,  24,100,  2,
    "Summon a live spark on the ground in front",
    ARTE_EFFECT_NONE, TYPE_PLACE, 3*5);
arte_set(arteId, ARTE_MOVE_SPEED, 64);
arte_set(arteId, ARTE_POST_WAIT, 3*8);

arteId = arte_new(John,"Storm",StormSprite,GFX_CAST,
    2.0,0.1,  32,200,  5,
    "Call lightning from the sky.",
    ARTE_EFFECT_NONE, TYPE_PLACE, 3*5);
arte_set(arteId, ARTE_MOVE_SPEED, 64);
arte_set(arteId, ARTE_POST_WAIT, 3*7);

//======================Serena======================
// movement
arteId = arte_new(Serena,"Ocean's Whirlpool",spr_spin,GFX_ATTACK_AIR,            
    1.0,0.2, 3,100, 1,
    "Anti-aerial spin like flowing water.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(Serena,"Wind's Pierce",spr_thrust,GFX_ATTACK_SIDE,             
    1.0,0.2, 3,100, 1,
    "Slide through foes like the wind.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(Serena,"Raging Hurricane",spr_hurricane,GFX_ATTACK_UP,             
    1.0,0.2, 3,100, 2,
    "Tear through foes like a rising storm.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(Serena,"Retreating Flame",spr_flame,GFX_ATTACK_UP,             
    0.5,1.0, 3,100, 3,
    "Flicker from foes like a flame in the breeze.",
    ARTE_EFFECT_NONE, TYPE_SELF, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

arteId = arte_new(Serena,"Descending Waterfall",spr_waterfall,GFX_ATTACK_AIR,    
    1.0,0.2, 3*4,200, 5,
    "Rise above your foes and rush them like a falling river.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*8);
arte_set(arteId, ARTE_POST_WAIT, 3*9);

//======================James======================
// melee
arteId = arte_new(James,"Rushing Reap",spr_spin,GFX_ATTACK_SIDE,             
    1.0,0.2, 3,100, 3,
    "Reap your opponents in one swing.",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*6);
    
// magic
arteId = arte_new(James,"Petal Beam",spr_petal_beam,GFX_CAST,   
    1.5,0.5,   12,300,  1,
    "Beam out flaming petals.",
    ARTE_EFFECT_NONE, TYPE_SELF, 3*6);
arte_set(arteId, ARTE_POST_WAIT, 3*7);

arteId = arte_new(James,"Petal Storm",spr_petal_storm,GFX_CAST, 
    1.5,0.5,   12,300,  5,
    "Spin flaming petals around for anti-air.",
    ARTE_EFFECT_NONE, TYPE_SELF, 3*6);
arte_set(arteId, ARTE_POST_WAIT, 3*8);
    
//======================Taliko======================
arteId = arte_new(Taliko,"Chill Wounds",ClearIceBlockSprite,GFX_CAST,
    1.0,5.0,  32,200, 1,
    "Heal an ally with a small burst of HP.",
    ARTE_EFFECT_HEAL, TYPE_ALLY_TARGET, 3*16); 
arte_set(arteId, ARTE_POST_WAIT, 3*18);

arteId = arte_new(Taliko,"Frosted Defense",ClearIceWallSprite,GFX_CAST,        
    1.0,2.0, 32,100, 1,
    "Ally will recieve less damage from foes.",
    ARTE_EFFECT_DEF_BUFF, TYPE_ALLY_TARGET, 3*15);
arte_set(arteId, ARTE_POST_WAIT, 3*17);

//======================Noel======================
arteId = arte_new(Noel,"Shove",NoelShoveSprite,GFX_CAST, 
    1.5,2.0,  3,100, 1,
    "Push a foe far away.",
    ARTE_EFFECT_BACK, TYPE_PHYSICAL, 3); 
arte_set(arteId, ARTE_VISIBLE, false);
arte_set(arteId, ARTE_POST_WAIT, 3*3);

arteId = arte_new(Noel,"Tension",spr_might,GFX_DEF, 
    1.0,1.0, 3,100, 1,
    "Increase your attack power through tense combat.",
    ARTE_EFFECT_ATT_BUFF, TYPE_PHYSICAL, 3*3);
arte_set(arteId, ARTE_POST_WAIT, 3*6);

//======================Alister======================
arteId = arte_new(Alister,"Bullet Blaze",BulletSprite,GFX_CAST, 
    0.1,0.0,  3,30, 1,
    "Fill your foes with lead.",
    ARTE_EFFECT_BACK, TYPE_SHOT, 3*7); 
arte_set(arteId, ARTE_MOVE_SPEED, 30);
arte_set(arteId, ARTE_POST_WAIT, 3*3);

arteId = arte_new(Alister,"Cross Gun",BulletSprite,GFX_CAST, 
    0.1,0.0,  3,30, 1,
    "Fill foes with lead from both sides.",
    ARTE_EFFECT_BACK, TYPE_SHOT, 3*7);
arte_set(arteId, ARTE_MOVE_SPEED, 30);
arte_set(arteId, ARTE_POST_WAIT, 3*3);


//======================Raka======================
arteId = arte_new(Raka,"Rushing Leaves",ShortWindSprite,GFX_CAST,
    0.5,1.5,  9,100, 1,
    "Blow away your foes with the wind from your leaf fan.",
    ARTE_EFFECT_LIFT, TYPE_SHOT, 3*7); 
arte_set(arteId, ARTE_MOVE_SPEED, 7);
arte_set(arteId, ARTE_POST_WAIT, 3*9);
    
arteId = arte_new(Raka,"Falling Tree",spr_thrust,GFX_ATTACK_DOWN,        
    1.0,3.0,  9,200, 1,
    "Land a powerful strike on your foe from the sky.",
    ARTE_EFFECT_BACK, TYPE_PHYSICAL, 3*5);
arte_set(arteId, ARTE_POST_WAIT, 3*7);
    
arteId = arte_new(Raka,"Friendly Fowl",EagleSprite,GFX_CAST,
    0.7,2.0,  9,100, 2,
    "Land a powerful strike on your foe in the sky.",
    ARTE_EFFECT_OUT, TYPE_AIR_SHOT, 3*7);
arte_set(arteId, ARTE_MOVE_SPEED, 15);
arte_set(arteId, ARTE_POST_WAIT, 3*9);

//======================Chloe======================
arteId = arte_new(Chloe,"Bullet Spray",BulletSprite,GFX_CAST,           
    0.2,0.0,  12,30, 1,
    "Fill your foes with lead.",
    ARTE_EFFECT_BACK, TYPE_SHOT, 3*5); 
arte_set(arteId, ARTE_MOVE_SPEED, 30);
arte_set(arteId, ARTE_POST_WAIT, 3*4);

arteId = arte_new(Chloe,"Pistol Cross",BulletSprite,GFX_CAST,
    0.2,0.1,  9,30, 1,
    "Fill foes with lead from both sides.",
    ARTE_EFFECT_BACK, TYPE_SHOT, 3*5);
arte_set(arteId, ARTE_MOVE_SPEED, 30);
arte_set(arteId, ARTE_POST_WAIT, 3*4);

//======================Monsters======================
arteId = arte_new(MAX_PLAYERS,"Strike",spr_thrust,GFX_ATTACK,
    1.0,1.0,   6,100,  1,
    "",
    ARTE_EFFECT_NONE, TYPE_PHYSICAL, 3*2);

#define init_game_controls

//ctrl_new(num,"type". up,right,down,left, att,guard,arte1,arte2, target,action, menu);
ctrl_new(0, BTN_TYPE_KEYBOARD, vk_up,vk_right,vk_down,vk_left, 
    ord('Z'),ord('X'),ord('A'),ord('S'), 
    ord('W'),ord('Q'), ord('C'));
ctrl_new(1,BTN_TYPE_NONE, ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'), ord('9'));
ctrl_new(2,BTN_TYPE_NONE, ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'), ord('9'));
ctrl_new(3,BTN_TYPE_NONE, ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'),ord('9'),ord('0'), 
    ord('9'),ord('0'), ord('9'));


#define init_party_and_players
/// init_party_and_players() 
/// Initializes all party and player data in the system.

//player_new(playerId,   name,hp,sp,att,aatt, pow, def,adef,spd);
player_new(Sean,  "Naes",     11,12,  10,10,  15,  14,  14,    9);
player_new(AD,    "Enneirda",  6,10,   5,15,   5,   5,  15,    6);
player_new(Dan,   "Shashu",    7,15,   7, 7,   5,  10,  13,    7);
player_new(John,  "Nooj",     12,15,  13,13,   5,  12,  13,   12);
player_new(Serena,"Saruhime", 12,15,  13,13,   5,  15,  12,   12);
player_new(James, "Nizzerus", 14,15,  12,12,  15,  12,   5,    7);
player_new(Taliko,"Taliko",    6,10,   5,15,   5,   5,  15,    6);
player_new(Noel,  "Noel",     15, 5,  15, 5,  15,  10,   8,    6);
player_new(Alister,"Alister", 15, 5,  15, 5,  15,  10,   8,    6);
player_new(Raka,  "Raka",     11,11,  11,11,  11,  11,  11,    9);
player_new(Chloe, "Chloe",    12,15,  13, 5,   5,  12,  12,   12);

party_set_all(Sean,   getLevel1HpStat(Sean),   "Wave","","","", "Smash","","","");
party_set_all(AD,     getLevel1HpStat(AD),     "Medic","","","", "Holy Beam","","","");
party_set_all(Dan,    getLevel1HpStat(Dan),    "Aimed Arrow","","","", "Combat Knife","","","");
party_set_all(John,   getLevel1HpStat(John),   "Incapacitate","","", "", "Jolt", "", "", "");
party_set_all(Serena, getLevel1HpStat(Serena), "Ocean's Whirlpool", "", "", "", "Wind's Pierce", "", "", "");
party_set_all(James,  getLevel1HpStat(James),  "Petal Storm", "", "", "", "Petal Beam", "", "", "");
party_set_all(Taliko, getLevel1HpStat(Taliko), "Chill Wounds", "", "", "", "Frosted Defense", "", "", "");
party_set_all(Noel,   getLevel1HpStat(Noel),   "Shove", "", "", "", "Tension", "", "", "");
party_set_all(Alister,getLevel1HpStat(Alister),"Bullet Blaze", "", "", "", "Cross Gun", "", "", "");
party_set_all(Raka,   getLevel1HpStat(Raka),   "Rushing Leaves", "", "", "", "Falling Tree", "", "", "");
party_set_all(Chloe,  getLevel1HpStat(Chloe),  "Bullet Spray", "", "", "", "Pistol Cross", "", "", "");

for(var i = 0; i < MAX_PLAYERS; i++) {
    global.combatParty[CMBT_RESERVE, i] = -1;
    if(i < PTY_AMNT) {
        global.combatParty[CMBT_RESERVE, i] = -1;
        global.combatParty[CMBT_PARTY1, i] = -1;
    }
}

global.combatParty[CMBT_PARTY1, 0] = Noel;

#define init_game_misc

//other stuff
global.touchList = ds_list_create();
draw_set_color(c_white);
draw_set_font(font_courier);
draw_set_halign(fa_left);
global.menu = false;
global.areaPlayerX = 320;
global.areaPlayerY = 240;
global.currentMap = RuinedHomeRoom;
global.marker = -1;
global.monsterLevel = 1;
global.menu_combatId = -1;
global.monFight[0] = MAX_MONSTERS;
global.monFight[1] = MAX_MONSTERS;
global.monFight[2] = MAX_MONSTERS;
global.monFight[3] = MAX_MONSTERS;
global.subimg = 0;
cursor_sprite = IwikSprite;
global.width_view = 640;
global.height_view = 480;
global.horizontal_border = 320;
global.vertical_border = 240;
global.audioLevel = 1;
global.playerLevel = 1;
global.maxPlayerLevel = 1;
global.experience = 0;
global.cutscene = -1;
global.preempt = false;
if(os_browser == browser_not_a_browser) {
    TouchControlsOff();
}
else {
    global.width_view = browser_width * 1.4;
    global.height_view = browser_height * 1.4;
    global.horizontal_border = global.width_view / 2;
    global.vertical_border = global.height_view / 2;
    TouchControlsOn();
}

#define init_game_monsters
set_simple_monster_gfx(Arach, spr_arach_run, spr_arach_att);
set_monster_stats(Arach, "Arach", 10,10, 10,10, 10, 10,10, 9);
set_monster_attacks(Arach, "Strike", "Descending Waterfall", "Ocean's Whirlpool");

set_simple_monster_gfx(Zombie, spr_zombie_run, spr_zombie_att);
set_monster_stats(Zombie, "Zombie", 15,5, 10,5, 5, 15,5, 6);
set_monster_attacks(Zombie, "Strike", "Tension");

set_simple_monster_gfx(Harpy, HarpyFlySprite, HarpyAttackSprite);
set_monster_stats(Harpy, "Harpy", 12,12, 11,7, 5, 8,12, 12);
set_monster_attacks(Harpy, "Rushing Reap", "Incapacitate", "Wind's Pierce", 
    "Raging Hurricane", "Storm", "Rushing Leaves", "Falling Tree",
    "Petal Beam", "Petal Storm");

set_simple_monster_gfx(Dragon, DragonFlySprite, DragonAttackSprite);
set_monster_gfx(Dragon, GFX_ATTACK_UP, DragonAttackUpSprite);
set_monster_gfx(Dragon, GFX_ATTACK_SIDE, DragonAttackSideSprite);
set_monster_stats(Dragon, "Dragon", 15,15, 15,15, 15, 15,15, 12);
set_monster_attacks(Dragon, "Incapacitate", "Divide", "Retreating Flame", 
    "Falling Tree");

set_simple_monster_gfx(Knight, KnightRunSprite, KnightAttackSprite);
set_monster_gfx(Knight, GFX_ATTACK_UP, KnightAttackUpSprite);
set_monster_gfx(Knight, GFX_ATTACK_SIDE, KnightAttackSideSprite);
set_monster_stats(Knight, "Knight", 11,8, 10,7, 12, 12,7, 12);
set_monster_attacks(Knight, "Strike", "Smash", "Divide", "Uprise", 
    "Incapacitate", "Tension");

set_simple_monster_gfx(Slime, SlimeWalkSprite, SlimeAttackSprite);
set_monster_stats(Slime, "Slime", 5,5, 5,5, 5, 15,5, 6);
set_monster_attacks(Slime, "Strike", "Shove", "Tension");

set_simple_monster_gfx(Pyre, PyreFlyingSprite, PyreFlyingSprite);
set_monster_stats(Pyre, "Pyre", 5,15, 5,5, 5, 5,5, 15);
set_monster_attacks(Pyre, "Pyre", "Fire Arrow", "Tension", "Retreating Flame");
#define init_game_items
///init_game_items


item_init(ITEM_HALITE, ARTE_EFFECT_HEAL, 10, "Halite", 
    "One tasty solid rock and not very nutrious by itself.");
item_init(ITEM_ROOT, ARTE_EFFECT_HEAL, 30, "Tree Root", 
    "Tasteless and tough but a great source of fiber!");
item_init(ITEM_LEGUME, ARTE_EFFECT_HEAL, 90, "Legume", 
    "A rough nut great for any diet.");
item_init(ITEM_CHARD, ARTE_EFFECT_HEAL, 180, "Chard", 
    "Full of nutrients but could use dressing.");
item_init(ITEM_COCOA, ARTE_EFFECT_HEAL, 400, "Cocoa", 
    "The ultimate snack good for any occasion.");
    
item_init(ITEM_GEL, ARTE_EFFECT_DEF_BUFF, 3, "Gooey Gel", 
    "Gooey texture that grants discomfort to the touch.");
item_init(ITEM_WOOD, ARTE_EFFECT_DEF_BUFF, 6, "Wood Board", 
    "Not the most durable board, but better than nothing.");
item_init(ITEM_RUBBER, ARTE_EFFECT_DEF_BUFF, 12, "Rubber Chunk", 
    "Heavily absorbant of blows and sound.");
item_init(ITEM_STEEL, ARTE_EFFECT_DEF_BUFF, 20, "Steel Guard", 
    "A heavy but reliable piece of armor.");
item_init(ITEM_TITANIUM, ARTE_EFFECT_DEF_BUFF, 40, "Titanium Plate", 
    "The best and lightest defense available.");
    
item_init(ITEM_WING, ARTE_EFFECT_SPD_BUFF, 3, "Broken Wing", 
    "An aero-dynamic beast wing meant for swift flight.");
item_init(ITEM_FAN, ARTE_EFFECT_SPD_BUFF, 6, "Wind Fan", 
    "A fan meant to create wind-based speed.");
item_init(ITEM_FIN, ARTE_EFFECT_SPD_BUFF, 12, "Swift Fin", 
    "Glide through and cut the air like butter.");
item_init(ITEM_CLEAT, ARTE_EFFECT_SPD_BUFF, 20, "Natural Cleats", 
    "Rough sole bottom traction straight from nature.");
item_init(ITEM_FEATHER, ARTE_EFFECT_SPD_BUFF, 40, "Aerodynamic Feather", 
    "The most efficient method of transportation.");
    
item_init(ITEM_NAIL, ARTE_EFFECT_ATT_BUFF, 3, "Dull Nail", 
    "An offensive piece of a beast that's sharp enough.");
item_init(ITEM_FANG, ARTE_EFFECT_ATT_BUFF, 6, "Beast Fang", 
    "A tooth meant to assist consuming meat.");
item_init(ITEM_CLAW, ARTE_EFFECT_ATT_BUFF, 12, "Strong Claw", 
    "Three powerful claws meant to draw blood.");
item_init(ITEM_TALON, ARTE_EFFECT_ATT_BUFF, 20, "Aviation Talon", 
    "Powerful enough to lift a bison into the air.");
item_init(ITEM_SPIKE, ARTE_EFFECT_ATT_BUFF, 40, "Sharp Spike", 
    "A single graze from this would tear through the roughest hide.");