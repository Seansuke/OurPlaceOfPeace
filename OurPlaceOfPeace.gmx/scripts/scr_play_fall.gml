//init
v_gfx = GFX_EVADE;
v_img += 1/3;
v_vel = abs(v_vel);

if(v_flyer) {
    if(place_clear(x,y + getMoveSpeed()) == true){
        y += getMoveSpeed();
    };
    
    if(v_h == BTN_LEFT && place_clear(x - getMoveSpeed()/2, y)) {
        x -= getMoveSpeed()/2;
        v_dir = DIR_LEFT;
    }
    else if(v_h == BTN_RIGHT && place_clear(x + getMoveSpeed()/2, y)) {
        x += getMoveSpeed()/2;
        v_dir = DIR_RIGHT;
    }
    
    if(v_v != BTN_DOWN) {
        v_act = "idle";
        exit;
    }
    
    if(ctrl_press(BTN_ATTACK)) {
        v_attType = PTY_A1_DOWN;
        if(player_attack_init()){exit;}
    }
    else if(ctrl_press(BTN_ARTES1)) {
        v_attType = PTY_A1_DOWN;
        if(player_arte_init()){exit;}
    }
    else if(ctrl_press(BTN_ARTES2)) {
        v_attType = PTY_A2_DOWN;
        if(player_arte_init()){exit;}
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
        if(place_clear(x - getMoveSpeed(),y) == true){
            x -= getMoveSpeed();
            v_dir = DIR_LEFT;
        }
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
        if(place_clear(x + getMoveSpeed(),y) == true) {
            x += getMoveSpeed();
            v_dir = DIR_RIGHT;
        }
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
