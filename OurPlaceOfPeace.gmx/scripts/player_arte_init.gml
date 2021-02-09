if(party_get(plyr, v_attType) == ""){return false;}

v_arteNum = arte_find(party_get(plyr, v_attType));

for(i=0;i<ARTE_MAX;i+=1)
    {skill[i] = arte_get(v_arteNum,i);}

if(playerNum != skill[ARTE_PLAYER]){return false;}
if(SP < skill[ARTE_COST]){return false;}

SP -= skill[ARTE_COST];
v_img = 0;
v_timer = 0;
v_act = "arte";
v_charge = 0;
v_chargeMax = 0;
v_uber = 0;
v_uberMax = 0;
v_ally_target = 4;
global.arte[v_arteNum, ARTE_USES] += 1;
return true;
