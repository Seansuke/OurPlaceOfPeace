switch(skill[ARTE_NAME])
{
    case "Wave":
        v_gfx2 = spr_sean_att_up;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Smash":
        v_gfx2 = spr_sean_att;
        v_color = c_white;
        v_chargeMax = 30;
        
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
        v_gfx2 = spr_sean_att_up;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*6)
            {v_act = "idle";}
    break;
    case "Wall":
        v_gfx2 = spr_sean_def;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*7)
            {v_act = "idle";}
    break;
    case "Divide":
        v_gfx2 = spr_sean_att_air;
        v_color = c_white;
        v_chargeMax = 30;
        
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
}
gfx[GFX_MAX] = v_gfx2;
