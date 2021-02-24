draw_set_color(c_black);
// Draw the blank background for the GUI.
draw_rectangle(view_xview[0], view_yview[0] + view_hview[0] - 70, 
    view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);

var playerCount = 3;
var guiGap = 8;
var maxPlayerGuiWidth = view_wview[0] / playerCount;
var maxPlayerHpGuiWidth = maxPlayerGuiWidth - 34;
var hpBarHeight = 10;
for(i = 1;i <= playerCount;i += 1) {
    v_x = view_xview[0] + guiGap + (i-1) * maxPlayerGuiWidth;
    v_y = view_yview[0] + view_hview[0] - 64;
    me = ids[i];

    //draw face
    draw_sprite((me).gfx[GFX_FACE],-1,v_x + 1,v_y + 1);
    draw_sprite_stretched(spr_hp_under,-1,v_x + 34,v_y + 9, maxPlayerHpGuiWidth, hpBarHeight);//draw HP bars
    draw_sprite_stretched(spr_hp_over,-1, v_x + 34,v_y + 9, (me).rollHP / (me).MHP * maxPlayerHpGuiWidth,hpBarHeight);
    draw_sprite_stretched(spr_hp_top,-1, v_x + 34,v_y + 9, (me).HP / (me).MHP * maxPlayerHpGuiWidth,hpBarHeight);

    //draw HP text
    draw_bold_text(v_x + 40,v_y + 2,string(floor((me).HP)) + "/" + string(floor((me).MHP)),c_white,c_black);
    
    draw_sp_blocks((me).SP, (me).MSP, v_x + 36,v_y + 19);
    
    //draw bonuses
    if(floor((me).bonusATT) != 0)
        {draw_bold_text(v_x +   0,v_y - 16,"AT:" + string(floor((me).bonusATT)),c_white,c_red);}
    if(floor((me).bonusDEF) != 0)
        {draw_bold_text(v_x +  64,v_y - 16,"DF:" + string(floor((me).bonusDEF)),c_white,c_blue);}
    if(floor((me).bonusSPD) != 0)
        {draw_bold_text(v_x + 128,v_y - 16,"SD:" + string(floor((me).bonusSPD)),c_white,c_green);}
}
