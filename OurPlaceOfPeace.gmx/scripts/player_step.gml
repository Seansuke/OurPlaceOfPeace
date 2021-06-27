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

// For a trailing display.
previousGfx = gfx[v_gfx];
previousX = x;
previousY = y;

rollHP_maintain();
dmg_maintain();
guard_maintain();

// The player has been thrown off-screen.  Re-align everyone to the center of the map as if it were cycling.
if(x > room_width - 32) {
    with(obj_camera) {
        x = max(32, x - room_width / 2);
    }
    with(obj_player) {
        x = max(32, x - room_width / 2);
    }
    with(obj_mon) {
        x = max(32, x - room_width / 2);
    }
    with(obj_attack) {
        x = max(32, x - room_width / 2);
    }
}
else if(x < 32) {
    with(obj_camera) {
        x = min(room_width - 32, x + room_width / 2);
    }
    with(obj_player) {
        x = min(room_width - 32, x + room_width / 2);
    }
    with(obj_mon) {
        x = min(room_width - 32, x + room_width / 2);
    }
    with(obj_attack) {
        x = min(room_width - 32, x + room_width / 2);
    }
}

// AI pushes their own buttons.
if(ctrl_get(combatId,BTN_TYPE) == BTN_TYPE_NONE) {
    ai_maintain();
}

// Only gain SP during certain actions.
if(v_act == "idle" || v_act == "run" || v_act == "fall" || v_act == "jump") {
    SP = min(SP + SP_GAINED_PER_FRAME, stat[PLY_SP]);
}

// Reset the ally target.
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
