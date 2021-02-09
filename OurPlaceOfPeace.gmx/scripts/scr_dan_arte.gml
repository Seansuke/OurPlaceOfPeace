switch(skill[ARTE_NAME])
{
    case "Combat Knife":
        v_gfx2 = spr_knife;
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();}
        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
if(skill[ARTE_NAME] == "Aimed Arrow"
   || skill[ARTE_NAME] == "Ice Arrow"
   || skill[ARTE_NAME] == "Fire Arrow")
{
        v_gfx2 = spr_dan_att;
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();}
        if(v_timer > 3*5)
            {v_act = "idle";}
}

gfx[GFX_MAX] = v_gfx2;
