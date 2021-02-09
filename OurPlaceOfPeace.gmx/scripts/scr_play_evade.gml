//init
v_gfx = GFX_EVADE;
v_img += 1/3;
v_timer += 1;

maintain_falling();

//backstep
if(v_timer < 5)
{
    if(place_clear(x - 20 * v_dir,y) == true)
    {
        x -= 20 * v_dir;
    }
}
else if(v_timer < 10)
{
    v_img = 0;
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

