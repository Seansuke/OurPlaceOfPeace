
draw_set_color(c_black);
// Draw the blank background for the GUI.
draw_rectangle(view_xview[0], view_yview[0] + view_hview[0] - 70, 
    view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);

var guiGap = 8;
var maxPlayerGuiWidth = view_wview[0] / PTY_AMNT;
var maxPlayerHpGuiWidth = maxPlayerGuiWidth - 34;
var hpBarHeight = 10;

for(var idIndex = 0;idIndex < PTY_AMNT;idIndex += 1) {
    me = ids[idIndex];
    
    if(!instance_exists(me)) {
        continue;
    }
    
    var i = me.combatId;
    
    v_x = view_xview[0] + guiGap + i * maxPlayerGuiWidth;
    v_y = view_yview[0] + view_hview[0] - 64;

    //draw face
    draw_sprite((me).gfx[GFX_FACE],-1,v_x + 1,v_y + 1);
    draw_sprite_stretched(spr_hp_under,-1,v_x + 34,v_y + 9, maxPlayerHpGuiWidth, hpBarHeight);//draw HP bars
    draw_sprite_stretched(spr_hp_over,-1, v_x + 34,v_y + 9, (me).rollHP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth,hpBarHeight);
    draw_sprite_stretched(spr_hp_top,-1, v_x + 34,v_y + 9, (me).HP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth,hpBarHeight);

    //draw HP text
    draw_bold_text(v_x + 40,v_y + 2,string(floor((me).HP)) + "/" + string(floor((me).stat[PLY_HP])),c_white,c_black);
    
    draw_sp_blocks((me).SP, (me).stat[PLY_SP], v_x + 36,v_y + 19);
    
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
    draw_bold_text(v_x,v_y - 16,buffText,c_white,c_red);

    // Draw player cursor
    var allyTargetCombatId = (ids[i]).v_ally_target;
    if(allyTargetCombatId > 0 && allyTargetCombatId < PTY_AMNT) {
        var allyTargetInstanceId = ids[allyTargetCombatId];
        if(instance_exists(allyTargetInstanceId)) {
            v_targetX = view_xview[0] + guiGap + allyTargetCombatId * maxPlayerGuiWidth;
            draw_sprite(spr_hand, -1, v_targetX, v_y);
            draw_bold_text(v_targetX, v_y,
                "P" + str(i + 1),c_red,c_black);
    
            draw_sprite(spr_hand, -1, (allyTargetInstanceId).x, (allyTargetInstanceId).y - 64);
            draw_bold_text((allyTargetInstanceId).x, (allyTargetInstanceId).y - 64,
                "P" + str(i + 1),c_red,c_black);
        
        }
    }               
}
