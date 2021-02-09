//ids dmg
for(i = 0;i < 20;i += 1)
{
    if(dmg[i,DMG_TIMER] >= 0)
    {
        dmg[i,DMG_TIMER] -= 1;
    }
    else
    {
        dmg[i,DMG_ID] = -1;
    }
}
