/// scr_level_check()
if(global.experience >= nextLevelAt()) {
    var newLevel = global.maxPlayerLevel + 1;
    animate_text("PARTY LEVEL UP TO " + str(newLevel) + "!",x,y);
    if(global.maxPlayerLevel == global.playerLevel) {
        global.playerLevel = newLevel;
    }
    global.maxPlayerLevel = newLevel;
}
    
