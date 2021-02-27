target = choose(obj_camera.mon[1], obj_camera.mon[2], obj_camera.mon[3])

if(target != -1)
{
    //closer to target if a fighter, farther if not
    if(playerNum == AD || playerNum == Dan || playerNum == Taliko)
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
    var isHealer = playerNum == AD || playerNum == Taliko;
    if(isHealer)
    {
        if(playerNum == AD) {
            v_arteNum = arte_find("Restore");
        }
        else {
            v_arteNum = arte_find("Chill Wounds");
        }
        for(i=0;i<ARTE_MAX;i+=1) {
            skill[i] = arte_get(v_arteNum,i);
        }
        
        // Special logic for the healer.
        var p1HpRatio = (obj_camera.ids[1]).rollHP / (obj_camera.ids[1]).stat[PLY_HP];
        var p2HpRatio = (obj_camera.ids[2]).rollHP / (obj_camera.ids[2]).stat[PLY_HP];
        var p3HpRatio = (obj_camera.ids[3]).rollHP / (obj_camera.ids[3]).stat[PLY_HP];
        if(SP >= skill[ARTE_COST] && 
            (p1HpRatio < 0.8 || p2HpRatio < 0.8 || p3HpRatio < 0.8))
        {
            SP -= skill[ARTE_COST];
            global.arte[v_arteNum, ARTE_USES] += 1;
            v_btn = BTN_ARTES1;
            v_act = "arte";
            v_ally_target = 1;
            if(p2HpRatio < min(p1HpRatio, p3HpRatio)) {
                v_ally_target = 2;
            }
            if(p3HpRatio > min(p1HpRatio, p2HpRatio)) {
                v_ally_target = 2;
            }
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
    
    if(target.x > x)
        {v_dir = DIR_RIGHT;}
    else
        {v_dir = DIR_LEFT;}
}
