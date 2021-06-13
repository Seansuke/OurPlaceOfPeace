///combat_party_add(playerId) 
var playerId = argument0;
var playerAlreadyInParty = false;
var idealCombatPartyId = -1;
var idealCombatId = -1;
for(var combatPartyId = 0; combatPartyId <= array_height_2d(global.combatParty); combatPartyId++) {
    for(var combatId = 0; combatId < array_length_2d(global.combatParty, combatPartyId); combatId++) {
        var loopPayerId = combat_get(combatPartyId, combatId);
        if(loopPayerId == playerId) {
            playerAlreadyInParty = true;
        }
        else if(idealCombatPartyId == -1) {
            // This spot is empty, if we didn't pick a spot already, pick this one.
            idealCombatPartyId = combatPartyId;
            idealCombatId = combatId;
        }
    }
}
if(! playerAlreadyInParty) {
    combat_set(idealCombatPartyId, idealCombatId, playerId);
}
