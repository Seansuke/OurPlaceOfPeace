switch(skill[ARTE_NAME])
{
    case "Petal Storm":
        v_gfx2 = spr_james_cast;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Petal Beam":
        v_gfx2 = spr_james_cast;
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
gfx[GFX_MAX] = v_gfx2;
