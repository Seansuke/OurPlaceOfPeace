for(tmp_i = 1;tmp_i <= 3;tmp_i += 1)
{
    mon[tmp_i] = -1;
    if(global.monFight[tmp_i] != MAX_MONSTERS)
    {
        tmp = instance_create(x + 100 + tmp_i * 32,y - 10,obj_mon);
        mon[tmp_i] = tmp;
        (tmp).HP = 50 + round(random(10 * global.monsterLevel));
        (tmp).SP = 200 + round(random(20 * global.monsterLevel));
        (tmp).MSP = (tmp).SP;
        (tmp).ATT = 1 + round(random(2 * global.monsterLevel));
        (tmp).DEF = 1 + round(random(2 * global.monsterLevel));
        (tmp).ADEF = 1 + round(random(2 * global.monsterLevel));
        (tmp).SPD = 3 + round(random(3)) + round(random(0.1 * global.monsterLevel));
        (tmp).monsterNum = global.monFight[tmp_i];
        (tmp).plyr = -1;
        switch((tmp).monsterNum)
        {
            case Arach:
                (tmp).gfx[GFX_IDLE] = spr_arach_run;
                (tmp).gfx[GFX_RUN] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DEF] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_EVADE] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DMG] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DEAD] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_MAX] = spr_arach_att;
            break;
            case Zombie:
                (tmp).gfx[GFX_IDLE] = spr_zombie_run;
                (tmp).gfx[GFX_RUN] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DEF] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_EVADE] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DMG] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_DEAD] = (tmp).gfx[GFX_IDLE];
                (tmp).gfx[GFX_MAX] = spr_zombie_att;
                (tmp).HP *= 2;
                (tmp).SPD *= 0.5;
            break;
        }
        (tmp).rollHP = (tmp).HP;
        (tmp).MHP = (tmp).HP;
        (tmp).XP = (tmp).HP / 100 + (tmp).SP / 100 + (tmp).ATT + (tmp).DEF + (tmp).ADEF + (tmp).SPD;
    }
}
