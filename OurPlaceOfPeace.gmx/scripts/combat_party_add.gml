///combat_party_add(playerId) 
var playerId = argument0;
var playerAlreadyInParty = false;
var idealCombatPartyId = -1;
var idealCombatId = -1;
var partyPriority;
partyPriority[0] = CMBT_PARTY1;
partyPriority[1] = CMBT_RESERVE;
for(var i = 0; i < array_height_2d(partyPriority); i++) {
    var combatPartyId = partyPriority[i];
    for(var combatId = 0; combatId < array_length_2d(global.combatParty, combatPartyId); combatId++) {
        var loopPayerId = combat_get(combatPartyId, combatId);
        if(loopPayerId == playerId) {
            playerAlreadyInParty = true;
        }
        else if(loopPayerId == -1 && idealCombatPartyId == -1) {
            // This spot is empty, if we didn't pick a spot already, pick this one.
            idealCombatPartyId = combatPartyId;
            idealCombatId = combatId;
        }
    }
}
if(! playerAlreadyInParty) {
    combat_set(idealCombatPartyId, idealCombatId, playerId);
}
