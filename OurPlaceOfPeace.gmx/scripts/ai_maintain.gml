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
    
    if(SP >= MSP)
    {
        press[choose(BTN_ATTACK, BTN_GUARD, BTN_ARTES1, BTN_ARTES2, 0)] = 1;
        press[choose(BTN_UP, choose(BTN_RIGHT, BTN_LEFT), BTN_DOWN, 0)] = 1;
    }
    else
    {
        var isHealer = playerNum == AD || playerNum == Taliko;
        // Special logic for the healer.
        if(SP > 10 && isHealer && 
            ((obj_camera.ids[1]).HP != (obj_camera.ids[1]).MHP ||
            (obj_camera.ids[2]).HP != (obj_camera.ids[2]).MHP ||
            (obj_camera.ids[3]).HP != (obj_camera.ids[3]).MHP))
        {
            v_btn = BTN_ARTES1;
            if(playerNum == AD) {
                v_arteNum = arte_find("Restore");
            }
            else {
                v_arteNum = arte_find("Chill Wounds");
            }
            for(i=0;i<ARTE_MAX;i+=1) {
                skill[i] = arte_get(v_arteNum,i);
            }
            v_act = "arte";
            v_ally_target = 1;
            if((obj_camera.ids[2]).HP / (obj_camera.ids[2]).MHP < (obj_camera.ids[1]).HP / (obj_camera.ids[1]).MHP &&
                (obj_camera.ids[2]).HP / (obj_camera.ids[2]).MHP < (obj_camera.ids[3]).HP / (obj_camera.ids[3]).MHP)
                    {v_ally_target = 2;}
            if((obj_camera.ids[3]).HP / (obj_camera.ids[3]).MHP < (obj_camera.ids[1]).HP / (obj_camera.ids[1]).MHP &&
                (obj_camera.ids[3]).HP / (obj_camera.ids[3]).MHP < (obj_camera.ids[2]).HP / (obj_camera.ids[2]).MHP)
                    {v_ally_target = 3;}
        }
    }
    
    if(target.x > x)
        {v_dir = DIR_RIGHT;}
    else
        {v_dir = DIR_LEFT;}
}
