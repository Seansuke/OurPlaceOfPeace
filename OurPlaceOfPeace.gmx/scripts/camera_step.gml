if(global.menu == true) {
    exit;
}

//center camera
camx = room_width;
cam2x = 0;

for(var ctrlId = 0;ctrlId < PTY_AMNT;ctrlId += 1) {
    if(ids[ctrlId] != -1) {
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
    
    for(var partyNum = 0;partyNum < PTY_AMNT;partyNum += 1) {
        global.monFight[partyNum] = MAX_MONSTERS;
        party_set(partyNum, PTY_HP, (ids[partyNum]).rollHP);
    }

    room = rm_area_outskirts;
    room_set_persistent(rm_area_outskirts, false);
    audio_stop_sound(AccionBgm);
}
