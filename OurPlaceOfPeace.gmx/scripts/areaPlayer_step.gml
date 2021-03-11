depth = -y;
press_maintain();//maintain all controls

if(global.menu && combatId == 0) {
    depth = -10001;
    menu_maintain();
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

switch(ctrl_dir_h())
{
    case BTN_RIGHT: 
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x + v_speed, y))
        {
            x += v_speed;
            v_dir = 1;
        }
    break;
    case BTN_LEFT:
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x - v_speed,y))
        {
            x -= v_speed;
            v_dir = -1;
        }
    break;
}
switch(ctrl_dir_v())
{
    case BTN_DOWN: 
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x,y + v_speed))
        {
            y += v_speed;
        }
    break;
    case BTN_UP:
        v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
        if(areaPlaceClear(x,y - v_speed))
        {
            y -= v_speed;
        }
    break;
}
init_menu();

