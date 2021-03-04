if(global.menu == true) {
    exit;
}

//center camera
camx = room_width;
cam2x = 0;

// Smart camera
for(var ctrlId = 0;ctrlId < PTY_AMNT;ctrlId += 1) {
    if(instance_exists(ids[ctrlId])) {
        if(ctrl_get(ctrlId, BTN_TYPE) != BTN_TYPE_NONE) {
            if((ids[ctrlId]).x < camx) {
                camx = (ids[ctrlId]).x;
            }
            if((ids[ctrlId]).x > cam2x) {
                cam2x = (ids[ctrlId]).x;
            }
        }
    }
}
x = (camx + cam2x) / 2;

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
for(var idIndex = 0;idIndex < PTY_AMNT;idIndex += 1) {
    me = ids[idIndex];
    
    if(!instance_exists(me) || me == -1) {
        continue;
    }
    
    var i = me.combatId;

    gui[i].combatId = me.combatId;
    
    v_x = view_xview[0] + guiGap + i * maxPlayerGuiWidth;
    v_y = view_yview[0] + view_hview[0] - 64;

    gui[i].visible = true;
    gui[i].face = (me).gfx[GFX_FACE];
    gui[i].v_x = v_x;
    gui[i].v_y = v_y;
    gui[i].maxPlayerHpGuiWidth = maxPlayerHpGuiWidth;
    gui[i].hpBarHeight = hpBarHeight;
    gui[i].rollHpBarLength = (me).rollHP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth;
    gui[i].hpBarLength = (me).HP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth;
    gui[i].hpText = string(floor((me).HP)) + "/" + string(floor((me).stat[PLY_HP]));
    gui[i].SP = (me).SP;
    gui[i].maxSP = (me).stat[PLY_SP];
    
    //draw bonuses
    var buffText = "";
    if(floor((me).bonusATT) != 0) {
        buffText += "ATT:" + string(floor((me).bonusATT)) + " ";
    }
    if(floor((me).bonusDEF) != 0) {
        buffText += "DF:" + string(floor((me).bonusDEF)) + " ";
    }
    if(floor((me).bonusSPD) != 0) {
        buffText += "SPD:" + string(floor((me).bonusSPD)) + " ";
    }
    
    gui[i].buffText = buffText;
    gui[i].targetVisible = false;

    var allyTargetCombatId = (ids[i]).v_ally_target;

    if(allyTargetCombatId >= 0 && allyTargetCombatId < PTY_AMNT) {
        var allyTargetInstanceId = ids[allyTargetCombatId];
        if(instance_exists(allyTargetInstanceId)) {
            gui[i].targetVisible = true;
            gui[i].iconTargetX = view_xview[0] + guiGap 
                + allyTargetCombatId * maxPlayerGuiWidth;
            gui[i].targetX = (allyTargetInstanceId).x;
            gui[i].targetY = (allyTargetInstanceId).y + 24;
        }
    }
 
   
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

    room = rm_area_outskirts;
    room_set_persistent(rm_area_outskirts, false);
    audio_stop_sound(AccionBgm);
}
