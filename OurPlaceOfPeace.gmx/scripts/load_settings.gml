if(os_browser == browser_not_a_browser) {
    game_load("save.sav");
}
else {
    var saveDataJson = load_web_file();
    var saveDataMap = json_decode(saveDataJson);
    global.currentMap = ds_map_find_value(saveDataMap, "currentMap");
    global.areaPlayerX = ds_map_find_value(saveDataMap, "areaPlayerX");
    global.areaPlayerY = ds_map_find_value(saveDataMap, "areaPlayerY");
    global.pty = ds_map_find_value(saveDataMap, "pty");
    global.player = ds_map_find_value(saveDataMap, "player");
    global.arte = ds_map_find_value(saveDataMap, "arte");
    global.ctrl = ds_map_find_value(saveDataMap, "ctrl");
    ds_map_destroy(saveDataMap);
    if(room_exists(global.currentMap)) {
        room_goto(global.currentMap);
    }
    else {
        var errorCode = ds_map_find_value(saveDataMap, "errorCode");
        var errorMessage = ds_map_find_value(saveDataMap, "message");
        return "ErrorCode: " + string(errorCode) + " - " + string(errorMessage);
    }
}
return "Nothing happened?";
