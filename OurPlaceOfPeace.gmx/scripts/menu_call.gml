// Save the last known menu position before switching
ds_map_replace(lastMenuPos, subMenu, menuPos);

subMenu = argument0;
with(obj_areaMenu){instance_destroy();}

// Reset the menu position to the last known value.
if(!ds_map_exists(lastMenuPos, subMenu)) {
    ds_map_add(lastMenuPos, subMenu, 1);
}
else {
    menuPos = ds_map_find_value(lastMenuPos, subMenu);
}

switch(subMenu)
{
    case "Main":
        with(obj_areaMenu_artes_desc){visible = false;}
        with(obj_areaMenu_stats_desc){visible = false;}
        var i = 0;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_party); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,AreaMenuOptions); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_battle);i++;
        maxMenu = i;
    break;
    case "Artes Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 0;
        for(i = 0;i < MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        maxMenu = i;
    break;
    case "Artes Slot":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 0;
        for(i = 0;i < 8;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 140 + 40*i,obj_areaMenu_artes_set);
            (menus[i]).v_set = PTY_A1_IDLE + i;
            (menus[i]).combatId = menuSubset[0];
        }
        maxMenu = i;
    break;
    case "Artes Slot Select":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        tmp_char = menuSubset[0];
        tmp_cap = 0;
        maxMenu = 0;
        for(tmp_arte = 0;tmp_arte < global.maxArte;tmp_arte += 1)
        {
            if(arte_get(tmp_arte,ARTE_PLAYER) == tmp_char && global.maxPlayerLevel >= arte_get(tmp_arte,ARTE_LVL))
            {
                tmp_cap = maxMenu;//current position in menu
                menus[tmp_cap] = instance_create(
                                    getMenuXPosition(),view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_artes_select);
                (menus[tmp_cap]).v_set = tmp_arte;
                maxMenu++;
            }
        }
    break;
    case "Skill Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 0;
        for(i = 0;i < MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i;
        }
        maxMenu = i;
    break;
    case "Skill Arte":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        maxMenu = 0;
        tmp_char = menuSubset[0];//player member
        tmp_cap = 0;
        for(tmp_arte = 0;tmp_arte < global.maxArte;tmp_arte += 1)
        {
            if(arte_get(tmp_arte,ARTE_PLAYER) == tmp_char && global.maxPlayerLevel >= arte_get(tmp_arte,ARTE_LVL))
            {
                tmp_cap = maxMenu;
                menus[tmp_cap] = instance_create(
                                    getMenuXPosition(),view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_skills_arte);
                (menus[tmp_cap]).v_set = tmp_arte;
                maxMenu++;
            }
        }
    break;
    case "Skill Upgrade":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        arteId = menuSubset[1];
        i = 0;
        obj_areaMenu_artes_desc.visible = true;
        obj_areaMenu_artes_desc.v_uses = arte_get(arteId, ARTE_USES);
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).arteId = arteId;
        (menus[i]).v_set = ARTE_DMG;
        (menus[i]).v_text = "Damage: " + str(arte_get(arteId, ARTE_DMG));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_DMG));
        i += 1;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).arteId = arteId;
        (menus[i]).v_set = ARTE_POW;
        (menus[i]).v_text = "Power: " + str(arte_get(arteId, ARTE_POW));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_POW));
        i += 1;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).arteId = arteId;
        (menus[i]).v_set = ARTE_WAIT;
        (menus[i]).v_text = "Wait: " + str(arte_get(arteId, ARTE_WAIT));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_WAIT));
        i += 1;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).arteId = arteId;
        (menus[i]).v_set = ARTE_COST;
        (menus[i]).v_text = "Cost: " + str(arte_get(arteId, ARTE_COST));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_COST));
        i += 1;
        
        maxMenu = i;
    break;
    case "Party":
        maxMenu = PTY_AMNT;
        for(i = 0;i < PTY_AMNT;i += 1) {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,CombatPlayerMenu);
            (menus[i]).v_set = i;
            (menus[i]).combatParty = CMBT_PARTY1;
            (menus[i]).positionInMenu = i;
        }
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_desc = "Switch who? #" 
                + "Level: " + str(global.playerLevel) + " / " 
                + str(global.maxPlayerLevel) + "#"
                + "Experience: " + str(global.experience) + " / "
                + str(nextLevelAt()) + " #"
                + "Next Level In: " + str(nextLevelAt() - global.experience);
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    
    case "Party Swap":
        maxMenu = MAX_PLAYERS;
        for(i = 0;i < MAX_PLAYERS;i += 1){
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,CombatPlayerMenu);
            (menus[i]).v_set = i;
            (menus[i]).combatParty = CMBT_RESERVE;
            (menus[i]).positionInMenu = i;
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
            v_desc = "Switch " + str(name_get(other.tmp_player)) + " with whom?";;
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    case "Stats":
        maxMenu = MAX_PLAYERS;
        for(i = 0;i < MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i;
        }
    break;
    case "Settings":
        i = 0;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,CameraZoomCycle); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,obj_areaMenu_monster_level); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,PlayerLevelMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,MusicLevelMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,SaveGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,LoadGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,GoToTitleMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,QuitGameMenu); 
        i++;
        maxMenu = i;
    break;
}

menu_wrapMenuPos();

