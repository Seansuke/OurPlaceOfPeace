depth = -y;
press_maintain();//maintain all controls
if(global.menu == false)
{
    //running
    v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_IDLE];
    v_img += 1/3;
    switch(ctrl_dir_h())
    {
        case BTN_RIGHT: 
            v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
            if(place_meeting(x + v_speed,y,obj_areaWall) == false)
            {
                x += v_speed;
                v_dir = 1;
            }
        break;
        case BTN_LEFT:
            v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
            if(place_meeting(x - v_speed,y,obj_areaWall) == false)
            {
                x -= v_speed;
                v_dir = -1;
            }
        break;
    }
    switch(ctrl_dir_v())
    {
        case BTN_DOWN: 
            v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
            if(place_meeting(x,y + v_speed,obj_areaWall) == false)
            {
                y += v_speed;
            }
        break;
        case BTN_UP:
            v_gfx = global.gfx[combat_get(CMBT_PARTY1, combatId), GFX_RUN];
            if(place_meeting(x,y - v_speed,obj_areaWall) == false)
            {
                y -= v_speed;
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
