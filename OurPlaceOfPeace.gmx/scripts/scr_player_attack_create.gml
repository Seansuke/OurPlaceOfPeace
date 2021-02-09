/*
scr_player_attack_create();
*/
//create
tmp_id = instance_create(x,y,obj_attack);
(tmp_id).sprite_index = spr_icon;//graphic
(tmp_id).v_dir = v_dir;//direction
(tmp_id).v_type = "Physical";//attack type
(tmp_id).v_typeB = "Simple";//attack2 type
(tmp_id).v_visible = true;//visible
(tmp_id).amove = -1;
(tmp_id).effect = "attack";
(tmp_id).v_timer[0] = 3*6;//max time until departure
(tmp_id).DMG = 1;//attack dmg
(tmp_id).POW = 0;//throwing power
(tmp_id).ids = id;//id of user
(tmp_id).plyr = playerNum;//plyr number
(tmp_id).team = "Players";//plyr number

switch(playerNum)
{
    case Sean:
        (tmp_id).sprite_index = v_gfx2;//graphic
        (tmp_id).v_visible = false;//visible
        (tmp_id).v_timer[0] = 3*2;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 1;//throwing power
    break;
    case AD:
        (tmp_id).sprite_index = spr_wand;//graphic
        (tmp_id).v_timer[0] = 3*15;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 7;//attack dmg
        (tmp_id).v_type = "Special";//attack type
        (tmp_id).v_typeB = "Shot";//attack2 type
        (tmp_id).amove = 6;
        (tmp_id).effect = "out";
    break;
    case Dan:
        (tmp_id).sprite_index = spr_arrow;//graphic
        (tmp_id).v_timer[0] = 3*10;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 2;//attack dmg
        (tmp_id).v_type = "Special";//attack type
        (tmp_id).v_typeB = "Grav Shot";//attack2 type
        (tmp_id).amove = 10;
        (tmp_id).effect = "out";
    break;
    case John:
        (tmp_id).sprite_index = v_gfx2;//graphic
        (tmp_id).v_visible = false;//visible
        (tmp_id).v_timer[0] = 3*2;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 1;//throwing power
    break;
    case Serena:
        (tmp_id).sprite_index = v_gfx2;//graphic
        (tmp_id).v_visible = false;//visible
        (tmp_id).v_timer[0] = 3*2;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 1;//throwing power
    break;
    case James:
        (tmp_id).sprite_index = v_gfx2;//graphic
        (tmp_id).v_visible = false;//visible
        (tmp_id).v_timer[0] = 3*2;//max time until departure
        (tmp_id).DMG = ATT + bonusATT;//attack dmg
        (tmp_id).POW = 1;//throwing power
    break;
}

return tmp_id;
