v_attType = get_monster_arte(monsterNum);
v_arteNum = arte_find(v_attType);

for(var i = 0; i < ARTE_MAX; i += 1) {
    skill[i] = arte_get(v_arteNum,i);
}

if(SP < skill[ARTE_COST]) {
    return false;
}

v_gfx = skill[ARTE_USER_GFX];
SP -= skill[ARTE_COST];
v_img = 0;
v_timer = 0;
v_act = "arte";
v_charge = 0;
v_chargeMax = 30;
v_uber = 0;
v_uberMax = 30;
v_ally_target = 4;
return true;
