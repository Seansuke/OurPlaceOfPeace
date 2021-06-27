if(v_act == "dead")
    {exit;}

for(tmp_i = 0;tmp_i < 20;tmp_i += 1) //check if already dmg
{
    if(dmg[tmp_i,DMG_ID] == other.id)
        {exit;}
} 

if(other.effect == ARTE_EFFECT_HEAL) {
    if(other.v_team == v_team) {
        animate_text("+" + string(other.attack) + " HP", x, y - 64);
        rollHP += other.attack;
        rollHPSpeed = max(MIN_HP_ROLL_SPEED, other.pushPower * HEALING_ROLL_SPEED_MULTIPLIER);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_ATT_BUFF) {
    if(other.v_team == v_team) {
        animate_text("ATTACK INCREASED!", x, y - 64);
        bonusATT += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_DEF_BUFF) {
    if(other.v_team == v_team) {
        animate_text("DEFENSE INCREASED!", x, y - 64);
        bonusDEF += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_SPD_BUFF) {
    if(other.v_team == v_team) {
        animate_text("SPEED INCREASED!", x, y - 64);
        bonusSPD += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(v_team == other.v_team) {
    exit;
}

var damage = 0;
if(other.isArte) {
    damage = get_damage(other.attack, other.attackMultiplier, other.pushPower, stat[PLY_ADEF]);
}
else {
    damage = get_damage(other.attack, other.attackMultiplier, other.pushPower, stat[PLY_DEF]);
}

if(v_act == "guard") {
    if(SP > damage * 4) {
        SP -= damage * 4;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
        animate_text("GUARDED", x, y - 64);
    }
    else {
        animate_text("GUARD BREAK", x, y - 64);
        if(other.x < x) {
            v_dir = DIR_LEFT;
        }
        else {
            v_dir = DIR_RIGHT;
        }
        v_timer = min(other.pushPower * 1.5, 64);
        v_act = "damage";
    }
    exit;
}

if(v_act == "evade") {
    SP += EVADE_SP_GAIN;
    new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    animate_text("EVADED", x, y - 64);
    exit;
}

if(v_act == "counter") {
    SP += COUNTER_SP_GAIN;
    other.v_team = v_team;
    animate_text("COUNTERED", x, y - 64);
    exit;
}

if(other.effect == ARTE_EFFECT_ATTACK) {
    v_timer = other.v_timer[0] - other.v_timer[1];
    v_act = "damage";
}

if(HP + damage * 1.25 < rollHP) { 
    rollHP -= damage * 1.25;
    animate_text(damage * 1.25, x, y - 64);
}
else {
    rollHP -= damage;
    animate_text(damage, x, y - 64);
}

if(place_clear(x - v_dir * other.pushPower,y) == true) {
    x -= v_dir * other.pushPower;
}

v_charge -= 5;

if(other.pushPower > stat[PLY_DEF] + bonusDEF) {
    if(other.x < x) {
        v_dir = DIR_LEFT;
    }
    else {
        v_dir = DIR_RIGHT;
    }
    v_timer = min(24, (other.pushPower - (stat[PLY_DEF] + bonusDEF)) * 1.5);
    v_act = "damage";
}

damageAlpha = 1;
rollHPSpeed = DAMAGE_AVERAGE_ROLLHP_SPEED;

// Opponent earns SP for the melee attack
if(!other.isArte) {
    (other.ids).SP += SP_MELEE_GAIN;
}

new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);

exit;
