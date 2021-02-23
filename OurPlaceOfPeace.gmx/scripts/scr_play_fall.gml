//init
v_gfx = GFX_EVADE;
v_img += 1/3;
v_vel = abs(v_vel);

if(v_flyer) {
    if(place_clear(x,y + SPD) == true){
        y += SPD
    };
    if(v_v != BTN_DOWN) {
        v_act = "idle";
    }
    exit;
}

maintain_falling();

if(place_clear(x,y + 1) == false)//stop falling
    {v_act = "idle";exit;}

//control
switch(v_h)
{
    case BTN_LEFT:
         //attack air sides
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_SIDE;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_SIDE;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_SIDE;
            if(player_arte_init()){exit;}
        }

        //control direction
        if(place_clear(x - SPD,y) == true){x -= SPD;}
    break;
    case BTN_RIGHT:
         //attack air sides
         if(ctrl_press(BTN_ATTACK))
         {
            v_attType = PTY_A1_SIDE;
            if(player_attack_init()){exit;}
         }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_SIDE;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_SIDE;
            if(player_arte_init()){exit;}
        }
         //control direction
         if(place_clear(x + SPD,y) == true){x += SPD;}
    break;
}

//control v
switch(v_v)
{
    case BTN_DOWN:
        //attack air sides
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_DOWN;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_DOWN;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_DOWN;
            if(player_arte_init()){exit;}
        }
    break;
    case BTN_UP:
        //attack air sides
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_UP;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_UP;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_UP;
            if(player_arte_init()){exit;}
        }
    break;
    default:
        //attack air idle
        if(ctrl_press(BTN_ATTACK))
        {
            v_attType = PTY_A1_IDLE;
            if(player_attack_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES1))
        {
            v_attType = PTY_A1_IDLE;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_IDLE;
            if(player_arte_init()){exit;}
        }
    break;
}


//control btn
if(ctrl_press(BTN_GUARD))
{
         //air evade
         v_img = 0;
         v_act = "guard";
         exit;
}
