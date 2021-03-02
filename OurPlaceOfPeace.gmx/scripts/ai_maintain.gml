target = choose(obj_camera.mon[1], obj_camera.mon[2], obj_camera.mon[3])

if(target != -1)
{
    //closer to target if a fighter, farther if not
    if(playerId == AD || playerId == Dan || playerId == Taliko)
    {    
        if(abs(x - target.x) < 200)
        {
            if(x < target.x)
                {v_h = BTN_LEFT;}
            else
                {v_h = BTN_RIGHT;}
        }
        else if(abs(x - target.x) > 250)
        {
            if(x < target.x)
                {v_h = BTN_RIGHT;}
            else
                {v_h = BTN_LEFT;}
        }
    }
    else
    {    
        if(abs(x - target.x) > 30)
        {
            if(x < target.x)
                {v_h = BTN_RIGHT;}
            else
                {v_h = BTN_LEFT;}
        }
    }
    
    var attackRandomly = true;
    var isHealer = playerId == AD || playerId == Taliko;
    if(isHealer)
    {
        if(playerId == AD) {
            v_arteNum = arte_find("Restore");
        }
        else {
            v_arteNum = arte_find("Chill Wounds");
        }
        for(i=0;i<ARTE_MAX;i+=1) {
            skill[i] = arte_get(v_arteNum,i);
        }
        
        // Special logic for the healer.
        var v_target = -1;
        var v_targetHpRatio = 1;
        for(var targetCombatId = 0; targetCombatId < PTY_AMNT; targetCombatId++) {
            var targetInstanceId = obj_camera.ids[targetCombatId];
            if(! instance_exists(targetInstanceId) || SP < skill[ARTE_COST]) {
                continue;
            }
            
            var hpRatio = (targetInstanceId).rollHP / (targetInstanceId).stat[PLY_HP];
            if( hpRatio < 0.8 && hpRatio < v_targetHpRatio) {
                v_target = targetCombatId;
            }
        }
        if(v_target >= 0) {
            SP -= skill[ARTE_COST];
            global.arte[v_arteNum, ARTE_USES] += 1;
            v_btn = BTN_ARTES1;
            v_act = "arte";
            attackRandomly = false;
        }
    }
    
    // random attacking
    if(attackRandomly) {
        if(SP >= stat[PLY_SP]) {
            press[choose(BTN_ARTES1, BTN_ARTES2, BTN_MAX)] = 1;
            press[choose(BTN_UP, BTN_RIGHT, BTN_LEFT, BTN_DOWN, BTN_MAX)] = 1;
        }
        else {
            press[choose(BTN_ATTACK, BTN_GUARD, BTN_ARTES1, BTN_ARTES2, BTN_MAX)] = 1;
            press[choose(BTN_UP, BTN_RIGHT, BTN_LEFT, BTN_DOWN, BTN_MAX)] = 1;
        }
    }
    
    if(target.x > x) {
        v_dir = DIR_RIGHT;
    }
    else {
        v_dir = DIR_LEFT;
    }
}
