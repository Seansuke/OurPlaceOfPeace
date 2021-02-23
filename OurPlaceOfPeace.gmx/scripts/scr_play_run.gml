//init
v_gfx = GFX_RUN;
v_img += 1/3;

//fall check
if(place_clear(x,y + 1) == true)
{
    v_vel = 1;
    v_act = "fall";
    exit;
}

//control
switch(v_h)
{
    case BTN_LEFT:
         v_dir = -1;
         if(place_clear(x - SPD,y) == true){x -= SPD};
    break;
    case BTN_RIGHT:
         v_dir = 1;
         if(place_clear(x + SPD,y) == true){x += SPD};
    break;
    default:
        v_img = 0;
        v_act = "idle";
        exit;
    break;
}

//control att def arte1/2
if(ctrl_press(BTN_ATTACK))
{
    v_attType = PTY_A1_SIDE;
    if(player_attack_init()){exit;}
}
else if(ctrl_press(BTN_ARTES1))
{
    v_attType = PTY_A1_SIDE;
    if(player_arte_init()){exit;}
}
else if(ctrl_press(BTN_ARTES2))
{
    v_attType = PTY_A2_SIDE;
    if(player_arte_init()){exit;}
}

//control vertical
if(v_v == BTN_UP)
{
    v_vel = 10;
    if(!v_flyer) {
        audio_play_sound(sfx_jump, 3, false);
        animate(spr_jump,0,1,v_dir);
    }
    v_act = "jump";
    exit;
}
else if(v_v == BTN_DOWN)
{
    if(v_flyer) {
        v_act = "fall";
        exit;
    }
}

//control button
if(v_btn == BTN_GUARD)
{
    v_img = 0;
    v_act = "guard";
    exit;
}
