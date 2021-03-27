///arte_upgrade_cost(arteId, ARTE_statPicked);
var arteId = argument0;
var ARTE_statType = argument1;

if(upgrade_get(arteId, ARTE_statType) >= 5) {
    return -1;
}

var cost = power(2 * upgrade_get(arteId, ARTE_DMG), 2)
    + power(2 * upgrade_get(arteId, ARTE_POW), 2)
    + power(2 * upgrade_get(arteId,ARTE_WAIT), 2)
    + power(2 * upgrade_get(arteId,ARTE_COST), 2)
    + power(2 * upgrade_get(arteId,ARTE_DURATION), 2)
    + power(2 * upgrade_get(arteId,ARTE_POST_WAIT), 2);
    
cost += power(2 * upgrade_get(arteId, ARTE_statType) + 1, 2)
    - power(2 * upgrade_get(arteId, ARTE_statType), 2);

return cost;
