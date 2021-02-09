//init
v_gfx = GFX_MAX;//special exception
v_img += 1/3;
v_timer += 1;

//maintain_falling();

if(v_v == BTN_UP)
    {v_attType = PTY_A1_UP;}
else if(v_v == BTN_DOWN)
    {v_attType = PTY_A1_DOWN;}
else if(v_h == BTN_RIGHT || v_h == BTN_LEFT)
    {v_attType = PTY_A1_SIDE;}
else
    {v_attType = PTY_A1_IDLE;}

switch(playerNum)
{
    case Sean:
        if(floor(v_timer) == 1){
            switch(v_attType){
                case PTY_A1_IDLE:v_gfx2 = spr_sean_att;break;
                case PTY_A1_UP:v_gfx2 = spr_sean_att_up;break;
                case PTY_A1_SIDE:v_gfx2 = spr_sean_att_down;break;
                case PTY_A1_DOWN:v_gfx2 = spr_sean_att_up;break;
            }
        }
        
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
        }
    
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*4){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;
                }
            }
        }
                    
        if(v_timer > 3*5){
            v_act = "idle";exit;}
    break;
    case AD:
        if(floor(v_timer) == 1){
            v_gfx2 = spr_ad_att;}
        if(floor(v_timer) == 3*2){
            scr_player_attack_create(x+v_dir*32,y);}
            
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
        }
        
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*4){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;}}}
        if(v_timer > 3*5){
            v_act = "idle";exit;}
    break;
    case Dan:
        if(floor(v_timer) == 1){
            v_gfx2 = spr_dan_att;}
        if(floor(v_timer) == 3*4){
            scr_player_attack_create(x+v_dir*32,y);}
            
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
        }
        
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*5){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;}}}
                    
        if(v_timer > 3*6){
            v_act = "idle";exit;}
    break;
    case John:
        if(floor(v_timer) == 1){
            switch(v_attType){
                case PTY_A1_IDLE:v_gfx2 = spr_john_att;break;
                case PTY_A1_UP:v_gfx2 = spr_john_att_up;break;
                case PTY_A1_SIDE:v_gfx2 = spr_john_att_down;break;
                case PTY_A1_DOWN:v_gfx2 = spr_john_att_up;break;
            }
        }
        
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
        }
        
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*4){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;}}}
                    
        if(v_timer > 3*5){
            v_act = "idle";exit;}
    break;
    case Serena:
        if(floor(v_timer) == 1){
            switch(v_attType){
                case PTY_A1_IDLE:v_gfx2 = spr_serena_att;break;
                case PTY_A1_UP:v_gfx2 = spr_serena_att_up;break;
                case PTY_A1_SIDE:v_gfx2 = spr_serena_att_down;break;
                case PTY_A1_DOWN:v_gfx2 = spr_serena_att_up;break;
            }
        }
        
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
        }
        
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*4){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;
                }
            }
        }
                   
        if(v_timer > 3*5){
            v_act = "idle";exit;}
    break;
    case James:
        if(floor(v_timer) == 1){
            switch(v_attType){
                case PTY_A1_IDLE:v_gfx2 = spr_james_att;break;
                case PTY_A1_UP:v_gfx2 = spr_james_att_up;break;
                case PTY_A1_SIDE:v_gfx2 = spr_james_att;break;
                case PTY_A1_DOWN:v_gfx2 = spr_james_att_up;break;
            }
        }
        
        if(floor(v_timer) == 3*3){
            scr_player_attack_create(x,y);
            
        }
        
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
        
        // Attack interrupt to attack again
        if(v_timer >= 3*4){
            if(ctrl_press(BTN_ATTACK)){
                if(player_attack_init() ){
                    exit;
                }
            }
        }
                    
        if(v_timer > 3*5){
            v_act = "idle";exit;}
    break;
}

gfx[GFX_MAX] = v_gfx2;
