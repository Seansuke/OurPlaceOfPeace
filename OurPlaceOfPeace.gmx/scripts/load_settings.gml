if(os_browser == browser_not_a_browser && false) {
    game_load("save.sav");
}
else {
    var saveDataJson = load_web_file();
    var saveDataMap = json_decode(saveDataJson);
    if(saveDataMap == -1) { 
        return "File not found.";
    }
    
    var width_view = ds_map_find_value(saveDataMap, "width_view");
    var height_view = ds_map_find_value(saveDataMap, "height_view");
    var horizontal_border = ds_map_find_value(saveDataMap, "horizontal_border");
    var vertical_border = ds_map_find_value(saveDataMap, "vertical_border");
    
    var currentMap = ds_map_find_value(saveDataMap, "currentMap");
    var areaPlayerX = ds_map_find_value(saveDataMap, "areaPlayerX");
    var areaPlayerY = ds_map_find_value(saveDataMap, "areaPlayerY");
    
    var ptyMatrix = saveDataMap[? "pty"];
    
    // Ignore the first one because it is skipped :/
    for(var i = 1; i < ds_list_size(ptyMatrix); i++) { 
        // Retrieve row item i
        var ptyRow = ptyMatrix[| i];
        for(var j = 0; j < ds_list_size(ptyRow); j++) {
            // Retrieve column item j
            var ptyCell = ptyRow[| j];
            pty[i, j] = ptyCell;
        }
    }
    
    var playerMatrix = saveDataMap[? "player"];
    
    // Ignore the first one because it is skipped :/
    for(var i = 0; i < ds_list_size(playerMatrix); i++) { 
        // Retrieve row item i
        var playerRow = playerMatrix[| i];
        for(var j = 0; j < ds_list_size(playerRow); j++) {
            // Retrieve column item j
            var playerCell = playerRow[| j];
            player[i, j] = playerCell;
        }
    }
    
    var arteMatrix = saveDataMap[? "arte"];
    
    // Ignore the first one because it is skipped :/
    for(var i = 0; i < ds_list_size(arteMatrix); i++) { 
        // Retrieve row item i
        var arteRow = arteMatrix[| i];
        for(var j = 0; j < ds_list_size(arteRow); j++) {
            // Retrieve column item j
            var arteCell = arteRow[| j];
            arte[i, j] = arteCell;
        }
    }
    
    var ctrlMatrix = saveDataMap[? "ctrl"];
    
    // Ignore the first one because it is skipped :/
    for(var i = 1; i < ds_list_size(ctrlMatrix); i++) { 
        // Retrieve row item i
        var ctrlRow = ctrlMatrix[| i];
        for(var j = 0; j < ds_list_size(ctrlRow); j++) {
            // Retrieve column item j
            var ctrlCell = ctrlRow[| j];
            ctrl[i, j] = ctrlCell;
        }
    }
    
    ds_map_destroy(saveDataMap);
    
    if(!room_exists(currentMap)) {
        return "Room currentMap does not exist: " + string(currentMap);
    }
    if(string(areaPlayerX) == "0" || string(areaPlayerX) == "") {
        return "areaPlayerX save data invalid: " + string(areaPlayerX);        
    }
    if(string(areaPlayerY) == "0" || string(areaPlayerY) == "") {
        return "areaPlayerY save data invalid: " + string(areaPlayerY);        
    }
    if(!is_array(pty)) {
        return "pty save data invalid, not an array: " + string(pty);
    }
    if(is_undefined(pty) || !is_array(pty) || array_height_2d(pty) == 0) {
        return "pty save data invalid: " + string(pty);
    }
    if(is_undefined(player) || !is_array(player) || array_height_2d(player) == 0) {
        return "player save data invalid: " + string(player);
    }
    if(is_undefined(arte) || !is_array(arte) || array_height_2d(arte) == 0) {
        return "arte save data invalid: " + string(arte);
    }
    if(is_undefined(ctrl) || !is_array(ctrl) || array_height_2d(ctrl) == 0) {
        return "ctrl save data invalid: " + string(ctrl);
    }

    global.currentMap = currentMap;
    global.areaPlayerX = areaPlayerX;
    global.areaPlayerY = areaPlayerY;
    global.pty = pty;
    global.player = player;
    global.arte = arte;
    global.ctrl = ctrl;
    
    room_goto(global.currentMap);
}
return "Nothing happened?";
