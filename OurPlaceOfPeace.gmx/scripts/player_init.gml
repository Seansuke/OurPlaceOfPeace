for(i = 0;i <= GFX_MAX;i += 1) {gfx[GFX_FACE] = spr_icon;}//init all graphics
HP = 1;rollHP = 1;MHP = 1;SP = 100;MSP = 100;ATT = 1;DEF = 1;ADEF = 1;SPD = 1;//stats
bonusATT = 0;bonusDEF = 0;bonusADEF = 0;bonusSPD = 0;rollHPSpeed = 0.5;//side stats
plyr = 1;
playerNum = Sean;
v_gfx = GFX_IDLE;v_gfx2 = spr_icon;v_img = 0;
v_act = "idle";
v_dir = DIR_RIGHT;
v_timer = 0;v_guard = 0;
v_target = -1;v_ally_target = -1;v_att_id = -1;
v_enr = 0;//enertia
v_vel = 0;//velocity
v_team = "Players";
v_arteNum = -1;
v_flyer = false;
v_charge = 0;v_chargeMax = 0;v_uber = 0;v_uberMax = 0;
for(tmp_i = 0;tmp_i < 20;tmp_i += 1){dmg[tmp_i,DMG_ID] = -1;dmg[tmp_i,DMG_TIMER] = -1;}//taken damage array
for(tmp_i = 0;tmp_i < BTN_MAX;tmp_i += 1){press[tmp_i] = 0;}//button presses
for(tmp_i = 0;tmp_i < ARTE_MAX;tmp_i += 1){skill[tmp_i] = 0;}//current arte
v_v = -1;v_h = -1;v_btn = -1;v_trigger = -1;
depth = -y;
previousX = x;
previousY = y;
previousGfx = spr_icon;
v_attType = 0;
v_color = c_white;
