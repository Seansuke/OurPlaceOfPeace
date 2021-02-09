scr_level_check();

if(global.menu == true)
{    
    if(global.menu_plyr != plyr)
        {exit;}
    depth = -10001;
    press_maintain();
    menu_maintain();
    exit;
}
else
{
    depth = - obj_camera.y;
    if(init_menu() == true)
        {global.menu_plyr = plyr;exit;}
}
press_maintain();
previousX = x;
previousY = y;
rollHP_maintain();
dmg_maintain();
guard_maintain();
if(party_get(plyr,PTY_HMN) == "CPU")
{
    ai_maintain();
}

if(v_act == "idle" || v_act == "run" || v_act == "fall" || v_act == "jump" || v_act == "guard" || v_act == "guardian")
{
    if(SP < MSP)
        {SP += 5;}
    else
        {SP = MSP;}
}

//determine action
switch(v_act)
{
    //navigate
    case "idle":
         scr_play_idle();
    break;
    case "run":
         scr_play_run();
    break;
    case "fall":
         scr_play_fall();
    break;
    case "jump":
         scr_play_jump();
    break;
    //defensive
    case "guard":
         scr_play_guard();
    break;
    case "guardian":
         scr_play_guardian();
    break;
    case "evade":
         scr_play_evade();
    break;
    case "counter":
        scr_play_counter();
    break;

    //damage
    case "dead":
        scr_play_dead();
    break;

    case "damage":
         scr_play_damage();
    break;
    
    //misc
    case "attack":
         scr_play_attack();
    break;
    case "arte":
         scr_play_arte();
    break;
    default:
        v_act = "idle";
    break;
}