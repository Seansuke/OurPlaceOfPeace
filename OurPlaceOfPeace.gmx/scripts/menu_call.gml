#define menu_call
/// menu_call(submenuName);

subMenu = menu_clear(argument0);

switch(subMenu)
{
    case "Main":
        with(obj_areaMenu_artes_desc){visible = false;}
        with(obj_areaMenu_stats_desc){visible = false;}
        var i = 0;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,BackMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,AreaMenuTrailMix); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,obj_areaMenu_artes); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,obj_areaMenu_skills); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,obj_areaMenu_party); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,AreaMenuOptions); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,obj_areaMenu_battle);
        i++;
        maxMenu = i;
    break;
    case "Trail Mix":            
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_desc = "";
        }
        var i = 0;
        var itemId = 0;
    
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i, BackMenu); 
        i++;
    
        for(var itemId = 0; itemId < array_length_1d(global.itemCount); itemId++) {
            if(get_item_count(itemId) > 0) {
                menus[i] = instance_create(getMenuXPosition(),
                    view_yview[0] + 100 + 40*i, SelectItemMenu); 
                (menus[i]).itemId = itemId;
                i++;
            }
        }
        
        maxMenu = i;
    break;
    case "Artes Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        for(var i = 0; i < PTY_AMNT; i++) {
            if(combat_get(CMBT_PARTY1, i) == -1) {
                continue;
            }
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,
                obj_areaMenu_artes_player);
            (menus[maxMenu]).v_set = combat_get(CMBT_PARTY1, i);
            (menus[maxMenu]).playerId = combat_get(CMBT_PARTY1, i);
            (menus[maxMenu]).combatId = i;
            (menus[maxMenu]).combatPartyType = CMBT_PARTY1;
            (menus[maxMenu]).combatPartyIndex = i;
            maxMenu++;
        }
        for(var i = 0; i < MAX_PLAYERS; i++) {
            if(combat_get(CMBT_RESERVE, i) == -1) {
                continue;
            }
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,
                obj_areaMenu_artes_player);
            (menus[maxMenu]).v_set = combat_get(CMBT_RESERVE, i);
            (menus[maxMenu]).playerId = combat_get(CMBT_RESERVE, i);
            (menus[maxMenu]).combatId = -1;
            (menus[maxMenu]).combatPartyType = CMBT_RESERVE;
            (menus[maxMenu]).combatPartyIndex = i;
            maxMenu++;
        }
    break;
    case "Artes Slot Select":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        tmp_char = menuSubset[0];
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        for(tmp_arte = 0;tmp_arte < global.maxArte;tmp_arte += 1)
        {
            if(arte_get_upgraded(tmp_arte,ARTE_PLAYER) == tmp_char 
                && global.maxPlayerLevel >= arte_get_upgraded(tmp_arte,ARTE_LVL)
            )
            {
                menus[maxMenu] = instance_create(
                    getMenuXPosition(),view_yview[0] + 100 + 40*maxMenu,
                    obj_areaMenu_artes_select);
                (menus[maxMenu]).v_set = tmp_arte;
                maxMenu++;
            }
        }
    break;
    case "Skill Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        for(var i = 0; i < PTY_AMNT; i++) {
            if(combat_get(CMBT_PARTY1, i) == -1) {
                continue;
            }
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,
                obj_areaMenu_skills_player);
            (menus[maxMenu]).v_set = combat_get(CMBT_PARTY1, i);
            (menus[maxMenu]).playerId = combat_get(CMBT_PARTY1, i);
            (menus[maxMenu]).combatId = i;
            (menus[maxMenu]).combatPartyType = CMBT_PARTY1;
            (menus[maxMenu]).combatPartyIndex = i;
            maxMenu++;
        }
        for(var i = 0; i < MAX_PLAYERS; i++) {
            if(combat_get(CMBT_RESERVE, i) == -1) {
                continue;
            }
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,
                obj_areaMenu_skills_player);
            (menus[maxMenu]).v_set = combat_get(CMBT_RESERVE, i);
            (menus[maxMenu]).playerId = combat_get(CMBT_RESERVE, i);
            (menus[maxMenu]).combatId = -1;
            (menus[maxMenu]).combatPartyType = CMBT_RESERVE;
            (menus[maxMenu]).combatPartyIndex = i;
            maxMenu++;
        }
    break;
    case "Skill Arte":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        for(tmp_arte = 0;tmp_arte < global.maxArte;tmp_arte += 1)
        {
            if(arte_get_upgraded(tmp_arte,ARTE_PLAYER) == playerIdSelected 
                && global.maxPlayerLevel >= arte_get_upgraded(tmp_arte,ARTE_LVL)
            )
            {
                menus[maxMenu] = instance_create(
                    getMenuXPosition(),view_yview[0] + 100 + 40*maxMenu,
                    obj_areaMenu_skills_arte);
                (menus[maxMenu]).v_set = tmp_arte;
                (menus[maxMenu]).arteId = tmp_arte;
                (menus[maxMenu]).playerId = playerIdSelected;
                maxMenu++;
            }
        }
    break;
    case "Skill Upgrade":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        arteId = selectedArteId;
        obj_areaMenu_artes_desc.visible = true;
        obj_areaMenu_artes_desc.v_uses = upgrade_get(arteId, ARTE_USES);
        
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        (menus[maxMenu]).arteId = 0;
        (menus[maxMenu]).v_set = ARTE_PLAYER;
        maxMenu++;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_DMG;
        (menus[maxMenu]).v_text = "Damage: " 
            + str(upgrade_get(arteId, ARTE_DMG)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_DMG)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_DMG));
        maxMenu++;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_POW;
        (menus[maxMenu]).v_text = "Power: " 
            + str(upgrade_get(arteId, ARTE_POW)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_POW)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_POW));
        maxMenu++;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_WAIT;
        (menus[maxMenu]).v_text = "Wait: " 
            + str(upgrade_get(arteId, ARTE_WAIT)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_WAIT)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_WAIT));
        maxMenu += 1;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_COST;
        (menus[maxMenu]).v_text = "Cost: " 
            + str(upgrade_get(arteId, ARTE_COST)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_COST)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_COST));
        maxMenu += 1;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_DURATION;
        (menus[maxMenu]).v_text = "Duration: " 
            + str(upgrade_get(arteId, ARTE_DURATION)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_DURATION)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_DURATION));
        maxMenu += 1;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,obj_areaMenu_skills_upgrade);
        (menus[maxMenu]).arteId = arteId;
        (menus[maxMenu]).v_set = ARTE_POST_WAIT;
        (menus[maxMenu]).v_text = "After Wait: " 
            + str(upgrade_get(arteId, ARTE_POST_WAIT)) 
            + "/5 (" + str(arte_get_upgraded(arteId, ARTE_POST_WAIT)) + ")";
        (menus[maxMenu]).v_text2 = "Uses Needed: " 
            + str(arte_upgrade_cost(arteId, ARTE_POST_WAIT));
        maxMenu += 1;
    break;
    case "Party":
        maxMenu = 0;
        
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        
        for(i = 0;i < PTY_AMNT;i += 1) {
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,CombatPlayerMenu);
            (menus[maxMenu]).v_set = i;
            (menus[maxMenu]).combatPartyId = i;
            (menus[maxMenu]).combatParty = CMBT_PARTY1;
            (menus[maxMenu]).positionInMenu = maxMenu;
            (menus[maxMenu]).playerId = combat_get(CMBT_PARTY1, i);
            (menus[maxMenu]).maxCombatPartyId = PTY_AMNT;
            maxMenu++;
        }
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_desc = "Switch who? #" 
                + "Level: " + str(global.playerLevel) + " / " 
                + str(global.maxPlayerLevel) + "#"
                + "Experience: " + str(global.experience) + " / "
                + str(nextLevelAt()) + " #"
                + "Next Level In: " 
                + str(nextLevelAt() - global.experience);
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    
    case "Party Swap":
        maxMenu = 0;
        menus[maxMenu] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*maxMenu,BackMenu); 
        maxMenu++;
        
        for(i = 0;i < MAX_PLAYERS;i += 1){
            menus[maxMenu] = instance_create(getMenuXPosition(),
                view_yview[0] + 100 + 40*maxMenu,CombatPlayerSwapInMenu);
            (menus[maxMenu]).v_set = i;
            (menus[maxMenu]).combatPartyId = i;
            (menus[maxMenu]).combatParty = CMBT_RESERVE;
            (menus[maxMenu]).positionInMenu = maxMenu;
            (menus[maxMenu]).playerId = combat_get(CMBT_RESERVE, i);
            (menus[maxMenu]).maxMenuPosition = MAX_PLAYERS;
            maxMenu++;
        }
        tmp_player = menuSubset[0];
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_gfx = spr_menu_artes;
            v_dmg = 0;
            v_pow = 0;
            v_wait = 0;
            v_cost = 0;
            v_uses = 0;
            v_desc = "Switch " + str(name_get(other.playerId)) 
                + " with whom?";;
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    case "Settings":
        i = 0;
        menus[i] = instance_create(getMenuXPosition(),
            view_yview[0] + 100 + 40*i,BackMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(),  
            view_yview[0] + 100 + 40*i,CameraZoomCycle); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,obj_areaMenu_monster_level); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,PlayerLevelMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,MusicLevelMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,FullscreenMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,SaveGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,LoadGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,GoToTitleMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), 
            view_yview[0] + 100 + 40*i,QuitGameMenu); 
        i++;
        maxMenu = i;
    break;
}

