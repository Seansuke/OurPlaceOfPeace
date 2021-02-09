for(tmp_i = 0;tmp_i < 20;tmp_i += 1) //check for new dmg
{
    if(dmg[tmp_i,DMG_TIMER] <= 0)
    {
        dmg[tmp_i,DMG_ID] = argument0;
        dmg[tmp_i,DMG_TIMER] = argument1;
        exit;
    }
} 
