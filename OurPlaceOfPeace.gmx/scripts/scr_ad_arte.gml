
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
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    }
}
else if(skill[ARTE_NAME] == "Light Arrow") {
    v_color = c_white;
    v_gfx2 = AdBowSprite;
    
    //charge
    if(v_timer <= skill[ARTE_WAIT])
    {
        if(v_btn == BTN_ARTES1 || v_btn == BTN_ARTES2)
        {
            v_color = c_yellow;
            v_img = 0;
            v_timer = -1;  //continue allowing a charge
            if(v_charge < v_chargeMax)
                {v_charge += 1;} //add charge
            else
                {v_color = c_orange;}
        }
    }
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
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
else if(skill[ARTE_NAME] == "Mild Recovery"
   || skill[ARTE_NAME] == "Ice Wall"
   || skill[ARTE_NAME] == "Cool Injury")
{
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}

