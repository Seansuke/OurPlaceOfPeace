if(global.menu == true)
    {exit;}
sprite_index = gfx[v_gfx];
image_index = v_img;
previousX = x;
previousY = y;

rollHP_maintain();
dmg_maintain();
guard_maintain();

if(v_act == "damage") {
    if(x > room_width - 32) {
        x = 64;
        v_act = "idle";
    }
    else if(x < 32) {
        x = room_width - 64;
        v_act = "idle";
    }
}

// Randomly choose a new target, unless they are downed.
// TODO - add aggro.
if(random(500) == 1 || v_target == -1 || (v_target).HP <= 0) {
    v_tmp = choose(obj_camera.ids[0],obj_camera.ids[1],obj_camera.ids[2],obj_camera.ids[3]);
    if(v_tmp != -1 && instance_exists(v_tmp)) {
        if((v_tmp).HP > 0) {
            v_target = v_tmp;
        }
    }
}

if(v_act == "idle" || v_act == "run" || v_act == "fall" || v_act == "jump" || v_act == "guard" || v_act == "guardian") {
    SP = min(SP + SP_GAINED_PER_FRAME, stat[PLY_SP]);
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
