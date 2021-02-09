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
    switch(playerNum)
    {
        case Sean:
            (tmp).gfx[GFX_IDLE] = spr_sean_idle;
            (tmp).gfx[GFX_RUN] = spr_sean_run;
            (tmp).gfx[GFX_DEF] = spr_sean_def;
            (tmp).gfx[GFX_EVADE] = spr_sean_evade;
            (tmp).gfx[GFX_DMG] = spr_sean_dmg;
            (tmp).gfx[GFX_DEAD] = spr_sean_dead;
        break;
        case AD:
            (tmp).gfx[GFX_IDLE] = spr_ad_idle;
            (tmp).gfx[GFX_RUN] = spr_ad_run;
            (tmp).gfx[GFX_DEF] = spr_ad_def;
            (tmp).gfx[GFX_EVADE] = spr_ad_def;
            (tmp).gfx[GFX_DMG] = spr_ad_dmg;
            (tmp).gfx[GFX_DEAD] = spr_ad_dead;
        break;
        case Dan:
            (tmp).gfx[GFX_IDLE] = spr_dan_idle;
            (tmp).gfx[GFX_RUN] = spr_dan_run;
            (tmp).gfx[GFX_DEF] = spr_dan_def;
            (tmp).gfx[GFX_EVADE] = spr_dan_evade;
            (tmp).gfx[GFX_DMG] = spr_dan_dmg;
            (tmp).gfx[GFX_DEAD] = spr_dan_dead;
        break;
        case John:
            (tmp).gfx[GFX_IDLE] = spr_john_idle;
            (tmp).gfx[GFX_RUN] = spr_john_run;
            (tmp).gfx[GFX_DEF] = spr_john_def;
            (tmp).gfx[GFX_EVADE] = spr_john_evade;
            (tmp).gfx[GFX_DMG] = spr_john_dmg;
            (tmp).gfx[GFX_DEAD] = spr_john_dead;
        break;
        case Serena:
            (tmp).gfx[GFX_IDLE] = spr_serena_idle;
            (tmp).gfx[GFX_RUN] = spr_serena_run;
            (tmp).gfx[GFX_DEF] = spr_serena_def;
            (tmp).gfx[GFX_EVADE] = spr_serena_evade;
            (tmp).gfx[GFX_DMG] = spr_serena_dmg;
            (tmp).gfx[GFX_DEAD] = spr_serena_dead;
        break;
        case James:
            (tmp).gfx[GFX_IDLE] = spr_james_idle;
            (tmp).gfx[GFX_RUN] = spr_james_run;
            (tmp).gfx[GFX_DEF] = spr_james_def;
            (tmp).gfx[GFX_EVADE] = spr_james_evade;
            (tmp).gfx[GFX_DMG] = spr_james_dmg;
            (tmp).gfx[GFX_DEAD] = spr_james_dead;
        break;
    }
}
