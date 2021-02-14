//init
v_gfx = GFX_DEF;
v_img += 1/3;

//check for guard break
if(v_guard <= 0)
{
    v_img = 0;
    v_vel = 10;
    audio_play_sound(sfx_crash, 3, false);
    animate(spr_pop,1/3,false,DIR_RIGHT);
    v_act = "damage";
    exit;
}

maintain_falling();


//stop guardian-ing
if(v_v != BTN_DOWN)
{
    v_img = 0;
    v_act = "guard";
    exit;
}

//stop guarding
if(v_btn != BTN_GUARD)
{
    v_img = 0;
    v_act = "idle";
    exit;
}
