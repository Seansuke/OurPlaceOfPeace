
switch(skill[ARTE_NAME])
{
    case "Incapacitate":
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
        {
            scr_player_arte_create();
            if(place_clear(x + getMoveSpeed() * v_dir * 5,y) == true)
                {x += getMoveSpeed() * v_dir * 5}; //dash forward
            scr_player_arte_create();
        } //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Jolt":
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
