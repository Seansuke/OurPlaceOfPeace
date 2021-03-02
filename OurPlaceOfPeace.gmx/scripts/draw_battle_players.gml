draw_set_color(c_black);
// Draw the blank background for the GUI.
draw_rectangle(view_xview[0], view_yview[0] + view_hview[0] - 70, 
    view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);

var guiGap = 8;
var maxPlayerGuiWidth = view_wview[0] / PTY_AMNT;
var maxPlayerHpGuiWidth = maxPlayerGuiWidth - 34;
var hpBarHeight = 10;

for(i = 0;i < PTY_AMNT;i += 1) {
    me = ids[i];
    if(!instance_exists(me)) {
        continue;
    }
    v_x = view_xview[0] + guiGap + i * maxPlayerGuiWidth;
    v_y = view_yview[0] + view_hview[0] - 64;

    //draw face
    draw_sprite((me).gfx[GFX_FACE],-1,v_x + 1,v_y + 1);
    draw_sprite_stretched(spr_hp_under,-1,v_x + 34,v_y + 9, maxPlayerHpGuiWidth, hpBarHeight);//draw HP bars
    draw_sprite_stretched(spr_hp_over,-1, v_x + 34,v_y + 9, (me).rollHP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth,hpBarHeight);
    draw_sprite_stretched(spr_hp_top,-1, v_x + 34,v_y + 9, (me).HP / (me).stat[PLY_HP] * maxPlayerHpGuiWidth,hpBarHeight);

    // Draw player cursor
    if((ids[i]).v_ally_target >= 0 && (ids[i]).v_ally_target < PTY_AMNT)
    {
        v_target = (ids[i]).v_ally_target;
       v_targetX = view_xview[0] + guiGap + v_target * maxPlayerGuiWidth;
        draw_sprite(spr_hand, -1, v_targetX, v_y);
        draw_bold_text(v_targetX, v_y,
            "P" + str(i),c_red,c_black);
    }
    //draw HP text
    draw_bold_text(v_x + 40,v_y + 2,string(floor((me).HP)) + "/" + string(floor((me).stat[PLY_HP])),c_white,c_black);
    
    draw_sp_blocks((me).SP, (me).stat[PLY_SP], v_x + 36,v_y + 19);
    
    //draw bonuses
    if(floor((me).bonusATT) != 0)
        {draw_bold_text(v_x +   0,v_y - 16,"AT:" + string(floor((me).bonusATT)),c_white,c_red);}
    if(floor((me).bonusDEF) != 0)
        {draw_bold_text(v_x +  64,v_y - 16,"DF:" + string(floor((me).bonusDEF)),c_white,c_blue);}
    if(floor((me).bonusSPD) != 0)
        {draw_bold_text(v_x + 128,v_y - 16,"SD:" + string(floor((me).bonusSPD)),c_white,c_green);}
}
