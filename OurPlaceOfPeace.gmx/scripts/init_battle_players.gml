for(var combatId = 0; combatId < PTY_AMNT; combatId++) {
    var playerId = combat_get(CMBT_PARTY1, combatId);
    if(playerId == -1) {
        ids[combatId] = -1;
        continue;
    }
    var playerInstanceId = instance_create(x - combatId * 32,y - 1,obj_player);
    ids[combatId] = playerInstanceId;
    (playerInstanceId).gfx[GFX_FACE] = face_get(playerId);
    (playerInstanceId).playerId = playerId;
    (playerInstanceId).combatId = combatId;

    for(var statI = 0; statI < PLY_MAX; statI++) {
        var baseStat = player_get(playerId, statI);
        (playerInstanceId).stat[statI] = getStat(global.playerLevel, statI, baseStat);
    }
    (playerInstanceId).HP = party_get(playerId, PTY_HP);
    (playerInstanceId).rollHP = (playerInstanceId).HP;
    (playerInstanceId).SP = 0;
    
    if(global.preempt) {
        (playerInstanceId).SP = (playerInstanceId).stat[PLY_SP];
    }
    
    if((playerInstanceId).playerId == Raka) {
        (playerInstanceId).v_flyer = true;
    }
    
    for(var i = 0; i < GFX_MAX; i += 1) {
        (playerInstanceId).gfx[i] = global.gfx[playerId,i];
    }
}
