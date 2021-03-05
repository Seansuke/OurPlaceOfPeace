switch(subMenu) {
    case "Main":
        switch(menuPos) {
            case 0://artes
                menu_call("Artes Player");
            break;
            case 1://skill
                menu_call("Skill Player");
            break;
            case 2://party
                menu_call("Party");
            break;
            case 3://settings
                menu_call("Settings");
            break;
            case 4://battle
                if(room == rm_arena_outskirts) {
                    exit;
                }
                room_set_persistent(room, true);
                global.menu = false;
                global.monFight[0] = round(random(MAX_MONSTERS));
                global.monFight[1] = round(random(MAX_MONSTERS));
                global.monFight[2] = round(random(MAX_MONSTERS));
                global.monFight[3] = round(random(MAX_MONSTERS));
                global.areaPlayerX = obj_areaPlayer.x;
                global.areaPlayerY = obj_areaPlayer.y;
                global.currentMap = room;
                room = rm_arena_outskirts;
            break;
        }
    break;
    case "Artes Player":
        menuSubset[0] = menuPos;//TECHINCALLY party player selected for slot menu
        with(menus[menuPos]) {
            event_user(1);
        }
    break;
    case "Artes Slot":
        menuSubset[1] = menuPos;//TECHINCALLY party slot position
        menu_call("Artes Slot Select");
    break;
    case "Artes Slot Select":
        tmp_arte = arte_get((menus[menuPos]).v_set,ARTE_NAME);
        party_set(menuSubset[0],menuSubset[1] + PTY_A1_IDLE,tmp_arte);//change party member's arte
        menu_call("Artes Slot");
    break;
    case "Skill Player":
        menuSubset[0] = menuPos;//certain player member selected+1
        menu_call("Skill Arte");
    break;
    case "Skill Arte":
        menuSubset[1] = (menus[menuPos]).v_set;//registers the ARTE ID NUM
        menu_call("Skill Upgrade");
    break;
    case "Skill Upgrade":
        tmp_arte = menuSubset[1];
        tmp_slct = (menus[menuPos]).v_set;
        tmp_cost = arte_upgrade_cost(arteId,tmp_slct);
        switch(tmp_slct) {
            case ARTE_DMG:tmp_add = 0.02;break;
            case ARTE_POW:tmp_add = 0.02;break;
            case ARTE_WAIT:tmp_add = -1;break;
            case ARTE_COST:tmp_add = -10;break;
        }
        if(arte_get(tmp_arte,ARTE_USES) >= tmp_cost && tmp_cost != -1) {
            global.arte[tmp_arte,ARTE_USES] -= tmp_cost;
            global.arte[tmp_arte,tmp_slct] += tmp_add;
            global.arte[tmp_arte,ARTE_POINTS] += 10;
        }
        menu_call("Skill Upgrade");//reset all artes information
    break;
    case "Party":
        menuSubset[0] = menuPos;//certain party member selected
        combatPartyIdSelected = menuPos;
        menu_call("Party Swap");
    break;
    case "Party Swap":
        if(instance_exists(obj_camera) == true) {obj_camera.fixPlayers = true;}
        menuSubset[1] = menuPos;//certain party member selected
        combatParty_swap(combatPartyIdSelected, menuPos);
        menu_call("Party");
    break;
    case "Settings":
        with(menus[menuPos]) {
            event_user(1);
        }
    break;
}
