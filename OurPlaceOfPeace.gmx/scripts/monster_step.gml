if(global.menu == true)
    {exit;}

previousX = x;
previousY = y;

rollHP_maintain();
dmg_maintain();
guard_maintain();

v_tmp = choose(obj_camera.ids[1],obj_camera.ids[2],obj_camera.ids[3]);
if(v_tmp != -1)
    {v_target = v_tmp}

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
         scr_mon_idle();
    break;
    case "run":
         scr_mon_run();
    break;

    //damage
    case "damage":
        scr_mon_damage();
    break;
    case "dead":
        scr_mon_dead();
    break;
    
    //misc
    case "arte":
         scr_mon_arte();
    break;
    default:
        v_act = "idle";
    break;
}
