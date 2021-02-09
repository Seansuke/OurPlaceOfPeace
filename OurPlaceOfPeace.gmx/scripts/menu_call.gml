subMenu = argument0;
with(obj_areaMenu){instance_destroy();}
switch(subMenu)
{
    case "Main":
        menus[0] = 6;
        i = 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_artes);
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills);
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_party);
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_stats); 
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_player);
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_battle);
    break;
    case "Artes Player":
        menus[0] = 3;//can only have a party of 3
        for(i = 1;i <= 3;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
    break;
    case "Artes Slot":
        menus[0] = 8;
        for(i = 0;i < 8;i += 1)
        {
            menus[i + 1] = instance_create(view_xview[0] + 20,view_yview[0] + 140 + 40*i,obj_areaMenu_artes_set);
            (menus[i + 1]).v_set = PTY_A1_IDLE + i;
            (menus[i + 1]).v_plyr = menuSubset[0];
        }
    break;
    case "Artes Slot Select":
        menuPos = 1;
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
                                    view_xview[0] + 20,view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_artes_select);
                (menus[tmp_cap]).v_set = tmp_arte;
            }
        }
    break;
    case "Skill Player":
        menuPos = 1;
        menus[0] = MAX_PLAYERS;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i - 1;
        }
    break;
    case "Skill Arte":
        menuPos = 1;
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
                                    view_xview[0] + 20,view_yview[0] + 100 + 40*tmp_cap,
                                    obj_areaMenu_skills_arte);
                (menus[tmp_cap]).v_set = tmp_arte;
            }
        }
    break;
    case "Skill Upgrade":
        arteId = menuSubset[1];
        menus[0] = 4;
        i = 0;
        i += 1;
        obj_areaMenu_artes_desc.v_uses = arte_get(arteId, ARTE_USES);
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).v_set = ARTE_DMG;
        (menus[i]).v_text = "Damage: " + str(arte_get(arteId, ARTE_DMG));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_DMG));
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).v_set = ARTE_POW;
        (menus[i]).v_text = "Power: " + str(arte_get(arteId, ARTE_POW));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_POW));
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).v_set = ARTE_WAIT;
        (menus[i]).v_text = "Wait: " + str(arte_get(arteId, ARTE_WAIT));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_WAIT));
        i += 1;
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_upgrade);
        (menus[i]).v_set = ARTE_COST;
        (menus[i]).v_text = "Cost: " + str(arte_get(arteId, ARTE_COST));
        (menus[i]).v_text2 = "Uses Needed: " + str(arte_upgrade_cost(arteId,ARTE_COST));
    break;
    case "Party":
        menuPos = 1;
        menus[0] = MAX_PLAYERS;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        obj_areaMenu_artes_desc.v_desc = "Switch who?";
    break;
    case "Party Swap":
        menuPos = 1;
        menus[0] = MAX_PLAYERS;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_artes_player);
            (menus[i]).v_set = i;
        }
        tmp_player = party_get(menuSubset[0],PTY_PLAYER);
        obj_areaMenu_artes_desc.v_desc = "Switch " + str(name_get(tmp_player)) + " with whom?";
    break;
    case "Stats":
        menuPos = 1;
        menus[0] = MAX_PLAYERS;
        i = 1;
        for(i = 1;i <= MAX_PLAYERS;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_skills_player);
            (menus[i]).v_set = i - 1;
        }
        menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_monster_level);
        (menus[i]).v_set = i - 1;
    break;
    case "Player":
        menus[0] = 3;//can only have a party of 3
        for(i = 1;i <= 3;i += 1)
        {
            menus[i] = instance_create(view_xview[0] + 20,view_yview[0] + 100 + 40*i,obj_areaMenu_player_human);
            (menus[i]).v_set = i;
        }
    break;
}
