/*
scr_player_attack_create();
*/
//create
tmp_id = instance_create(x,y,obj_attack);
(tmp_id).v_dir = v_dir;//direction
(tmp_id).v_type = TYPE_PHYSICAL;//attack type
(tmp_id).v_visible = true;//visible
(tmp_id).amove = -1;
(tmp_id).effect = ARTE_EFFECT_ATTACK;
(tmp_id).ids = id;
(tmp_id).playerId = playerId;
(tmp_id).team = "Players";
(tmp_id).isArte = false;
(tmp_id).sprite_index = v_gfx2;
(tmp_id).v_visible = false;
(tmp_id).v_timer[0] = 3*2;//max time until departure
(tmp_id).attack = stat[PLY_ATT];
(tmp_id).attack += bonusATT;
(tmp_id).attack += 0.5 * stat[PLY_ATT] * v_charge / v_chargeMax;
(tmp_id).attackMultiplier = 1;
(tmp_id).pushPower = stat[PLY_POW];
(tmp_id).pushPower += 0.5 * stat[PLY_POW] * v_charge / v_chargeMax;
play_slash_audio();

switch(playerId)
{
    case AD:
        (tmp_id).sprite_index = spr_wand;//graphic
        (tmp_id).v_timer[0] = 3*15;//max time until departure
        (tmp_id).v_type = TYPE_SHOT;
        (tmp_id).amove = 8;
        (tmp_id).effect = ARTE_EFFECT_OUT;
        (tmp_id).v_visible = true;//invisible attack
    break;
    case Dan:
        (tmp_id).sprite_index = spr_arrow;//graphic
        (tmp_id).v_timer[0] = 3*5;//max time until departure
        (tmp_id).v_type = TYPE_GRAVITY_SHOT;
        (tmp_id).amove = 20;
        (tmp_id).effect = ARTE_EFFECT_OUT;
        (tmp_id).v_visible = true;//invisible attack
    break;
    case Taliko:
        (tmp_id).sprite_index = IceBallSprite;//graphic
        (tmp_id).v_timer[0] = 3*15;//max time until departure
        (tmp_id).v_type = TYPE_SHOT;
        (tmp_id).amove = 8;
        (tmp_id).effect = ARTE_EFFECT_OUT;
        (tmp_id).v_visible = true;//invisible attack
    break;
}

return tmp_id;

