if(party_get(playerId, v_attType) == ""){return false;}

// Search for a specific player's arte first.
v_arteNum = arte_find(party_get(playerId, v_attType));

for(i=0;i<ARTE_MAX;i+=1) {
    skill[i] = arte_get_upgraded(v_arteNum, i);
}

if(SP < skill[ARTE_COST]) {
    animate_text("SP TOO LOW", x, y + 50);
    return false;
}

SP -= skill[ARTE_COST];
v_img = 0;
v_timer = 0;
v_act = "arte";
if(skill[ARTE_TYPE] == TYPE_ALLY_TARGET) {
    v_ally_target = combatId;
}
upgrade_add_one(v_arteNum, ARTE_USES);
return true;
