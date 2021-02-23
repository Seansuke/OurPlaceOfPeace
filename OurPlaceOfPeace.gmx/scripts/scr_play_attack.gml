//init
v_gfx = GFX_MAX;//special exception
v_img += 1/3;
v_timer += 1;

//maintain_falling();
    
// Actions on the first frame
if(floor(v_timer) == 1){

    // Store the attack type as the button held
    if(v_v == BTN_UP)
        {v_attType = PTY_A1_UP;}
    else if(v_v == BTN_DOWN)
        {v_attType = PTY_A1_DOWN;}
    else if(v_h == BTN_RIGHT || v_h == BTN_LEFT)
        {v_attType = PTY_A1_SIDE;}
    else
        {v_attType = PTY_A1_IDLE;}

    // Store the graphic for this attack
    switch(v_attType){
        case PTY_A1_IDLE:v_gfx2 = gfx[GFX_ATTACK];break;
        case PTY_A1_UP:v_gfx2 = gfx[GFX_ATTACK_UP];break;
        case PTY_A1_SIDE:v_gfx2 = gfx[GFX_ATTACK_SIDE];break;
        case PTY_A1_DOWN:v_gfx2 = gfx[GFX_ATTACK_DOWN];break;
    }
}

if(playerNum == AD || playerNum == Dan || playerNum == Taliko) {
    // All range fighters create the hitbox on the 15th frame
    if(floor(v_timer) == 3*5) {
        scr_player_attack_create(x,y);    
    }
}
else if(floor(v_timer) == 3*3){
    // All melee fighters create the hitbox on the 9th frame.
    scr_player_attack_create(x,y);
}

if(floor(v_timer) >= 3*2 && floor(v_timer) <= 3*4) {
    // Movement during attack
    switch(v_attType){
        case PTY_A1_SIDE:
            if(place_clear(x + SPD / 2 * v_dir,y) == true){
                x += SPD / 2 * v_dir;
            }
        break;
        case PTY_A1_DOWN:
            if(place_clear(x,y + SPD / 2) == true){
                y += SPD / 2;
            }
            else if(place_clear(x - SPD / 2 * v_dir,y) == true){
                x -= SPD / 2 * v_dir;
            }
        break;
        case PTY_A1_UP:
            if(place_clear(x,y - SPD / 2) == true){
                y -= SPD / 2;
            }
        break;
    }
}

// Attack interrupt to attack again
if(v_timer >= 3*4){
    if(ctrl_press(BTN_ATTACK)){
        if(player_attack_init() ){
            exit;
        }
    }
}
            
if(v_timer > 3*5) {
    v_act = "idle";
    exit;
}

gfx[GFX_MAX] = v_gfx2;
