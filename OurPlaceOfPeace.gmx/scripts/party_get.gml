/// party_get(playerId, PTY_field)
if(argument0 < 0 || argument0 > MAX_PLAYERS){return "error";}
if(argument1 < 0 || argument1 > PTY_MAX){return "error";}

return global.pty[argument0,argument1];
