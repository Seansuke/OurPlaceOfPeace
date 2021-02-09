for(i = 0;i <= GFX_MAX;i += 1) {gfx[GFX_FACE] = spr_icon;}//init all graphics
HP = 1;
rollHP = 1;
MHP = 1;
SP = 100 * + 20 * global.monsterLevel;
MSP = 100;
ATT = 1 * global.monsterLevel;
DEF = 1 * global.monsterLevel;
ADEF = 1 * global.monsterLevel;
SPD = 4 + 0.1 * global.monsterLevel;
//stats
bonusATT = 0;bonusDEF = 0;bonusADEF = 0;bonusSPD = 0;rollHPSpeed = 0.5;//side stats
monsterNum = Arach;
v_gfx = GFX_IDLE;v_gfx2 = spr_icon;v_img = 0;
v_act = "idle";
v_dir = DIR_LEFT;
v_timer = 0;v_guard = 0;
v_target = -1;v_ally_target = -1;v_att_id = -1;
v_enr = 0;//enertia
v_vel = 0;//velocity
v_arteNum = -1;
v_team = "Baddy";
v_charge = 0;v_chargeMax = 0;v_uber = 0;v_uberMax = 0;
for(tmp_i = 0;tmp_i < 20;tmp_i += 1){dmg[tmp_i,DMG_ID] = -1;dmg[tmp_i,DMG_TIMER] = -1;}//taken damage array
for(tmp_i = 0;tmp_i < ARTE_MAX;tmp_i += 1){skill[tmp_i] = 0;}//current arte
depth = -y;
previousX = x;
previousY = y;
v_attType = 0;
v_color = c_white;
