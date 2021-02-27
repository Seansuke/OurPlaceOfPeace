///getStat(level, PLY_stat, baseStat)
var level = argument0;
var PLY_stat = argument1;
var baseStat = argument2;
switch(PLY_stat) {
    case PLY_NAME:
        return baseStat;
    break;
    case PLY_HP:
        // 55 at 1, 82 at 10, 114 at 20, 146 at 30, etc.
        // 110 at 1, 175 at 10, 225 at 20, 300 at 30, etc.
        // 160 at 1, 257 at 10, 314 at 20, 421 at 30, etc.
        return 10 * baseStat + floor(0.75 * level * baseStat);
    break;
    case PLY_SP:
        // Average 200
        var sp = 100 + 15 * baseStat; 
        
        // Get next SP block at about level 5~10
        if(level >= 10 - baseStat / 2) {
            sp += 100;
        }

        // Get next SP block at about level 20~25
        if(level >= 25 - baseStat / 2) {
            sp += 100;
        }
        
        // Get next SP block at about level 46~50
        if(level >= 50 - baseStat / 3) {
            sp += 100;
        }
        
        // Get next SP block at about level 86~90
        if(level >= 90 - baseStat / 3) {
            sp += 100;
        }
        
        return min(max(100, floor(sp / 100) * 100), 800);
    break;
    case PLY_SPD:
        // Average 9
        var speedStat = baseStat; 
        
        // Get next speed up at about level 14~20
        if(level - baseStat / 5 >= 20) {
            speedStat++;
        }

        // Get next speed up at about level 36~40
        if(level - baseStat / 5 >= 40) {
            speedStat++;
        }

        // Get next speed up at about level 76~80
        if(level - baseStat / 5 >= 80) {
            speedStat++;
        }

        return speedStat;
    break;
    default:
        // 10 at 1, 20 at 10, 30 at 20, etc.
        // 15 at 1, 30 at 10, 45 at 20, etc.
        return floor(baseStat + 0.1 * level * baseStat);
    break;
}
