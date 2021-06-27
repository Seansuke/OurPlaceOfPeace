//init
v_gfx = GFX_IDLE;
v_img = 0;
v_color = c_white;

//fall check
if(place_clear(x,y + 1) == true)
    {y += 1;}

if(v_target == -1)
    {exit}

//run to enemy
if((v_target).x < x - sprite_width)
{
    v_act = "run";
    v_dir = DIR_LEFT;
}
else if((v_target).x > x + sprite_width)
{
    v_act = "run";
    v_dir = DIR_RIGHT;
}
else
{
    if(mon_arte_init())
        {exit;}
}
