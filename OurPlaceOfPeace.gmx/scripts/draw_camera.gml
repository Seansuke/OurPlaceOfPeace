draw_battle_players();

for(tmp_i = 1;tmp_i <= 3;tmp_i += 1)//draw ally target in b attle gui   
{
    if((ids[tmp_i]).v_ally_target >= 1 && (ids[tmp_i]).v_ally_target <= 4)
    {
        v_target = (ids[tmp_i]).v_ally_target;
        draw_sprite(spr_hand, -1, view_xview[0] + 36 + (v_target - 1) * 213, view_yview[0] + 420);  
        draw_bold_text(view_xview[0] + 36 + (v_target - 1) * 213, view_yview[0] + 420,"P" + str(tmp_i),c_red,c_black);   
    }
}