menu_wrapMenuPos();


#define menu_call_artes_slot
/// menu_call_artes_slot(selectedPlayerId);
if(argument0 < 0) {
    animate_text("Cannot select empty slot.", x,y);
    exit;
}

subMenu = menu_clear("Artes Slot");

selectedPlayerId = argument0;
menuSubset[0] = selectedPlayerId;

with(obj_areaMenu_artes_desc) {
    visible = true;
}

maxMenu = 0;
menus[maxMenu++] = instance_create(getMenuXPosition(),
    view_yview[0] + 100 + 40*maxMenu,BackMenu); 
for(var i = 0; i < 8; i += 1) {
    menus[maxMenu] = instance_create(getMenuXPosition(),
        view_yview[0] + 140 + 40*maxMenu,obj_areaMenu_artes_set);
    (menus[maxMenu]).v_set = PTY_A1_IDLE + i;
    (menus[maxMenu]).partyArteSlotId = PTY_A1_IDLE + i;
    (menus[maxMenu]).playerId = selectedPlayerId;
    maxMenu++;
}

#define menu_clear
///menu_clear(submenuDestination); 
///Returns new submenu location.

var submenuDestination = argument0;

// Save the last known menu position before switching
ds_map_replace(lastMenuPos, subMenu, menuPos);
with(obj_areaMenu){instance_destroy();}

// Reset the menu position to the last known value.
if(!ds_map_exists(lastMenuPos, submenuDestination)) {
    ds_map_add(lastMenuPos, submenuDestination, 0);
}
else {
    menuPos = ds_map_find_value(lastMenuPos, submenuDestination);
}
maxMenu = 0;
return submenuDestination;