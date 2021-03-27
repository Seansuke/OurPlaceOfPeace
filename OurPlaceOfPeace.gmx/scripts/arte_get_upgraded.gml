/// arte_get_upgraded(arteId, ARTE_statType)
var arteId = argument0;
var ARTE_statType = argument1;
var arteBaseStat = arte_get(arteId, ARTE_statType);
if(is_string(arteBaseStat)) {
    return arteBaseStat;
}
if( ARTE_statType != ARTE_DMG
    && ARTE_statType != ARTE_POW
    && ARTE_statType != ARTE_WAIT
    && ARTE_statType != ARTE_COST
    && ARTE_statType != ARTE_DURATION
    && ARTE_statType != ARTE_POST_WAIT
) {
    return arteBaseStat;
}

var upgradeRank = upgrade_get(arteId, ARTE_statType);
var arteStat = arteBaseStat;

var arteStatMinMap;
arteStatMinMap[ARTE_DMG] = 0;
arteStatMinMap[ARTE_POW] = 1;
arteStatMinMap[ARTE_WAIT] = 1;
arteStatMinMap[ARTE_COST] = 25;
arteStatMinMap[ARTE_DURATION] = 1;
arteStatMinMap[ARTE_POST_WAIT] = 1;
var arteStatMin = arteStatMinMap[ARTE_statType];

var arteStatChangeMap;
arteStatChangeMap[ARTE_DMG] = +0.02;
arteStatChangeMap[ARTE_POW] = +0.02;
arteStatChangeMap[ARTE_WAIT] = -1;
arteStatChangeMap[ARTE_COST] = -10;
arteStatChangeMap[ARTE_DURATION] = +1;
arteStatChangeMap[ARTE_POST_WAIT] = -1;
var arteStatChange = arteStatChangeMap[ARTE_statType];

if(arteBaseStat + arteStatChange * 5 < arteStatMin) {
    // if the stat change would drop the stat below the minimum...
    // small changes instead.
    arteStat += upgradeRank * (arteStatMin - arteBaseStat) / 5;
}
// TODO - I think I can make this more dynamic~
else if(abs(arteStatChange * 5) < arteBaseStat * 0.5) {
    // if the stat changes are far too small...
    // make bigger changes
    arteStat += arteStatChange * upgradeRank * 2;
}
else {
    arteStat += arteStatChange * upgradeRank;
}

return arteStat;
