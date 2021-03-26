
if(skill[ARTE_NAME] == "Holy Beam") {
    v_color = c_white;
    v_chargeMax = skill[ARTE_WAIT];
    
    // charging the cast
    if(v_timer <= skill[ARTE_WAIT]) {
        if(v_charge < v_chargeMax) {
            v_charge += 1;
        }
        
         //if guard, leave
        if(ctrl_press(BTN_GUARD)) {
            SP += skill[ARTE_COST] / 2;
            v_act = "idle";
            exit;
        }
    }

    if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2) {
        if(v_timer > skill[ARTE_WAIT] && v_charge == v_chargeMax) {
            scr_player_arte_create();
            v_timer = skill[ARTE_WAIT] + 1;
            v_charge++;
        }

        if(floor(v_timer) > skill[ARTE_WAIT] + skill[ARTE_POST_WAIT] + 1) {
            v_act = "idle";
            exit;
        }
    }
}
else if(skill[ARTE_TYPE] == TYPE_ALLY_TARGET) {
    if(ctrl_press(BTN_LEFT)) {
        v_ally_target -= 1;
    }
    else if(ctrl_press(BTN_RIGHT)) {
        v_ally_target += 1;
    }
    
    v_ally_target = (v_ally_target + PTY_AMNT) mod PTY_AMNT;
    
    v_chargeMax = skill[ARTE_WAIT];
    
    // charging the cast
    if(v_timer <= skill[ARTE_WAIT]) {
        if(v_charge < v_chargeMax) {
            v_charge += 1;
        }
        
         //if guard, leave
        if(ctrl_press(BTN_GUARD)) {
            SP += skill[ARTE_COST] / 2;
            v_act = "idle";
            exit;
        }
    }
    
    if((v_btn == BTN_ARTES1 || v_btn == BTN_ARTES2) 
        && v_timer > skill[ARTE_WAIT]
        && v_charge >= v_chargeMax
        && v_uber < v_uberMax) {
        v_uber += 1;
    }
            
    if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
        scr_player_arte_create();
        v_act = "idle";
        exit;
    }
}

