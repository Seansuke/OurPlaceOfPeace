switch(subMenu)
{
    case "Artes Slot":
        tmp_pty = menuSubset[0];//current chosen PARTY member
        tmp_pos = menuPos;//menu positions from 1~8
        tmp_pos += PTY_A1_IDLE - 1;//current selected PARTY ARTES slot, -1 since menu pos from 1~8 and not 0~7
        if(party_get(tmp_pty,tmp_pos) != "" && party_get(tmp_pty,tmp_pos) != "error")
        {
            tmp_arte = arte_find(party_get(tmp_pty,tmp_pos));
            obj_areaMenu_artes_desc.v_gfx = arte_get(tmp_arte,ARTE_GFX);
            obj_areaMenu_artes_desc.v_dmg = arte_get(tmp_arte,ARTE_DMG);
            obj_areaMenu_artes_desc.v_pow = arte_get(tmp_arte,ARTE_POW);
            obj_areaMenu_artes_desc.v_wait = arte_get(tmp_arte,ARTE_WAIT);
            obj_areaMenu_artes_desc.v_cost = arte_get(tmp_arte,ARTE_COST);
            obj_areaMenu_artes_desc.v_uses = arte_get(tmp_arte,ARTE_USES);
            obj_areaMenu_artes_desc.v_desc = arte_get(tmp_arte,ARTE_DESC);
        }
        else
        {
            obj_areaMenu_artes_desc.v_gfx = spr_menu_artes;
            obj_areaMenu_artes_desc.v_dmg = 0;
            obj_areaMenu_artes_desc.v_pow = 0;
            obj_areaMenu_artes_desc.v_wait = 0;
            obj_areaMenu_artes_desc.v_cost = 0;
            obj_areaMenu_artes_desc.v_uses = 0;
            obj_areaMenu_artes_desc.v_desc = "";
        }    
    break;
    case "Artes Slot Select":
        tmp_arte = (menus[menuPos]).v_set;//index in arte array
        obj_areaMenu_artes_desc.v_gfx = arte_get(tmp_arte,ARTE_GFX);
        obj_areaMenu_artes_desc.v_dmg = arte_get(tmp_arte,ARTE_DMG);
        obj_areaMenu_artes_desc.v_pow = arte_get(tmp_arte,ARTE_POW);
        obj_areaMenu_artes_desc.v_wait = arte_get(tmp_arte,ARTE_WAIT);
        obj_areaMenu_artes_desc.v_cost = arte_get(tmp_arte,ARTE_COST);
        obj_areaMenu_artes_desc.v_uses = arte_get(tmp_arte,ARTE_USES);
        obj_areaMenu_artes_desc.v_desc = arte_get(tmp_arte,ARTE_DESC);
    break;
    case "Skill Arte":
        tmp_arte = (menus[menuPos]).v_set;//index in arte array
        obj_areaMenu_artes_desc.v_gfx = arte_get(tmp_arte,ARTE_GFX);
        obj_areaMenu_artes_desc.v_dmg = arte_get(tmp_arte,ARTE_DMG);
        obj_areaMenu_artes_desc.v_pow = arte_get(tmp_arte,ARTE_POW);
        obj_areaMenu_artes_desc.v_wait = arte_get(tmp_arte,ARTE_WAIT);
        obj_areaMenu_artes_desc.v_cost = arte_get(tmp_arte,ARTE_COST);
        obj_areaMenu_artes_desc.v_uses = arte_get(tmp_arte,ARTE_USES);
        obj_areaMenu_artes_desc.v_desc = arte_get(tmp_arte,ARTE_DESC);
    break;
    case "Skill Upgrade":
        tmp_arte = (menus[menuPos]).v_set;//index in arte array
        tmp_name = arte_get(tmp_arte,ARTE_NAME);
        obj_areaMenu_artes_desc.v_name = arte_get(tmp_arte,ARTE_NAME);
        switch(menuPos)
        {
            case 1://dmg
                if(tmp_name == "Medic" || tmp_name == "Restore")
                    {obj_areaMenu_artes_desc.v_desc = "Increase HP given to allies";}
                if(tmp_name == "Might" || tmp_name == "Endure")
                    {obj_areaMenu_artes_desc.v_desc = "Increase potency of buff";}
                else
                    {obj_areaMenu_artes_desc.v_desc = "Increase damage to foes";}
            break;
            case 2://power
                if(tmp_name == "Medic" || tmp_name == "Restore")
                    {obj_areaMenu_artes_desc.v_desc = "Increase speed of rolling HP";}
                if(tmp_name == "Might" || tmp_name == "Endure")
                    {obj_areaMenu_artes_desc.v_desc = "Increase duration of buffs";}
                else
                    {obj_areaMenu_artes_desc.v_desc = "Push opponents farther away";}
            break;
            case 3://wait
                obj_areaMenu_artes_desc.v_desc = "Decrease time needed to execute skill";
            break;
            case 4://cost
                obj_areaMenu_artes_desc.v_desc = "Decrease SP usage to execute skill";
            break;
        }
    break;
    case "Stats":
        for(tmp_i = 1;tmp_i < PLY_MAX;tmp_i += 1) {
            obj_areaMenu_stats_desc.st[tmp_i] = player_get(menuPos - 1,tmp_i);
        }
    break;
}
