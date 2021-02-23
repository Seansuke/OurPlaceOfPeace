for(partyNum = 1;partyNum <= 3;partyNum += 1)
{
    tmp = instance_create(x - partyNum * 32,y - 1,obj_player);
    ids[partyNum] = tmp;
    playerNum = party_get(partyNum,PTY_PLAYER);
    (tmp).gfx[GFX_FACE] = face_get(playerNum);
    (tmp).HP = party_get(partyNum,PTY_HP);
    (tmp).rollHP = party_get(partyNum,PTY_HP);
    (tmp).MHP = player_get(playerNum,PLY_HP);
    (tmp).SP = player_get(playerNum,PLY_SP);
    (tmp).MSP = player_get(playerNum,PLY_SP);
    (tmp).ATT = player_get(playerNum,PLY_ATT);
    (tmp).DEF = player_get(playerNum,PLY_DEF);
    (tmp).ADEF = player_get(playerNum,PLY_ADEF);
    (tmp).SPD = player_get(playerNum,PLY_SPD);
    (tmp).playerNum = party_get(partyNum,PTY_PLAYER);
    (tmp).plyr = partyNum;
    
    if((tmp).playerNum == Raka) {
        (tmp).v_flyer = true;
    }
    
    for(var i = 0; i < GFX_MAX; i += 1) {
        (tmp).gfx[i] = global.gfx[playerNum,i];
    }
}
