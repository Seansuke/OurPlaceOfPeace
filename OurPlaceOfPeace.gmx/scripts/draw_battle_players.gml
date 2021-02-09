draw_set_color(c_black);
draw_rectangle(view_xview[0], view_yview[0] + 380, view_xview[0] + 640, view_yview[0] + 480, false);
for(i = 1;i <= 3;i += 1)//do it for all 3 players
{
    v_x = view_xview[0] + 16 + (i-1) * 213;
    v_y = 400;
    me = ids[i];//easier reference
    draw_sprite((me).gfx[GFX_FACE],-1,v_x + 1,v_y + 1);//draw face
    draw_sprite(spr_hp_under,-1,v_x + 36,v_y + 9);//draw HP bars
    draw_sprite_stretched(spr_hp_over,-1,v_x + 36,v_y + 9,(me).rollHP / (me).MHP * 150,10);
    draw_sprite_stretched(spr_hp_top,-1,v_x + 36,v_y + 9,(me).HP / (me).MHP * 150,10);
    draw_bold_text(v_x + 79,v_y + 2,string(floor((me).HP)) + "/" + string(floor((me).MHP)),c_white,c_black);//draw HP text
    draw_sp_blocks((me).SP, (me).MSP, v_x + 36,v_y + 19);
    //draw bonus}
    if(floor((me).bonusATT) != 0)
        {draw_bold_text(v_x +   0,v_y - 16,"AT:" + string(floor((me).bonusATT)),c_white,c_red);}
    if(floor((me).bonusDEF) != 0)
        {draw_bold_text(v_x +  64,v_y - 16,"DF:" + string(floor((me).bonusDEF)),c_white,c_blue);}
    if(floor((me).bonusSPD) != 0)
        {draw_bold_text(v_x + 128,v_y - 16,"SD:" + string(floor((me).bonusSPD)),c_white,c_green);}
}
