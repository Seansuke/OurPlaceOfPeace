if(abs(HP  - rollHP) < 1) {
    // HP should snap to the rollHP within a small threshold.
    HP = rollHP;
}

if(HP < rollHP) {
    // Rolling HP upward goes at a dynamic calculated speed.
    HP += rollHPSpeed;
}
else if(rollHP < HP) {
    if(rollHP <= 0 && HP < DEATH_ROLL_MAX_HP) {
        // Your death roll is much slower and your color incites fear.
        HP -= DEATH_ROLL_HP_SPEED;
        v_color = c_maroon;
        damageAlpha = 0.6;
    }
    else {
        // HP loss roll is at a basic set speed.
        HP -= 1;
    }
}

if(rollHP > stat[PLY_HP]) {
    // Your rollHP cannot be above your max HP.
    rollHP = stat[PLY_HP];
}

if(HP > stat[PLY_HP]) {
    // Your HP cannot be above your max HP
    HP = stat[PLY_HP];
}
else if(HP < 1) {
    // Snap HP to 0
    HP = 0;
    rollHP = 0;
    v_act = "dead";
}

// Go through all of the buffs and round them to zero slowly.

bonusATT = min(bonusATT, stat[PLY_ATT] * 0.3);
bonusATT = max(bonusATT, - stat[PLY_ATT] * 0.3);
bonusATT += sign(bonusATT) * 0.01;

bonusDEF = min(bonusDEF, stat[PLY_DEF] * 0.3);
bonusDEF = max(bonusDEF, - stat[PLY_DEF] * 0.3);
bonusDEF += sign(bonusDEF) * 0.01;

bonusSPD = min(bonusSPD, stat[PLY_SPD] * 0.3);
bonusSPD = max(bonusSPD, - stat[PLY_SPD] * 0.3);
bonusSPD += sign(bonusSPD) * 0.01;

