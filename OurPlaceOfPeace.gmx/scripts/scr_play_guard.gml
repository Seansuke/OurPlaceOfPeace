//init
v_gfx = GFX_DEF;
v_img += 1/3;

//check for guard break
if(v_guard <= 0)
{
    v_guard = 0;
    v_img = 0;
    v_vel = 10;
    sound_play(sfx_crash);
    animate(spr_pop,1/3,false,DIR_RIGHT);
    v_act = "damage";
    exit;
}

maintain_falling();

//backstep
if((v_dir == DIR_RIGHT && ctrl_press(BTN_LEFT)) || (v_dir == DIR_LEFT && ctrl_press(BTN_RIGHT)))
{
    v_timer = 0;
    v_img = 0;
    v_act = "evade";
    exit;
}

//counter
if((v_dir == DIR_LEFT && ctrl_press(BTN_LEFT)) || (v_dir == DIR_RIGHT && ctrl_press(BTN_RIGHT)))
{
    v_timer = 8;
    v_img = 0;
    v_act = "counter";
    exit;
}

//control guardian
if(ctrl_press(BTN_DOWN))
{
    v_img = 0;
    v_act = "guardian";
    exit;
}

//control jump
if(place_clear(x,y + v_vel) == false)
{
    if(ctrl_press(BTN_UP))
    {
        v_vel = 10;
        v_img = 0;
        sound_play(sfx_jump);
        animate(spr_jump,0,0,1);
        v_act = "jump";
        exit;
    }
}

//stop guarding
if(v_btn != BTN_GUARD)
{
    v_img = 0;
    v_act = "idle";
    exit;
}
