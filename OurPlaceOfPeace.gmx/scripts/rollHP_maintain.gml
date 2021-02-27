if(abs(HP  - rollHP) < 1)
    {HP = rollHP;}
if(HP < rollHP)
    {HP += rollHPSpeed;}
else if(rollHP < HP)
    {HP -= 1;}

if(rollHP > stat[PLY_HP])
    {rollHP = stat[PLY_HP];}
else if(rollHP < 0)
    {rollHP = 0;}

if(HP > stat[PLY_HP])
    {HP = stat[PLY_HP];}
else if(HP < 1)
{
    HP = 0;
    v_act = "dead";
}

bonusATT = min(bonusATT, stat[PLY_ATT] * 0.3);
bonusATT = max(bonusATT, - stat[PLY_ATT] * 0.3);
bonusATT += sign(bonusATT) * 0.01;

bonusDEF = min(bonusDEF, stat[PLY_DEF] * 0.3);
bonusDEF = max(bonusDEF, - stat[PLY_DEF] * 0.3);
bonusDEF += sign(bonusDEF) * 0.01;

bonusDEF = min(bonusDEF, stat[PLY_DEF] * 0.3);
bonusDEF = max(bonusDEF, - stat[PLY_DEF] * 0.3);
bonusDEF += sign(bonusDEF) * 0.01;

bonusSPD = min(bonusSPD, stat[PLY_SPD] * 0.3);
bonusSPD = max(bonusSPD, - stat[PLY_SPD] * 0.3);
bonusSPD += sign(bonusSPD) * 0.01;

