
// Only attack at a certain speed.
var totalAttackSubImages = 5;
var framesPerSubimage = 3;

// Faster characters have quicker attacks, slower characters have slower attacks.
if(getMoveSpeed() < 8) {
    framesPerSubimage++;
}
else if(getMoveSpeed() > 13) {
    framesPerSubimage--;
}

// subImages move at a speed relative to the attack.
var subImageSpeed = 1 / framesPerSubimage;

// All melee fighters create the hitbox on the 3/5 mark on their total frame.
var attackCreationFrame = floor(framesPerSubimage * totalAttackSubImages * 3/5);
var movementStartFrame = floor(framesPerSubimage * totalAttackSubImages * 1/5);
var movementEndFrame = floor(framesPerSubimage * totalAttackSubImages * 4/5);
var interruptFrame = floor(framesPerSubimage * totalAttackSubImages * 4/5);
var completionFrame = floor(framesPerSubimage * totalAttackSubImages);

// All range fighters create the hitbox on one of the last subimages
if(playerId == AD || playerId == Dan || playerId == Taliko) {
    attackCreationFrame = floor(framesPerSubimage * totalAttackSubImages * 4/5);
}

// Define action on the first frame
if(floor(v_timer) == 0){

    // Store the attack type as the button held
    if(v_v == BTN_UP) {
        v_attType = PTY_A1_UP;
        v_gfx = GFX_ATTACK_UP;
    }
    else if(v_v == BTN_DOWN) {
        v_attType = PTY_A1_DOWN;
        v_gfx = GFX_ATTACK_DOWN;
    }
    else if(v_h == BTN_RIGHT) {
        v_attType = PTY_A1_SIDE;
        v_dir = DIR_RIGHT;
        v_gfx = GFX_ATTACK_SIDE;
    }
    else if(v_h == BTN_LEFT) {
        v_attType = PTY_A1_SIDE;
        v_dir = DIR_LEFT;
        v_gfx = GFX_ATTACK_SIDE;
    }
    else {
        v_attType = PTY_A1_IDLE;
        v_gfx = GFX_ATTACK;
    }
}

// Hold to charge attack
if(floor(v_timer) < movementStartFrame && ctrl_btn(BTN_ATTACK)){
    // Charge can be held and interrupt the attack flow
    v_charge = min(v_charge + 1, v_chargeMax);
    exit;
}

// The timer continues    
v_timer += 1;

// Only increase the subimage index by the speed we calculated.
v_img += subImageSpeed;


if(floor(v_timer) == attackCreationFrame){
    scr_player_attack_create(x,y);
}

// Falling attacks are faster
if(v_attType == PTY_A1_DOWN) {
    if(place_clear(x,y + getMoveSpeed()) == true) {
        y += getMoveSpeed();
    }
    else if(place_clear(x,y + getMoveSpeed() / 2)) {
        y += getMoveSpeed() / 2;
    }
}

// Move while attacking during certain frames.
if(floor(v_timer) >= movementStartFrame && floor(v_timer) <= movementEndFrame) {
    // Movement during attack
    switch(v_attType){
        case PTY_A1_SIDE:
            if(place_clear(x + getMoveSpeed() / 2 * v_dir,y) == true){
                x += getMoveSpeed() / 2 * v_dir;
            }
        break;
        case PTY_A1_DOWN:
            if(place_clear(x - getMoveSpeed() * v_dir,y) == true
                && place_clear(x,y + getMoveSpeed() / 2) == false){
                x -= getMoveSpeed() * v_dir;
            }
        break;
        case PTY_A1_UP:
            if(place_clear(x,y - getMoveSpeed()) == true){
                y -= getMoveSpeed();
            }
        break;
    }
}

// Attack interrupt to attack again
if(v_timer >= interruptFrame){
    if(ctrl_press(BTN_ATTACK)){
        v_charge = 0;
        if(player_attack_init() ){
            exit;
        }
    }
}

if(v_timer > completionFrame) {
    v_charge = 0;
    v_act = "idle";
    exit;
}

