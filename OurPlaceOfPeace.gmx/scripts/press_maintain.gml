//button press control
v_h = ctrl_dir_h();
v_v = ctrl_dir_v();
v_btn = ctrl_btn();
v_trigger = ctrl_trigger();
for(i = BTN_UP;i < BTN_MAX;i += 1)//press or hold control
{
    if(i == BTN_UP || i == BTN_DOWN) //v
    {
        if(v_v == 0) press[i] = 0;
        else if(v_v == i && press[i] < 2)  press[i] += 1;
    }
    else if(i == BTN_ATTACK || i == BTN_GUARD || i == BTN_ARTES1 || i == BTN_ARTES2) //btn
    {
        if(v_btn == 0) press[i] = 0;
        else if(v_btn == i && press[i] < 2) press[i] += 1;
    }
    else if(i == BTN_ACTION || i == BTN_TARGET || i == BTN_MENU)    //trigger
    {
        if(v_trigger == 0) press[i] = 0;
        else if(v_trigger == i && press[i] < 2) press[i] += 1;
    }
    else if(i == BTN_RIGHT || i == BTN_LEFT)    //h
    {
        if(v_h == 0) press[i] = 0;
        else if(v_h == i && press[i] < 2) press[i] += 1;
    }
}

