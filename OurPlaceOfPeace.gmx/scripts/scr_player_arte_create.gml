///scr_player_arte_create( );

animate_text(skill[ARTE_NAME], x,y+60);

//create
tmp_id = instance_create(x,y,obj_attack);
(tmp_id).sprite_index = skill[ARTE_GFX];//graphic
(tmp_id).v_dir = v_dir;//direction
(tmp_id).v_type = skill[ARTE_TYPE];
(tmp_id).visible = true;//visible
(tmp_id).amove = -1;
(tmp_id).isArte = true;
(tmp_id).effect = ARTE_EFFECT_OUT;
(tmp_id).v_timer[0] = skill[ARTE_DURATION];//max time until departure
(tmp_id).attack = stat[PLY_AATT] + bonusATT;
(tmp_id).attackMultiplier = skill[ARTE_DMG];
(tmp_id).pushPower = stat[PLY_POW] * skill[ARTE_POW];
(tmp_id).ids = id;
(tmp_id).playerId = playerId;
(tmp_id).v_team = "Players";
(tmp_id).amove = skill[ARTE_MOVE_SPEED];
(tmp_id).visible = skill[ARTE_VISIBLE];
(tmp_id).effect = skill[ARTE_EFFECT];

for(var arteI = 0; arteI < ARTE_MAX; arteI++) {
    (tmp_id).arte[arteI] = skill[arteI];
}


switch(skill[ARTE_NAME]) {
    case "Smash":
        (tmp_id).stat[PLY_POW] += 0.5 * stat[PLY_POW] * v_charge / v_chargeMax;
    break;
    case "Divide":
        (tmp_id).stat[PLY_POW] += 0.5 * stat[PLY_POW] * v_charge / v_chargeMax;
    break;
}

if(skill[ARTE_TYPE] == ARTE_EFFECT_HEAL
    || skill[ARTE_TYPE] == ARTE_EFFECT_ATT_BUFF
    || skill[ARTE_TYPE] == ARTE_EFFECT_DEF_BUFF
    || skill[ARTE_TYPE] == ARTE_EFFECT_SPD_BUFF
) {
    var allyTargetInstanceId = obj_camera.ids[v_ally_target];
    if(instance_exists(allyTargetInstanceId)) {   
        (tmp_id).x = (allyTargetInstanceId).x;  
        (tmp_id).y = (allyTargetInstanceId).y;
    }
}
    
v_charge = 0;
v_uber = 0;

return tmp_id;
