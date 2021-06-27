if(global.menu == true) {
    exit;
}

//center camera
camx = room_width;
cam2x = 0;

// Smart camera
for(var index = 0;index < PTY_AMNT;index += 1) {
    var playerObject = ids[index];
    if(playerObject != -1 && instance_exists(playerObject)) {
        if(ctrl_get(playerObject.combatId, BTN_TYPE) != BTN_TYPE_NONE 
                && (playerObject).HP > 0) {
            if((playerObject).x < camx) {
                camx = (playerObject).x;
            }
            if((playerObject).x > cam2x) {
                cam2x = (playerObject).x;
            }
        }
    }
}
var nearestAliveFoe = instance_nearest(x, y, obj_mon);
if(instance_exists(nearestAliveFoe)) {
    if((nearestAliveFoe).HP > 0
            && distance_to_object(nearestAliveFoe) < 320) 
    {
        if((nearestAliveFoe).x < camx) {
            camx = (nearestAliveFoe).x;
        }
        if((nearestAliveFoe).x > cam2x) {
            cam2x = (nearestAliveFoe).x;
        }
    }
}

// Move camera naturally.
if(abs(x - (camx + cam2x)/2) > 125) {
    move_towards_point((camx + cam2x) / 2, y, 15);
}
else if(abs(x - (camx + cam2x)/2) > 15) {
    move_towards_point((camx + cam2x) / 2, y, 8);
}
else {
    speed = 0;
}

//monsters dead?
for(var i = 0;i < PTY_AMNT;i++) {
    if(instance_exists(mon[i]) == false) {
        mon[i] = -1;
    }
}

// Setup GUI variables.
var guiGap = 8;
var maxPlayerGuiWidth = view_wview[0] / PTY_AMNT;
var maxPlayerHpGuiWidth = maxPlayerGuiWidth - 34;
var hpBarHeight = 10;

// Gui is in combatId order, but ids is in player generation order.  Could be different.
var areAllPlayersDowned = true;
for(var idIndex = 0;idIndex < PTY_AMNT; idIndex += 1) {
    var player = ids[idIndex];
    
    if(!instance_exists(player) || player == -1) {
        continue;
    }
    
    if((player).HP > 0) {
        areAllPlayersDowned = false;
    }
    
    var combatId = (player).combatId;

    gui[combatId].combatId = combatId;
    
    v_x = view_xview[0] + guiGap + combatId * maxPlayerGuiWidth;
    v_y = view_yview[0] + view_hview[0] - 64;

    gui[combatId].visible = true;
    gui[combatId].face = (player).gfx[GFX_FACE];
    gui[combatId].v_x = v_x;
    gui[combatId].v_y = v_y;
    gui[combatId].maxPlayerHpGuiWidth = maxPlayerHpGuiWidth;
    gui[combatId].hpBarHeight = hpBarHeight;
    gui[combatId].rollHpBarLength = 
        (player).rollHP / (player).stat[PLY_HP] * maxPlayerHpGuiWidth;
    gui[combatId].hpBarLength = 
        (player).HP / (player).stat[PLY_HP] * maxPlayerHpGuiWidth;
    gui[combatId].hpText = 
        string(floor((player).HP)) + "/" + string(floor((player).stat[PLY_HP]));
    gui[combatId].SP = (player).SP;
    gui[combatId].maxSP = (player).stat[PLY_SP];
    
    //draw bonuses
    var buffText = "";
    if(floor((player).bonusATT) != 0) {
        buffText += "ATT:" + string(floor((player).bonusATT)) + " ";
    }
    if(floor((player).bonusDEF) != 0) {
        buffText += "DF:" + string(floor((player).bonusDEF)) + " ";
    }
    if(floor((player).bonusSPD) != 0) {
        buffText += "SPD:" + string(floor((player).bonusSPD)) + " ";
    }
    
    gui[combatId].buffText = buffText;
    gui[combatId].targetVisible = false;

    var allyTargetCombatId = (player).v_ally_target;

    // Only draw the icon if the player is targeting.
    if(allyTargetCombatId >= 0 && allyTargetCombatId < PTY_AMNT) {
        
        // Check all allies to find the specific instance
        for(var innerIdIndex = 0; innerIdIndex < PTY_AMNT; innerIdIndex++) {
            var allyTargetInstanceId = ids[innerIdIndex];
            
            // Find the Ally instance to put an icon on them
            if(allyTargetInstanceId < 0 || !instance_exists(allyTargetInstanceId)
                    || (allyTargetInstanceId).combatId != allyTargetCombatId) {
                continue;
            }
            
            gui[combatId].targetVisible = true;
            gui[combatId].targetX = (allyTargetInstanceId).x;
            gui[combatId].targetY = (allyTargetInstanceId).y + 24;
            gui[combatId].iconTargetX = gui[allyTargetCombatId].v_x;
        }
    }   
}

 
//battle over
if(areAllPlayersDowned) {
    if(v_timer == -1) {
        v_timer = 100;
    }
    v_timer -= 1;
    if(v_timer == 99) {
        animate_text("DEFEATED!",x,y);
    }
    if(v_timer > 1) {
        exit;
    }
    
    for(var combatId = 0;combatId < PTY_AMNT;combatId += 1) {
        global.monFight[combatId] = MAX_MONSTERS;
        var playerInstanceId = ids[combatId];
        if(!instance_exists(playerInstanceId) || playerInstanceId == -1) { 
            continue;
        }
        var playerId = playerInstanceId.playerId;
        var rollHP = floor(playerInstanceId.rollHP);
        var maxHP = playerInstanceId.stat[PLY_HP];
        party_set(playerId, PTY_HP, min(rollHP, maxHP));
    }

    room = global.currentMap;
    audio_stop_sound(AccionBgm);
    exit;
}

//battle over
if(mon[0] == -1 && mon[1] == -1 && mon[2] == -1 && mon[3] == -1) {
    if(v_timer == -1) {
        v_timer = 100;
    }
    v_timer -= 1;
    if(v_timer == 99) {
        animate_text("VICTORY!",0,-100);
    }
    if(v_timer > 1) {
        exit;
    }
    
    for(var combatId = 0;combatId < PTY_AMNT;combatId += 1) {
        global.monFight[combatId] = MAX_MONSTERS;
        var playerInstanceId = ids[combatId];
        if(!instance_exists(playerInstanceId) || playerInstanceId == -1) { 
            continue;
        }
        var playerId = playerInstanceId.playerId;
        var rollHP = floor(playerInstanceId.rollHP);
        var maxHP = playerInstanceId.stat[PLY_HP];
        party_set(playerId, PTY_HP, min(rollHP, maxHP));
    }

    room = global.currentMap;
    audio_stop_sound(AccionBgm);
    exit;
}
