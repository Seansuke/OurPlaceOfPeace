
switch(skill[ARTE_NAME])
{
    case "Petal Storm":
        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }

        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Petal Beam":
        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }

        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Rushing Reap":
        //dash forward
        if(floor(v_timer) > skill[ARTE_WAIT] + 1) {
            if(place_clear(x + getMoveSpeed() * v_dir * 2,y) == true) {
                x += getMoveSpeed() * v_dir
            }
        }

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }

        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
}
