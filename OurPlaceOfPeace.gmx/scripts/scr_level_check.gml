/// scr_level_check()

var newLevel = max(1, floor(sqrt(global.experience * 0.5) / 20));

if(global.maxPlayerLevel != newLevel) {
    if(global.maxPlayerLevel == global.playerLevel) {
        animate_text("PARTY LEVEL UP TO " + str(global.maxPlayerLevel) + "!",x,y);
        global.playerLevel = global.maxPlayerLevel;
    }
    global.maxPlayerLevel = newLevel;
}

