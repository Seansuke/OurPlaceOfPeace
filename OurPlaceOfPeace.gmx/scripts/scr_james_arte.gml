
switch(skill[ARTE_NAME])
{
    case "Petal Storm":
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Petal Beam":
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Rushing Reap":
        
        //create attack
        if(floor(v_timer) == skill[ARTE_WAIT] + 1) {
            scr_player_arte_create();
        } 

        //dash forward
        if(floor(v_timer) > skill[ARTE_WAIT] + 1) {
            if(place_clear(x + getMoveSpeed() * v_dir * 2,y) == true) {
                x += getMoveSpeed() * v_dir
            }
        }

        //create attack
        if(v_timer > 3*4) {
            scr_player_arte_create();
        }
            
        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
