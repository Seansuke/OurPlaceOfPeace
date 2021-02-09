switch(skill[ARTE_NAME])
{
    case "Incapacitate":
        v_gfx2 = spr_john_att_down;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
        {
            scr_player_arte_create();
            if(place_clear(x + SPD * v_dir * 5,y) == true)
                {x += SPD * v_dir * 5}; //dash forward
            scr_player_arte_create();
        } //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Jolt":
        v_gfx2 = spr_john_cast;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
gfx[GFX_MAX] = v_gfx2;
