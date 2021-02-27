///arte_upgrade_cost(arteId, ARTE_statPicked);
var temp_arteId = argument0;
var temp_up = argument1;

if(arte_get(temp_arteId, ARTE_POINTS) > 200) {
    return -1;
}

if(temp_up = ARTE_DMG  && arte_get(temp_arteId, ARTE_DMG) >= 1.5) {
    return -1;
}
if(temp_up = ARTE_POW  && arte_get(temp_arteId, ARTE_POW) >= 1.5) {
    return -1;
}
if(temp_up = ARTE_WAIT && arte_get(temp_arteId,ARTE_WAIT) <= 1)   {
    return -1;
}
if(temp_up = ARTE_COST && arte_get(temp_arteId,ARTE_COST) <= 25)  {
    return -1;
}

return floor(arte_get(temp_arteId, ARTE_POINTS));
