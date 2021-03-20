
draw_set_color(c_black);

// Draw the blank background for the GUI.
draw_rectangle(view_xview[0], view_yview[0] + view_hview[0] - 70, 
    view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);

for(var i = 0;i < PTY_AMNT;i += 1) {
    
    if(! gui[i].visible) {
        continue;
    }
    
    //draw face
    draw_sprite(gui[i].face,-1,gui[i].v_x + 1,gui[i].v_y + 1);
    draw_sprite_stretched(spr_hp_under,-1,gui[i].v_x + 34,gui[i].v_y + 9, 
        gui[i].maxPlayerHpGuiWidth, gui[i].hpBarHeight);//draw HP bars
    draw_sprite_stretched(spr_hp_over,-1, gui[i].v_x + 34,gui[i].v_y + 9, 
        gui[i].rollHpBarLength ,gui[i].hpBarHeight);
    draw_sprite_stretched(spr_hp_top,-1, gui[i].v_x + 34,gui[i].v_y + 9, 
        gui[i].hpBarLength, gui[i].hpBarHeight);

    //draw HP text
    draw_bold_text(gui[i].v_x + 40,gui[i].v_y + 2,
        gui[i].hpText,c_white,c_black);
    
    draw_sp_blocks(gui[i].SP, gui[i].maxSP, 
        gui[i].v_x + 36, gui[i].v_y + 19);
    
    //draw bonuses
    draw_bold_text(gui[i].v_x, gui[i].v_y - 16, gui[i].buffText, c_white,c_red);
    
}

// Overhead cursors must be drawn last to display over character portraits
for(var i = 0;i < PTY_AMNT;i += 1) {

    if(! gui[i].visible) {
        continue;
    }
    
    // Draw player cursor
    if(gui[i].targetVisible) {
        draw_sprite(spr_hand, -1, gui[i].iconTargetX, gui[i].v_y);
        draw_bold_text(gui[i].iconTargetX, gui[i].v_y,
            "P" + str(gui[i].combatId + 1),c_red,c_black);

        draw_sprite(spr_hand, -1, gui[i].targetX , gui[i].targetY);
        draw_bold_text(gui[i].targetX , gui[i].targetY,
            "P" + str(gui[i].combatId + 1),c_red,c_black);
    }
}
