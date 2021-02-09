if(v_act == "dead")
    {exit;}

for(tmp_i = 0;tmp_i < 20;tmp_i += 1) //check if already dmg
{
    if(dmg[tmp_i,DMG_ID] == other.id)
        {exit;}
} 

if(other.effect == "heal")
{
    if(other.v_team == v_team)  //if it is a healing arte, recover
    {
        rollHP += other.DMG;
        rollHPSpeed = other.POW / 200;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == "att buff")
{
    if(other.v_team == v_team)  //if it is a healing arte, recover
    {
        bonusATT += other.DMG;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(other.effect == "def buff")
{
    if(other.v_team == v_team)  //if it is a healing arte, recover
    {
        bonusDEF += other.DMG;
        bonusADEF += other.DMG;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(v_team == other.v_team)
    {exit;}

if(v_act == "guard")
{
    if(v_guard > other.DMG)
    {
        v_guard -= other.DMG / 2;
        new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
    }
    exit;
}

if(v_act == "counter")
{
    other.v_team = v_team;
    exit;
}

if(other.effect == "attack")
{
    v_timer = other.v_timer[0] - other.v_timer[1];
    v_act = "damage";
}

rollHP -= other.DMG;
animate_text(floor(other.DMG),0,- 40 - random(60));
if(place_clear(x - v_dir * other.POW,y) == true)
    {x -= v_dir * other.POW;}
    
if(other.POW > DEF + bonusDEF)
{
    if(other.x < x)
        {v_dir = DIR_LEFT;}
    else
        {v_dir = DIR_RIGHT;}
    v_timer = (other.POW - DEF + bonusDEF) * 1.5;
    v_act = "damage";
}
rollHPSpeed = 0.2;
new_dmg(other.id,other.v_timer[0] - other.v_timer[1]);
exit;
