if(v_act == "dead")
    {exit;}

for(tmp_i = 0;tmp_i < 20;tmp_i += 1) //check if already dmg
{
    if(dmg[tmp_i,DMG_ID] == other.id)
        {exit;}
} 

if(other.effect == ARTE_EFFECT_HEAL)
{
    if(other.v_team == v_team)
    {
        rollHP += other.attack;
        rollHPSpeed = 0.01 + other.pushPower / 200;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_ATT_BUFF)
{
    if(other.v_team == v_team)
    {
        bonusATT += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_DEF_BUFF)
{
    if(other.v_team == v_team)
    {
        bonusDEF += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == ARTE_EFFECT_SPD_BUFF)
{
    if(other.v_team == v_team)
    {
        bonusSPD += min(other.attack, 3);
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(v_team == other.v_team)
    {exit;}

var damage = 0;
if(other.isArte) {
    damage = get_damage(other.attack, other.attackMultiplier, other.pushPower, stat[PLY_ADEF]);
}
else {
    damage = get_damage(other.attack, other.attackMultiplier, other.pushPower, stat[PLY_DEF]);
}

if(v_act == "guard")
{
    if(SP > damage)
    {
        SP -= damage;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    else {
        if(other.x < x)
            {v_dir = DIR_LEFT;}
        else
            {v_dir = DIR_RIGHT;}
        v_timer = min(other.pushPower * 1.5, 64);
        v_act = "damage";
    }
    exit;
}

if(v_act == "counter")
{
    SP += COUNTER_SP_GAIN;
    other.v_team = v_team;
    exit;
}

if(other.effect == ARTE_EFFECT_ATTACK)
{
    v_timer = other.v_timer[0] - other.v_timer[1];
    v_act = "damage";
}
rollHP -= damage;
animate_text(damage, x, y - 40 - random(60));
if(place_clear(x - v_dir * other.pushPower,y) == true) {
    x -= v_dir * other.pushPower;
}
v_charge -= 5;
if(other.pushPower > stat[PLY_DEF] + bonusDEF) {
    if(other.x < x)
        {v_dir = DIR_LEFT;}
    else
        {v_dir = DIR_RIGHT;}
    v_timer = min(64, (other.pushPower - stat[PLY_DEF] + bonusDEF) * 1.5);
    v_act = "damage";
}

damageAlpha = 1;
rollHPSpeed = 0.2;

// Opponent earns SP for the melee attack
if(!other.isArte) {
    (other.ids).SP += SP_MELEE_GAIN;
}

new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);

exit;
