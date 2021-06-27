//init
v_gfx = GFX_IDLE;
v_img += 1/3;
v_color = c_white;

//fall check
if(place_clear(x,y + 1) && !v_flyer) {
    v_vel = 1;
    v_act = "fall";
    exit;
}

//control h
switch(v_h) {
    case BTN_LEFT:
         v_img = 0;
         v_act = "run";
         v_dir = DIR_LEFT;
         exit;
    break;
    case BTN_RIGHT:
         v_img = 0;
         v_act = "run";
         v_dir = DIR_RIGHT;
         exit;
    break;
}

//control v
switch(v_v) {
    case BTN_UP:
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
        else {
            v_vel = 10;
            v_img = 0;
            if(!v_flyer) {
                audio_play_sound(sfx_jump, 3, false);
                animate(spr_jump,0,1,v_dir);
            }
            v_act = "jump";
            exit;
        }
    break;
    case BTN_DOWN:
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
        else {
            if(v_flyer) {
                v_act = "fall";
                exit;
            }
        }
        exit;
    break;
}

//control att guard arte1 arte2
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

// Use Trail Mix
if(ctrl_press(BTN_ACTION)) {
    // TODO - change this trigger to be something more effective.
    if(rollHP == HP || rollHP <= 0) {
        // In a state in which can use it.
        var itemSelected = ITEM_HALITE;
        if((HP >= stat[PLY_HP] || rollHP >= stat[PLY_HP]) && get_item_type(itemSelected) == ARTE_EFFECT_HEAL) {
            animate_text("HP Full", x, y);
        }
        else {
            // HP isn't full, so can use it.
            if(get_item_count(itemSelected) > 0) {
                decrement_item_count(itemSelected);
                animate_text(get_item_name(itemSelected) + " used (" + string(get_item_count(itemSelected)) + " left)", x, y);
                switch(get_item_type(itemSelected)) {
                    case ARTE_EFFECT_ATT_BUFF: 
                        bonusATT += get_item_attack(itemSelected);
                        break;
                    case ARTE_EFFECT_DEF_BUFF: 
                        bonusDEF += get_item_attack(itemSelected);
                        break;
                    case ARTE_EFFECT_SPD_BUFF: 
                        bonusSPD += get_item_attack(itemSelected);
                        break;
                }
                rollHP += get_item_attack(itemSelected);
                rollHPSpeed = get_item_attack(itemSelected) / 20;
           }
            else {
                animate_text("Out of " + string(get_item_name(itemSelected)) + "!", x, y);
            }
        }        
        exit;
    }
    else {
        animate_text("HP is still rolling.", x, y);
    }
}

if(v_btn == BTN_GUARD) {
    v_img = 0;
    v_act = "guard";
    exit;
}
