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
        var i = 1;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_party); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_stats); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_player); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,AreaMenuOptions); i++;
        menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_battle);i++;
        i--; menus[0] = i;
    break;
    case "Artes Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 1;
        for(i = 1;i <= 3;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        i--; menus[0] = i;
    break;
    case "Artes Slot":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 1;
        for(i = 1;i <= 8;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 140 + 40*i,obj_areaMenu_artes_set);
            (menus[i]).v_set = PTY_A1_IDLE + i - 1;
            (menus[i]).v_plyr = menuSubset[0];
        }
        i--; menus[0] = i;
    break;
    case "Artes Slot Select":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        menus[0] = 0;
        tmp_char = party_get(menuSubset[0],PTY_PLAYER);//party member 1~3 change the party member to the player member 0~max
        tmp_cap = 0;
        for(tmp_arte = 0;arte_get(tmp_arte,ARTE_NAME) != "";tmp_arte += 1)
        {
            if(arte_get(tmp_arte,ARTE_PLAYER) == tmp_char && player_get(tmp_char, PLY_LVL) >= arte_get(tmp_arte,ARTE_LVL))
            {
                menus[0] += 1;
                tmp_cap = menus[0];//current position in menu
                menus[tmp_cap] = instance_create(
                                    getMenuXPosition(),view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_artes_select);
                (menus[tmp_cap]).v_set = tmp_arte;
            }
        }
    break;
    case "Skill Player":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        var i = 1;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i - 1;
        }
        i--; menus[0] = i;
    break;
    case "Skill Arte":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        menus[0] = 0;
        tmp_char = menuSubset[0] - 1//player member, WAS 1~3, NOW 0~2
        tmp_cap = 0;
        for(tmp_arte = 0;arte_get(tmp_arte,ARTE_NAME) != "";tmp_arte += 1)
        {
            if(arte_get(tmp_arte,ARTE_PLAYER) == tmp_char && player_get(tmp_char, PLY_LVL) >= arte_get(tmp_arte,ARTE_LVL))
            {
                menus[0] += 1;
                tmp_cap = menus[0];//current position in menu
                menus[tmp_cap] = instance_create(
                                    getMenuXPosition(),view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_skills_arte);
                (menus[tmp_cap]).v_set = tmp_arte;
            }
        }
    break;
    case "Skill Upgrade":
        with(obj_areaMenu_artes_desc) {
            visible = true;
        }
        arteId = menuSubset[1];
        menus[0] = 4;
        i = 0;
        i += 1;
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
    break;
    case "Party":
        menus[0] = MAX_PLAYERS;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_desc = "Switch who?";
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    
    case "Party Swap":
        menus[0] = MAX_PLAYERS;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        tmp_player = party_get(menuSubset[0],PTY_PLAYER);
        with(obj_areaMenu_artes_desc) {
            visible = true;
            v_desc = "Switch " + str(name_get(other.tmp_player)) + " with whom?";;
        }
        with(obj_areaMenu_stats_desc) {
            visible = true;
        }
    break;
    case "Stats":
        menus[0] = MAX_PLAYERS;
        i = 1;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(getMenuXPosition(),view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i - 1;
        }
    break;
    case "Player":
        menus[0] = 3;//can only have a party of 3
        for(i = 1;i <= 3;i += 1) {
            menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40 * i, obj_areaMenu_player_human);
            (menus[i]).v_set = i;
        }
    break;
    case "Settings":
        // TODO - execute the action from the menu instead.  Revamp this.
        // TODO - Make menu page scrolling happen when some menu items are offscreen.
        i = 1;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,CameraZoomCycle); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,obj_areaMenu_monster_level); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,SaveGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,LoadGameMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,GoToTitleMenu); 
        i++;
        menus[i] = instance_create(getMenuXPosition(), view_yview[0] + 100 + 40*i,QuitGameMenu); 
        i++;
        i--; menus[0] = i;
    break;
}

menu_wrapMenuPos();

