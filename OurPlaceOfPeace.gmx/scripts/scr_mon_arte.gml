//init
v_img += 1/3;
v_timer += 1;

maintain_falling();

switch(skill[ARTE_NAME])
{
    case "Strike":
        if(floor(v_timer) == 3*3)
            {scr_mon_arte_create();}
        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
}
