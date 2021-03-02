/// scr_level_check()
var newLevel = max(1, floor(sqrt(global.experience / 2) / 4));

if(global.maxPlayerLevel != newLevel) {
    animate_text("PARTY LEVEL UP TO " + str(newLevel) + "!",x,y);
    if(global.maxPlayerLevel == global.playerLevel) {
        global.playerLevel = newLevel;
    }
    global.maxPlayerLevel = newLevel;
}

