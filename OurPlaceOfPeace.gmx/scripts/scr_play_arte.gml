//init
v_gfx = GFX_MAX;//special exception - will be set in the arte scripts below.
v_img += 1/3;
v_timer += 1;

//maintain_falling();
var gfxId = skill[ARTE_USER_GFX];
v_gfx2 = gfx[gfxId];
switch(playerNum)
{
    case Dan: scr_dan_arte(); break;
    case John: scr_john_arte(); break;
    case James: scr_james_arte(); break;
    default:
        scr_sean_arte(); 
        scr_ad_arte(); 
        scr_serena_arte();
    break;
}

gfx[GFX_MAX] = v_gfx2;
