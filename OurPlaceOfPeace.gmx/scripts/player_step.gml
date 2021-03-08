scr_level_check();

if(global.menu == true) {    
    if(global.menu_combatId != combatId)
        {exit;}
    depth = -10001;
    press_maintain();
    menu_maintain();
    exit;
}
else {
    with(obj_camera) {
        other.depth = - y;
    }
    if(init_menu() == true) {
        global.menu_combatId = combatId;
        exit;
    }
}
press_maintain();
previousGfx = gfx[v_gfx];
previousX = x;
previousY = y;
rollHP_maintain();
dmg_maintain();
guard_maintain();
if(ctrl_get(combatId,BTN_TYPE) == BTN_TYPE_NONE) {
    ai_maintain();
}

// Only gain SP during certain actions.
if(v_act == "idle" || v_act == "run" || v_act == "fall" || v_act == "jump" || v_act == "guard" || v_act == "guardian") {
    SP = min(SP + SP_GAINED_PER_FRAME, stat[PLY_SP]);
}

if(v_act != "arte") {
    v_ally_target = -1;
}

//determine action
switch(v_act) {
    //navigate
    case "idle":
         scr_play_idle();
    break;
    case "run":
         scr_play_run();
    break;
    case "fall":
         scr_play_fall();
    break;
    case "jump":
         scr_play_jump();
    break;
    //defensive
    case "guard":
         scr_play_guard();
    break;
    case "guardian":
         scr_play_guardian();
    break;
    case "evade":
         scr_play_evade();
    break;
    case "counter":
        scr_play_counter();
    break;

    //damage
    case "dead":
        scr_play_dead();
    break;

    case "damage":
         scr_play_damage();
    break;
    
    //misc
    case "attack":
         scr_play_attack();
    break;
    case "arte":
         scr_play_arte();
    break;
    default:
        v_act = "idle";
    break;
}
