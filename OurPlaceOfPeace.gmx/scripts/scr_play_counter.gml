//init
v_gfx = GFX_EVADE;
v_img += 1/3;
v_timer -= 1;

maintain_falling();

//counter
if(v_timer > 6)
{
    if(place_clear(x + v_timer * 3 * v_dir,y) == true)
    {
        x += v_timer * 3 * v_dir;
    }
}
else if(v_timer > 0)
{
    v_gfx = GFX_IDLE;
    v_img += 0;    
}
else
{
    if(v_btn == BTN_GUARD)
    {
        v_act = "guard";
        exit;
    }
    else
    {
        v_act = "idle";
        exit;
    }
}

