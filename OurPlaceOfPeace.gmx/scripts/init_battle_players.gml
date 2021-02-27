for(var partyId = 1; partyId <= 3; partyId++) {
    var playerInstanceId = instance_create(x - partyId * 32,y - 1,obj_player);
    ids[partyId] = playerInstanceId;
    var playerId = party_get(partyId,PTY_PLAYER);
    (playerInstanceId).gfx[GFX_FACE] = face_get(playerId);
    (playerInstanceId).playerNum = party_get(partyId,PTY_PLAYER);
    (playerInstanceId).playerId = party_get(partyId,PTY_PLAYER);
    (playerInstanceId).plyr = partyId;

    for(var statI = 0; statI < PLY_MAX; statI++) {
        var baseStat = player_get(playerId, statI);
        (playerInstanceId).stat[statI] = getStat(global.playerLevel, statI, baseStat);
    }
    (playerInstanceId).rollHP = (playerInstanceId).stat[PTY_HP];
    (playerInstanceId).HP = (playerInstanceId).stat[PLY_HP];
    (playerInstanceId).SP = (playerInstanceId).stat[PLY_SP];
    
    if((playerInstanceId).playerId == Raka) {
        (playerInstanceId).v_flyer = true;
    }
    
    for(var i = 0; i < GFX_MAX; i += 1) {
        (playerInstanceId).gfx[i] = global.gfx[playerId,i];
    }
}
