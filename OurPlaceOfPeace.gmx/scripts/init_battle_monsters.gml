for(monI = 0; monI < PTY_AMNT; monI++) {
    mon[monI] = -1;
    if(global.monFight[monI] != MAX_MONSTERS) {
        foeInstance = instance_create(x + 100 + monI * 32,y - 10,obj_mon);
        mon[monI] = foeInstance;
        var monsterNum = global.monFight[monI];
        (foeInstance).XP = 0;
        for(var statI = 0; statI < PLY_MAX; statI++) {
            var foeBaseStat = global.foeStat[monsterNum, statI];
            if(is_real(foeBaseStat)) {
                (foeInstance).XP += foeBaseStat;
            }
            (foeInstance).stat[statI] = getStat(global.monsterLevel, statI, foeBaseStat);
        }
        
        (foeInstance).XP *= global.monsterLevel;
        (foeInstance).stat[PLY_SP] = (foeInstance).stat[PLY_SP] * 10;
        (foeInstance).SP = (foeInstance).stat[PLY_SP];
        (foeInstance).rollHP = (foeInstance).stat[PLY_HP];
        (foeInstance).HP = (foeInstance).stat[PLY_HP];
        
        for(var i = 0; i < GFX_MAX; i += 1) {
            (foeInstance).gfx[i] = global.foeGfx[monsterNum, i];
        }
        
        (foeInstance).combatId = monI;
        (foeInstance).monsterNum = global.monFight[monI];
        
        if(global.monFight[monI] == Harpy) {
            (foeInstance).v_flyer = true;
        }
    }
}
