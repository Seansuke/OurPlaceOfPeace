//init
v_gfx = GFX_IDLE;
v_img += 1/3;
v_color = c_white;

//fall check
if(place_clear(x,y + 1) == true)
{
    v_vel = 1;
    v_act = "fall";
    exit;
}

//control h
switch(v_h)
{
    case BTN_LEFT:
         v_img = 0;
         v_act = "run";
         v_dir = DIR_LEFT;
         exit;
    break;
    case BTN_RIGHT:
         v_img = 0;
         v_act = "run";
         v_dir = DIR_RIGHT;
         exit;
    break;
}

//control v
switch(v_v)
{
    case BTN_UP:
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_UP;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_UP;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_UP;
            if(player_arte_init()){exit;}
        }
        else
        {
            v_vel = 10;
            v_img = 0;
            audio_play_sound(sfx_jump, 3, false);
            animate(spr_jump,0,0,1);
            v_act = "jump";
            exit;
        }
    break;
    case BTN_DOWN:
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_DOWN;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_DOWN;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_DOWN;
            if(player_arte_init()){exit;}
        }
        exit;
    break;
}

//control att guard arte1 arte2
if(ctrl_press(BTN_ATTACK))
{
    v_attType = PTY_A1_IDLE;
    if(player_attack_init()){exit;}
}
else if(ctrl_press(BTN_ARTES1))
{
    v_attType = PTY_A1_IDLE;
    if(player_arte_init()){exit;}
}
else if(ctrl_press(BTN_ARTES2))
{
    v_attType = PTY_A2_IDLE;
    if(player_arte_init()){exit;}
}

if(v_btn == BTN_GUARD)
{
    v_img = 0;
    v_act = "guard";
    exit;
}
