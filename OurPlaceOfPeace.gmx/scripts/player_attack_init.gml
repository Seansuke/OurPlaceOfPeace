// Require SP to attack
if(SP_REQUIRED_TO_ATTACK) {
    if(SP < 100){
        return false;
    }
    SP -= 100;
}

v_img = 0;
v_timer = 0;
v_act = "attack";

return true;
