/// combatParty_swap(combatPartyId, combatReserveId)
combatPartyId = argument0;
combatReserveId = argument1;
var playerId = global.combatParty[CMBT_PARTY1, combatPartyId];
global.combatParty[CMBT_PARTY1, combatPartyId] = global.combatParty[CMBT_RESERVE, combatReserveId];
global.combatParty[CMBT_RESERVE, combatReserveId] = playerId;


