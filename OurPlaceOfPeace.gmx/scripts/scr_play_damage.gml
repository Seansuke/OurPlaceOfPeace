//init
v_gfx = GFX_DMG;
v_img += 1/3;
v_timer -= 1;

maintain_falling();

if(place_clear(x - v_dir * v_timer,y) == true)
    {x -= v_dir * v_timer;}

//done
if(v_timer <= 0)
{
    v_img = 0;
    v_act = "idle";
    exit;
}
