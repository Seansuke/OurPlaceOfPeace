switch(skill[ARTE_NAME])
{
    case "Ocean's Whirlpool":
        v_gfx2 = spr_serena_att_air;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y + SPD) == true){y += SPD};} //dash down

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Wind's Pierce":
        v_gfx2 = spr_serena_att_air;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x + SPD * v_dir,y) == true){x += SPD * v_dir};} //dash forward

        if(v_timer > 3*4)
            {scr_player_arte_create();} //create attack
            
        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Raging Hurricane":
        v_gfx2 = spr_serena_att_air;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y - SPD) == true){y -= SPD};} //dash up

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Retreating Flame":
        v_gfx2 = spr_serena_att_up;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x - SPD * v_dir,y) == true){x -= SPD * v_dir};} //dash backwards


        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Descending Waterfall":
        if(floor(v_timer) < skill[ARTE_WAIT] + 1)
        {
            v_gfx2 = spr_serena_run;
            if(place_clear(x,y - SPD) == true){y -= SPD};
        } //dash up

        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
        {
            v_gfx2 = spr_serena_att_down;
            if(place_clear(x,y + SPD) == true){y += SPD};
        } //dash down

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
gfx[GFX_MAX] = v_gfx2;





