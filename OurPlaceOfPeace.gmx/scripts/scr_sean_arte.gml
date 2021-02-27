
switch(skill[ARTE_NAME])
{
    case "Wave":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
            // TODO - prewait duration postwait (postwait comes right afte rprewait)
    break;
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
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Uprise": 
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*6)
            {v_act = "idle";}
    break;
    case "Wall": 
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*7)
            {v_act = "idle";}
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
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Shove": 
        if(playerNum == Noel) {
            v_gfx2 = Noel;
        }
                
        if(floor(v_timer) == skill[ARTE_WAIT] + 1) {
            scr_player_arte_create();
        } //create attack

        if(v_timer > skill[ARTE_WAIT] + 3) {
            v_act = "idle";
        }
    break;
    case "Tension":

        if(floor(v_timer) == skill[ARTE_WAIT] + 1) {
            scr_player_arte_create();
        }

        if(v_timer > skill[ARTE_WAIT] + 3) {
            v_act = "idle";
        }
        
    break;
    case "Bullet Blaze":

        if(floor(v_timer) == skill[ARTE_WAIT] + 1) {
            scr_player_arte_create();
        }

        if(floor(v_timer) == skill[ARTE_WAIT] + 2) {
            scr_player_arte_create();
        }

        if(floor(v_timer) > skill[ARTE_WAIT] + 2) {
            v_act = "idle";
        }

    break;
    case "Cross Gun":
        if(playerNum == Alister) {
            v_gfx2 = AlisterSideGunsSprite;
        }
        else if(playerNum == Chloe) {
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

        if(floor(v_timer) > skill[ARTE_WAIT] + 1) {
            v_act = "idle";
        }

    break;
}
