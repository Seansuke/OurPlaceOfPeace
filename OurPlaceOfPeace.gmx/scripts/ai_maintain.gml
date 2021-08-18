// Randomly change targets unless needed
if(instance_exists(aiTarget) && aiTarget != -1) {
    if((aiTarget).HP <= 0) {
        aiTarget = obj_camera.mon[floor(random(PTY_AMNT))];
    }
    else if(random(500) < 1) {
        aiTarget = obj_camera.mon[floor(random(PTY_AMNT))];
    }
}
else {
    aiTarget = obj_camera.mon[floor(random(PTY_AMNT))];
}

var attackRandomly = (v_act == "idle" || v_act == "run") && random(30) < 4;

var isHealer = (playerId == AD || playerId == Taliko);
if(isHealer) {
    if(playerId == AD) {
        v_arteNum = arte_find("Medic");
    }
    else {
        v_arteNum = arte_find("Chill Wounds");
    }

    for(i = 0; i < ARTE_MAX; i++) {
        skill[i] = arte_get_upgraded(v_arteNum,i);
    }
    
    // Special logic for the healer.
    var v_target = -1;
    var v_targetHpRatio = 1;

    // Available?  Time to heal
    if(SP >= skill[ARTE_COST]) {
        if(v_act == "idle" || v_act == "run") {
            for(var targetCombatId = 0; targetCombatId < PTY_AMNT; targetCombatId++) {
                var targetInstanceId = obj_camera.ids[targetCombatId];
                if(! instance_exists(targetInstanceId)) {
                    continue;
                }
                
                var hpRatio = (targetInstanceId).rollHP / (targetInstanceId).stat[PLY_HP];
                if( hpRatio < 0.8 && hpRatio < v_targetHpRatio && hpRatio > 0) {
                    v_target = targetCombatId;
                    v_targetHpRatio = hpRatio;
                }
            }
            if(v_target >= 0) {
                if(v_act != "arte") {
                    v_btn = BTN_ARTES1;
                    SP -= skill[ARTE_COST];
                    v_img = 0;
                    v_timer = 0;
                    v_act = "arte";
                    v_ally_target = v_target;
                    upgrade_add_one(v_arteNum, ARTE_USES);
                    exit;
                }
            }
        }
    }          
}

if(instance_exists(aiTarget)) {
    // closer to target if a fighter, farther if not, and do not bother attacking if so.
    if(playerId == AD || playerId == Dan || playerId == Taliko) {    
        if(abs(x - (aiTarget).x) < 150) {
            attackRandomly = false;
            if(x < aiTarget.x) {
                v_h = BTN_LEFT;
            }
            else {
                v_h = BTN_RIGHT;
            }
        }
        else if(abs(x - (aiTarget).x) > 180) {
            if(x < (aiTarget).x) {
                v_h = BTN_RIGHT;
            }
            else {
                v_h = BTN_LEFT;
            }
        }
    }
    else {    
        if(abs(x - (aiTarget).x - (aiTarget).sprite_width / 2) > 32) {
            attackRandomly = false;
            if(x < (aiTarget).x) {
                v_h = BTN_RIGHT;
            }
            else {
                v_h = BTN_LEFT;
            }
        }
    }
    
    if(attackRandomly) {
        if(SP >= stat[PLY_SP]) {
            press[choose(BTN_ARTES1, BTN_ARTES2, BTN_MAX)] = 1;
            press[choose(BTN_UP, BTN_RIGHT, BTN_LEFT, BTN_DOWN, BTN_MAX)] = 1;
        }
        else {
            press[choose(BTN_ATTACK, BTN_GUARD, BTN_MAX)] = 1;
            press[choose(BTN_UP, BTN_RIGHT, BTN_LEFT, BTN_DOWN, BTN_MAX)] = 1;
        }
    }
    else {
        for(var i = 0; i < BTN_MAX; i++) {
            press[i] = 0;
        }
    }
    
    if((aiTarget).x > x) {
        v_dir = DIR_RIGHT;
    }
    else {
        v_dir = DIR_LEFT;
    }
}
