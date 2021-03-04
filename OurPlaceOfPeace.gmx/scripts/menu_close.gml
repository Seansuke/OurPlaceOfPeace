
global.menu = false;
with(obj_controls){instance_destroy();}
with(TouchControlsObject){instance_destroy();}
with(obj_areaMenu){instance_destroy();}
with(obj_areaMenu_artes_desc){instance_destroy();}
with(obj_areaMenu_stats_desc){instance_destroy();}
instance_activate_all();

with(PlayerObject) {
    if(ds_exists(lastMenuPos, ds_type_map)) {
        ds_map_destroy(lastMenuPos);
    }
}

with(obj_player) {
    // In the event players were swapped, change the playerIds.
    for(var combatIdCheck = 0; combatIdCheck < PTY_AMNT; combatIdCheck++) {
        if(playerId == global.combatParty[CMBT_PARTY1, combatIdCheck]) {
            combatId = combatIdCheck;
        }
    }
}

with(obj_areaPlayer) {
    // In the event players were swapped, change the playerIds.
    for(var combatIdCheck = 0; combatIdCheck < PTY_AMNT; combatIdCheck++) {
        playerId = global.combatParty[CMBT_PARTY1, combatIdCheck];
    }
}

ctrl_unpress(BTN_MENU);

