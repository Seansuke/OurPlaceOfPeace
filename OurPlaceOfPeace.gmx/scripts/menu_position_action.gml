switch(subMenu)
{
    case "Trail Mix":
        var selectedSlotButton = menus[menuPos];
        if((selectedSlotButton).itemId >= 0) {
            obj_areaMenu_artes_desc.v_desc = get_item_description((selectedSlotButton).itemId);
        }
    break;
    case "Artes Slot":
        var selectedSlotButton = menus[menuPos];
        var partyArteSlotId = (selectedSlotButton).partyArteSlotId;
        var playerId = (selectedSlotButton).playerId;
        if(playerId >= 0 && partyArteSlotId >= 0) {
            tmp_arte = arte_find(party_get(playerId, partyArteSlotId));
            obj_areaMenu_artes_desc.visible = true;
            obj_areaMenu_artes_desc.v_gfx = arte_get_upgraded(tmp_arte,ARTE_GFX);
            obj_areaMenu_artes_desc.v_dmg = arte_get_upgraded(tmp_arte,ARTE_DMG);
            obj_areaMenu_artes_desc.v_pow = arte_get_upgraded(tmp_arte,ARTE_POW);
            obj_areaMenu_artes_desc.v_wait = arte_get_upgraded(tmp_arte,ARTE_WAIT);
            obj_areaMenu_artes_desc.v_cost = arte_get_upgraded(tmp_arte,ARTE_COST);
            obj_areaMenu_artes_desc.v_uses = upgrade_get(tmp_arte,ARTE_USES);
            obj_areaMenu_artes_desc.v_desc = arte_get_upgraded(tmp_arte,ARTE_DESC);
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
        if(tmp_arte >= 0) {
            obj_areaMenu_artes_desc.v_gfx = arte_get_upgraded(tmp_arte,ARTE_GFX);
            obj_areaMenu_artes_desc.v_dmg = arte_get_upgraded(tmp_arte,ARTE_DMG);
            obj_areaMenu_artes_desc.v_pow = arte_get_upgraded(tmp_arte,ARTE_POW);
            obj_areaMenu_artes_desc.v_wait = arte_get_upgraded(tmp_arte,ARTE_WAIT);
            obj_areaMenu_artes_desc.v_cost = arte_get_upgraded(tmp_arte,ARTE_COST);
            obj_areaMenu_artes_desc.v_uses = upgrade_get(tmp_arte,ARTE_USES);
            obj_areaMenu_artes_desc.v_desc = arte_get_upgraded(tmp_arte,ARTE_DESC);
        }
    break;
    case "Skill Arte":
        tmp_arte = (menus[menuPos]).v_set;//index in arte array
        if(tmp_arte >= 0) {
            obj_areaMenu_artes_desc.v_gfx = arte_get_upgraded(tmp_arte,ARTE_GFX);
            obj_areaMenu_artes_desc.v_dmg = arte_get_upgraded(tmp_arte,ARTE_DMG);
            obj_areaMenu_artes_desc.v_pow = arte_get_upgraded(tmp_arte,ARTE_POW);
            obj_areaMenu_artes_desc.v_wait = arte_get_upgraded(tmp_arte,ARTE_WAIT);
            obj_areaMenu_artes_desc.v_cost = arte_get_upgraded(tmp_arte,ARTE_COST);
            obj_areaMenu_artes_desc.v_uses = upgrade_get(tmp_arte,ARTE_USES);
            obj_areaMenu_artes_desc.v_desc = arte_get_upgraded(tmp_arte,ARTE_DESC);
        }
    break;
    case "Skill Upgrade":
        tmp_arte = (menus[menuPos]).v_set;//index in arte array
        if(tmp_arte >= 0) {
            arteId = (menus[menuPos]).arteId;
            tmp_name = arte_get_upgraded(arteId, ARTE_NAME);
            arteEffect = arte_get_upgraded(arteId, ARTE_EFFECT);
            obj_areaMenu_artes_desc.v_name = arte_get_upgraded(tmp_arte,ARTE_NAME);
            with(obj_areaMenu_artes_desc) {
                var desc = array_create(5);
                
                desc[0,ARTE_EFFECT_NONE] = "";
                desc[0,ARTE_EFFECT_HEAL] = "";
                desc[0,ARTE_EFFECT_ATT_BUFF] = "";
                desc[0,ARTE_EFFECT_DEF_BUFF] = "";
                desc[0,ARTE_EFFECT_BACK] = "";
                desc[0,ARTE_EFFECT_LIFT] = "";
                
                desc[1,ARTE_EFFECT_NONE] = "Increase damage to foes";
                desc[1,ARTE_EFFECT_HEAL] = "Increase HP given to allies";
                desc[1,ARTE_EFFECT_ATT_BUFF] = "Increase potency of buff";
                desc[1,ARTE_EFFECT_DEF_BUFF] = desc[1,ARTE_EFFECT_ATT_BUFF];
                desc[1,ARTE_EFFECT_BACK] = desc[1,ARTE_EFFECT_NONE];
                desc[1,ARTE_EFFECT_LIFT] = desc[1,ARTE_EFFECT_NONE];
                
                desc[2,ARTE_EFFECT_NONE] = "Pierce opponents defense";
                desc[2,ARTE_EFFECT_HEAL] = "Increase speed of rolling HP";
                desc[2,ARTE_EFFECT_ATT_BUFF] = "Increase duration of buffs";
                desc[2,ARTE_EFFECT_DEF_BUFF] = desc[2,ARTE_EFFECT_ATT_BUFF];
                desc[2,ARTE_EFFECT_BACK] = "Push opponents farther back";
                desc[2,ARTE_EFFECT_LIFT] = "Push opponents farther upwards";
                
                desc[3,ARTE_EFFECT_NONE] = "Decrease time between button push and arte appearing.";
                desc[3,ARTE_EFFECT_HEAL] = "Decrease the casting time before executing an arte.";
                desc[3,ARTE_EFFECT_ATT_BUFF] = desc[3,ARTE_EFFECT_HEAL];
                desc[3,ARTE_EFFECT_DEF_BUFF] = desc[3,ARTE_EFFECT_HEAL];
                desc[3,ARTE_EFFECT_BACK] = desc[3,ARTE_EFFECT_NONE];
                desc[3,ARTE_EFFECT_LIFT] = desc[3,ARTE_EFFECT_NONE];
                
                desc[4,ARTE_EFFECT_NONE] = "Decrease SP usage to execute arte";
                desc[4,ARTE_EFFECT_HEAL] = desc[4,ARTE_EFFECT_NONE];
                desc[4,ARTE_EFFECT_ATT_BUFF] = desc[4,ARTE_EFFECT_NONE];
                desc[4,ARTE_EFFECT_DEF_BUFF] = desc[4,ARTE_EFFECT_NONE];
                desc[4,ARTE_EFFECT_BACK] = desc[4,ARTE_EFFECT_NONE];
                desc[4,ARTE_EFFECT_LIFT] = desc[4,ARTE_EFFECT_NONE];
                
                desc[5,ARTE_EFFECT_NONE] = "Artes last longer.";
                desc[5,ARTE_EFFECT_HEAL] = "Increase the time the heal arte is on the field.";
                desc[5,ARTE_EFFECT_ATT_BUFF] = "Increases the time the buff arte is on the field";
                desc[5,ARTE_EFFECT_DEF_BUFF] = desc[5,ARTE_EFFECT_ATT_BUFF];
                desc[5,ARTE_EFFECT_BACK] = desc[5,ARTE_EFFECT_NONE];
                desc[5,ARTE_EFFECT_LIFT] = desc[5,ARTE_EFFECT_NONE];
                
                desc[6,ARTE_EFFECT_NONE] = "Decrease wait after using an arte to gain control again.";
                desc[6,ARTE_EFFECT_HEAL] = desc[6,ARTE_EFFECT_NONE];
                desc[6,ARTE_EFFECT_ATT_BUFF] = desc[6,ARTE_EFFECT_NONE];
                desc[6,ARTE_EFFECT_DEF_BUFF] = desc[6,ARTE_EFFECT_NONE];
                desc[6,ARTE_EFFECT_BACK] = desc[6,ARTE_EFFECT_NONE];
                desc[6,ARTE_EFFECT_LIFT] = desc[6,ARTE_EFFECT_NONE];
                
                v_desc = desc[other.menuPos, other.arteEffect]
            }
        }
    break;
    case "Party":
        for(tmp_i = 1; tmp_i < PLY_MAX; tmp_i += 1) {
            if(tmp_i == PLY_NAME) {
                continue;
            }
            with(obj_areaMenu_stats_desc) {
                STAT_id = other.tmp_i;
                playerId = (other.menus[other.menuPos]).playerId;
                if(playerId >= 0) {
                    baseStat = player_get(playerId, STAT_id);
                    stat = baseStat;
                    if(is_real(stat)) {
                        stat = getStat(global.playerLevel, STAT_id, baseStat);
                    }   
                    st[other.tmp_i] = stat;
                }
            }
        }
    break;
    case "Party Swap":
        for(tmp_i = 1; tmp_i < PLY_MAX; tmp_i++) {
            if(tmp_i == PLY_NAME ) {
                continue;
            }
            with(obj_areaMenu_stats_desc) {
                var STAT_id = other.tmp_i;
                var playerId = other.menus[other.menuPos].playerId;
                if(playerId >= 0) {
                    baseStat = player_get(playerId, STAT_id);
                    stat = baseStat;
                    if(is_real(stat)) {
                        stat = getStat(global.playerLevel, STAT_id, baseStat);
                    }
                    st[other.tmp_i] = stat;
                }
            }
        }
    break;
    case "Stats":
        for(tmp_i = 1; tmp_i < PLY_MAX; tmp_i += 1) {
            if(tmp_i == PLY_NAME) {
                continue;
            }
            with(obj_areaMenu_stats_desc) {
                var STAT_id = other.tmp_i;
                var playerId = other.menuPos;
                var baseStat = player_get(playerId, STAT_id);
                var stat = baseStat;
                if(is_real(stat)) {
                    stat = getStat(global.playerLevel, STAT_id, baseStat);
                }
                st[other.tmp_i] = stat;
            }
        }
    break;
}

// Scroll menu items
var previousVisibleMenuPosition = max(menuPos - 1, 0);
var previousMenuItemId = menus[previousVisibleMenuPosition];
if(!instance_exists(previousMenuItemId)) {
    exit;
}
var previousMenuY = (previousMenuItemId).y;
var menuHeight = 32;
var previousMenuTopY = previousMenuY - abs(menuHeight);
var desiredMenuY = view_yview[0] + 120;
if(previousMenuTopY < desiredMenuY) {
    menuYOffset = desiredMenuY - previousMenuTopY;
    with(obj_areaMenu) {
        y += other.menuYOffset;
    }
}
var nextVisibleMenuPosition = min(menuPos + 1, maxMenu - 1);
if(nextVisibleMenuPosition) < 0 {
    exit;
}
var nextMenuItemId = menus[nextVisibleMenuPosition];
var nextMenuY = (nextMenuItemId).y;
var nextMenuBottomY = nextMenuY + abs(menuHeight);
var desiredMenuY = view_yview[0] + view_hview[0] - 20;
if(nextMenuBottomY > desiredMenuY) {
    menuYOffset = nextMenuBottomY - desiredMenuY;
    with(obj_areaMenu) {
        y -= other.menuYOffset;
    }        
}

