if(party_get(playerId, v_attType) == ""){return false;}

// Search for a specific player's arte first.
v_arteNum = arte_find_by_player(party_get(playerId, v_attType), playerId);
if(array_length_1d(skill) >= v_arteNum) {
    v_arteNum = arte_find(party_get(playerId, v_attType));
}

for(i=0;i<ARTE_MAX;i+=1) {
    skill[i] = arte_get(v_arteNum,i);
}

if(SP < skill[ARTE_COST]) {
    animate_text("SP TOO LOW", x, y + 50);
    return false;
}

SP -= skill[ARTE_COST];
v_img = 0;
v_timer = 0;
v_act = "arte";
v_ally_target = 0;
global.arte[v_arteNum, ARTE_USES] += 1;
return true;
