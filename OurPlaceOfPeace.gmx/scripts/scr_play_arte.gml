//init
v_gfx = GFX_MAX;//special exception
v_img += 1/3;
v_timer += 1;

maintain_falling();

switch(playerNum)
{
    case Sean: scr_sean_arte(); break;
    case AD: scr_ad_arte(); break;
    case Dan: scr_dan_arte(); break;
    case John: scr_john_arte(); break;
    case Serena: scr_serena_arte(); break;
    case James: scr_james_arte(); break;
}

gfx[GFX_MAX] = v_gfx2;
