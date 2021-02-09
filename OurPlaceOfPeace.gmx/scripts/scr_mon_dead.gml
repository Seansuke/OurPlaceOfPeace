//init
for(i = 0;i < MAX_PLAYERS;i += 1)
    {global.player[i, PLY_XP] += XP;}
instance_destroy();
