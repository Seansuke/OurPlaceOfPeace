if(abs(HP  - rollHP) < 1)
    {HP = rollHP;}
if(HP < rollHP)
    {HP += rollHPSpeed;}
else if(rollHP < HP)
    {HP -= 1;}

if(rollHP > MHP)
    {rollHP = MHP;}
else if(rollHP < 0)
    {rollHP = 0;}

if(HP > MHP)
    {HP = MHP;}
else if(HP < 1)
{
    HP = 0;
    v_act = "dead";
}
    
if(bonusATT > ATT * 0.25)
    {bonusATT = ATT * 0.25;}
else if(bonusATT < - ATT * 0.25)
    {bonusATT = - ATT * 0.25;}
if(bonusATT > 0.02)
    {bonusATT -= 0.01;}
else if(bonusATT < -0.02)
    {bonusATT += 0.01;}
else
    {bonusATT = 0;}

if(bonusDEF > DEF * 0.25)
    {bonusDEF = DEF * 0.25;}
else if(bonusDEF < - DEF * 0.25)
    {bonusDEF = - DEF * 0.25;}
if(bonusDEF > 0.02)
    {bonusDEF -= 0.01;}
else if(bonusDEF < -0.02)
    {bonusDEF += 0.01;}
else
    {bonusDEF = 0;}

if(bonusADEF > ADEF * 0.25)
    {bonusADEF = ADEF * 0.25;}
else if(bonusADEF < - ADEF * 0.25)
    {bonusADEF = - ADEF * 0.25;}
if(bonusADEF > 0.02)
    {bonusADEF -= 0.01;}
else if(bonusADEF < -0.02)
    {bonusADEF += 0.01;}
else
    {bonusADEF = 0;}

if(bonusSPD > SPD * 0.25)
    {bonusSPD = SPD * 0.25;}
else if(bonusSPD < - SPD * 0.25)
    {bonusSPD = - SPD * 0.25;}
if(bonusSPD > 0.02)
    {bonusSPD -= 0.01;}
else if(bonusSPD < -0.02)
    {bonusSPD += 0.01;}
else
    {bonusSPD = 0;}

