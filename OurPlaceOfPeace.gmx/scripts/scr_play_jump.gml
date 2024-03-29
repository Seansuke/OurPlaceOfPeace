//init
v_gfx = GFX_EVADE;
v_img += 1/3;

if(v_flyer) {
    // Flying characters do not fall.
    if(place_clear(x,y - getMoveSpeed()/2) == true){
        y -= getMoveSpeed()/2;
    }

    if(v_h == BTN_LEFT && place_clear(x - getMoveSpeed()/2, y)) {
        x -= getMoveSpeed()/2;
        v_dir = DIR_LEFT;
    }
    else if(v_h == BTN_RIGHT && place_clear(x + getMoveSpeed()/2, y)) {
        x += getMoveSpeed()/2;
        v_dir = DIR_RIGHT;
    }
    
    if(v_v != BTN_UP) {
        v_act = "idle";
        exit;
    }

    if(ctrl_press(BTN_ATTACK)) {
        v_attType = PTY_A1_UP;
        if(player_attack_init()){exit;}
    }
    else if(ctrl_press(BTN_ARTES1)) {
        v_attType = PTY_A1_UP;
        if(player_arte_init()){exit;}
    }
    else if(ctrl_press(BTN_ARTES2)) {
        v_attType = PTY_A2_UP;
        if(player_arte_init()){exit;}
    }

    exit;
}

//continue jumpping
if(place_clear(x,y - v_vel) == true)
{
    y -= v_vel;
    if(v_vel > 0)
    {
        v_vel -= FALL_RATE;
    }
}

//start falling
if(place_clear(x,y - v_vel) == false || v_vel <= 0 || v_v == BTN_DOWN)
{
    v_img = 0;
    v_act = "fall";
    if(place_clear(x + getMoveSpeed(),y) == true && v_h == BTN_RIGHT)
    {
        x += getMoveSpeed();
        v_dir = DIR_LEFT;
    }
    else if(place_clear(x - getMoveSpeed(),y) == true && v_h == BTN_LEFT)
    {
        x -= getMoveSpeed();
        v_dir = DIR_RIGHT;
    }
    exit;
}

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
            v_attType = PTY_A1_IDLE;
            if(player_arte_init()){exit;}
        }
        else if(ctrl_press(BTN_ARTES2))
        {
            v_attType = PTY_A2_IDLE;
            if(player_arte_init()){exit;}
        }

        //move while jumping
        if(place_clear(x - getMoveSpeed(),y) == true)
        {
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

          //move while jumping
         if(place_clear(x + getMoveSpeed(),y) == true)
         {
            x += getMoveSpeed();
            v_dir = DIR_RIGHT;
         }
    break;
}

//control v
switch(v_v)
{
    case BTN_DOWN:
        //attack air down
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
        //attack air up
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
            exit;
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

//control j
v_vel += 0.1;
if(ctrl_press(BTN_GUARD))
{
    //air evasion
    v_img = 0;
    v_act = "guard";
    exit;
}
