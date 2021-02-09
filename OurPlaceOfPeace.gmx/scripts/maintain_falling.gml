//continue falling
if(place_clear(x,y + v_vel) == true)
{
    y += v_vel;
    if(v_vel < 15)
    {
        v_vel += FALL_RATE;
    }
}
else if(place_clear(x,y + 1) == true)//stop falling
{
    for(v_vel = v_vel;v_vel > 0;v_vel -= 1) /*fall into place*/
    {        
        if(place_clear(x,y + v_vel) == true)
        {
            y += v_vel;
        }
    }
}

