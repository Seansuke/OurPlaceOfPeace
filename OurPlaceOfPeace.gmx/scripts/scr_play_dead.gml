//init
v_gfx = GFX_DEAD;
v_img += 1/3;

maintain_falling();

if(HP > 0)
{
    animate(spr_pop,false,false,DIR_RIGHT);
    v_img = 0;
    v_act = "idle";
    exit;
}
