
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
        
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
}
if(skill[ARTE_NAME] == "Jolt"
    || skill[ARTE_NAME] == "Spark"
    || skill[ARTE_NAME] == "Storm"
) {
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}
