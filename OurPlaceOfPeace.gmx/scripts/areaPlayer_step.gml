depth = -y;
press_maintain();//maintain all controls

if(global.menu && combatId == 0) {
    depth = -10001;
    if(!global.isCutsceneRunning) {
        menu_maintain();
    }
    exit;
}

playerId = combat_get(CMBT_PARTY1, combatId);
if(playerId < 0) {
    visible = false;
    with(PlayerObject) {
        if(combatId == 0) {
            other.x = x;
            other.y = y;
        }
    }
    exit;
}
else {
    visible = true;
}

// idle
v_gfx = global.gfx[playerId, GFX_IDLE];
v_img += 1/3;

// if AI, follow player one.
if(ctrl_get(combatId, BTN_TYPE) == BTN_TYPE_NONE) {
    targetX = x;
    targetY = y;
    with(obj_areaPlayer) {
        if(combatId == 0) {
            other.targetX = x;
            other.targetY = y;
        }
    }

    var range = 16;
    if(distance_to_point(targetX,targetY) > range * 1.5 + combatId * 24) {
        move_towards_point(targetX - range + random(range*2), 
            targetY - range + random(range*2), v_speed);
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
    }
    else { 
        speed = 0;
    }
    if(targetX < x) {
        v_dir = DIR_LEFT;
    }
    else {
        v_dir = DIR_RIGHT;
    }
    exit;
}

var currentSpeed = v_speed;

// Interruptable Attack
if(ctrl_btn() == BTN_ATTACK && alarm[1] <= 3) {
    alarm[1] = 5*3; // frameCount * (1/frameSpeed)
    v_img = 0; // Reset animation
}

// Maintain lower speed
if(alarm[1] > 0) {
    currentSpeed = v_speed / 2;
    if(alarm[1] == 2*3) {
        // generate attack to walls and hazards
        attackId = instance_create(x,y, AreaAttack);
        (attackId).ownerId = id;
        (attackId).alarm[0] = 6;
        (attackId).image_yscale = 0.2;
        (attackId).image_xscale = v_dir;
    }
}

switch(ctrl_dir_h()) {
    case BTN_RIGHT: 
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x + currentSpeed, y)) {
            x += currentSpeed;
            v_dir = 1;
        }
    break;
    case BTN_LEFT:
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x - currentSpeed,y)) {
            x -= currentSpeed;
            v_dir = -1;
        }
    break;
}
switch(ctrl_dir_v())
{
    case BTN_DOWN: 
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x,y + currentSpeed)) {
            y += currentSpeed;
        }
    break;
    case BTN_UP:
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x,y - currentSpeed)) {
            y -= currentSpeed;
        }
    break;
}

if(alarm[1] > 0) {
    v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_ATTACK];
}

init_menu();

