depth = -y;
press_maintain();//maintain all controls
if(global.menu == false)
{
    //running
    v_gfx = spr_sean_idle;
    v_img += 1/3;
    switch(ctrl_dir_h())
    {
        case BTN_RIGHT: 
            if(place_meeting(x + v_speed,y,obj_areaWall) == false)
            {
                x += v_speed;
                v_gfx = spr_sean_run;
                v_dir = 1;
            }
        break;
        case BTN_LEFT:
            if(place_meeting(x - v_speed,y,obj_areaWall) == false)
            {
                x -= v_speed;
                v_gfx = spr_sean_run;
                v_dir = -1;
            }
        break;
    }
    switch(ctrl_dir_v())
    {
        case BTN_DOWN: 
            if(place_meeting(x,y + v_speed,obj_areaWall) == false)
            {
                y += v_speed;
                v_gfx = spr_sean_run;
            }
        break;
        case BTN_UP:
            if(place_meeting(x,y - v_speed,obj_areaWall) == false)
            {
                y -= v_speed;
                v_gfx = spr_sean_run;
            }
        break;
    }
    init_menu();
}
else
{
    depth = -10001;
    menu_maintain();
}
