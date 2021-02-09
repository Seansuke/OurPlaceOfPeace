if(player_get(playerNum,PLY_XP) >= player_get(playerNum,PLY_LVL) * 100)
{
    global.player[playerNum,PLY_XP] -= player_get(playerNum,PLY_LVL) * 100;
    global.player[playerNum,PLY_HP] += 25;
    if(player_get(playerNum,PLY_LVL) mod 10 == 0)
        {global.player[playerNum,PLY_SP] += 100;}
    global.player[playerNum,PLY_ATT] += 1;
    global.player[playerNum,PLY_DEF] += 1;
    global.player[playerNum,PLY_ADEF] += 1;
    if(player_get(playerNum,PLY_LVL) mod 15 == 0)
        {global.player[playerNum,PLY_SPD] += 1;}
    global.player[playerNum,PLY_LVL] += 1;
    animate_text("LEVEL UP TO " + str(player_get(playerNum,PLY_LVL)) + "!",x,y);
}

