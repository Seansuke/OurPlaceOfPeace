
switch(skill[ARTE_NAME])
{
    case "Combat Knife":
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();}
            
        if(floor(v_timer) > skill[ARTE_WAIT] + skill[ARTE_POST_WAIT] + 1) {
            v_act = "idle";
        }
    break;
}
if(skill[ARTE_NAME] == "Aimed Arrow"
   || skill[ARTE_NAME] == "Ice Arrow"
   || skill[ARTE_NAME] == "Fire Arrow")
{
    if(floor(v_timer) == skill[ARTE_WAIT] + 1)
        {scr_player_arte_create();}
        
    if(floor(v_timer) > skill[ARTE_WAIT] + skill[ARTE_POST_WAIT] + 1) {
        v_act = "idle";
    }
}

