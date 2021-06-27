if(skill[ARTE_NAME] == "Combat Knife") {
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}
else if(skill[ARTE_NAME] == "Aimed Arrow"
   || skill[ARTE_NAME] == "Ice Arrow"
   || skill[ARTE_NAME] == "Fire Arrow")
{
    if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
        scr_player_arte_create();
    }

    if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
        v_act = "idle";
    }
}

