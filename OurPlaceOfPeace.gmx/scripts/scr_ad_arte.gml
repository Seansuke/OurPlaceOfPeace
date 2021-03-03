
switch(skill[ARTE_NAME]) {
    case "Medic":
        v_chargeMax = skill[ARTE_WAIT];
        
        // charging the cast
        if(v_timer <= skill[ARTE_WAIT]) {
            if(v_charge < v_chargeMax) {
                v_charge++;
            }
            
            //if guard, leave, but keep the casting.
            if(ctrl_press(BTN_GUARD)) {
                SP += skill[ARTE_COST];
                v_act = "idle";
                exit;
            }
        }

        if(floor(v_timer) > skill[ARTE_WAIT]) {
            if(SP > 5) {
                // create healing at regular intervals
                if(floor(v_timer) mod skill[ARTE_WAIT] == 0) {
                    SP -= 5;
                    var storedAllyTarget = v_ally_target;
                    scr_player_arte_create();
                    v_ally_target = storedAllyTarget;
                }
            }
            if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2) {
                v_ally_target = -1;
                v_act = "idle";
            }
        }

    break;
    case "Chill Wounds":
        v_chargeMax = skill[ARTE_WAIT];
        
        // charging the cast
        if(v_timer <= skill[ARTE_WAIT]) {
            if(v_charge < v_chargeMax) {
                v_charge += 1;
            }
            
             //if guard, leave
            if(ctrl_press(BTN_GUARD)) {
                SP += skill[ARTE_COST];
                v_act = "idle";
                exit;
            }
        }
        
        if(v_btn == BTN_ARTES1 || v_btn == BTN_ARTES2 && v_timer > skill[ARTE_WAIT])
        {
            if(v_uber < v_uberMax)
                {v_uber += 1;}
        }
        
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
    case "Restore":
        v_chargeMax = skill[ARTE_WAIT];
        
        if(v_timer <= skill[ARTE_WAIT]) //charging the cast
        {
            if(v_charge < v_chargeMax)
                {v_charge += 1;}
            if(ctrl_press(BTN_GUARD))
                {SP += skill[ARTE_COST];v_act = "idle";exit;} //if guard, leave
        }
        
        if(v_btn == BTN_ARTES1 || v_btn == BTN_ARTES2 && v_timer > skill[ARTE_WAIT])
        {
            if(v_uber < v_uberMax)
                {v_uber += 1;}
        }
        
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
    case "Might":
        v_chargeMax = skill[ARTE_WAIT];
        
        if(v_timer <= skill[ARTE_WAIT]) //charging the cast
        {
            if(v_charge < v_chargeMax)
                {v_charge += 1;}
            if(ctrl_press(BTN_GUARD))
                {SP += skill[ARTE_COST];v_act = "idle";exit;} //if guard, leave
        }
        
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
    case "Frosted Defense":
        v_chargeMax = skill[ARTE_WAIT];
        
        if(v_timer <= skill[ARTE_WAIT]) //charging the cast
        {
            if(v_charge < v_chargeMax)
                {v_charge += 1;}
            if(ctrl_press(BTN_GUARD))
                {SP += skill[ARTE_COST];v_act = "idle";exit;} //if guard, leave
        }
                            
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
    case "Endure":
        v_chargeMax = skill[ARTE_WAIT];
        
        if(v_timer <= skill[ARTE_WAIT]) //charging the cast
        {
            if(v_charge < v_chargeMax) {
                v_charge += 1;
            }
            if(ctrl_press(BTN_GUARD)) {
                SP += skill[ARTE_COST];
                v_act = "idle";
                exit;
            } //if guard, leave
        }
        
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
    case "Holy Beam":
        v_color = c_white;
        v_chargeMax = skill[ARTE_WAIT];
        
        if(v_timer <= skill[ARTE_WAIT]) //charging the cast
        {
            if(v_charge < v_chargeMax)
                {v_charge += 1;}
            if(ctrl_press(BTN_GUARD))
                {SP += skill[ARTE_COST];v_act = "idle";exit;} //if guard, leave
        }
                            
        if(v_btn != BTN_ARTES1 && v_btn != BTN_ARTES2 && v_timer > skill[ARTE_WAIT]) {
            scr_player_arte_create();
            v_act = "idle";
        }
    break;
}

if(skill[ARTE_TYPE] == TYPE_ALLY_TARGET) {
    if(ctrl_press(BTN_LEFT)) {
        v_ally_target -= 1;
    }
    else if(ctrl_press(BTN_RIGHT)) {
        v_ally_target += 1;
    }
    
    v_ally_target = (v_ally_target + PTY_AMNT) mod PTY_AMNT;
}

