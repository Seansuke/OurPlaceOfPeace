
switch(skill[ARTE_NAME]) {
    case "Smash": 
        v_color = c_white;
        
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
    break;
    case "Uprise": 
        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Wall": 
        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Divide": 
        v_color = c_white;
        
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
    break;
    case "Shove": 
        if(playerId == Noel) {
            v_gfx2 = NoelShoveSprite;
        }
        
        //step forward
        if(floor(v_timer) <= ceil(skill[ARTE_WAIT])) {
            if(place_clear(x + getMoveSpeed() * 2, y) == true) {
                x += getMoveSpeed();
            }
        } 

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Tension":
        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
}

if(skill[ARTE_NAME] == "Strike" || skill[ARTE_NAME] == "Wave") {
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}
else if(skill[ARTE_NAME] == "Bullet Blaze" || skill[ARTE_NAME] == "Bullet Spray") {
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 2)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}
else if(skill[ARTE_NAME] == "Cross Gun" || skill[ARTE_NAME] == "Pistol Cross") {
    if(playerId == Alister) {
        v_gfx2 = AlisterSideGunsSprite;
    }
    else if(playerId == Chloe) {
        v_gfx2 = ChloeSideGunsSprite;
    }
    
    if(floor(v_timer) == skill[ARTE_WAIT] + 1) {
        // Turn Around
        v_dir *= -1;
        scr_player_arte_create();

        // Turn Around... myyyyy loooove
        v_dir *= -1;
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}
