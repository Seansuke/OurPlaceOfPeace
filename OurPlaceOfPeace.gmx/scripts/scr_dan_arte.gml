
switch(skill[ARTE_NAME])
{
    case "Combat Knife":
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
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();}
        if(v_timer > 3*5)
            {v_act = "idle";}
}

