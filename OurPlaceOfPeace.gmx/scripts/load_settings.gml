#define load_settings
if(os_browser == browser_not_a_browser) {
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
    var selectedItemId = ds_map_find_value(saveDataMap, "selectedItemId");
    
    var audioLevel = ds_map_find_value(saveDataMap, "audioLevel");
    var currentMap = ds_map_find_value(saveDataMap, "currentMap");
    var areaPlayerX = ds_map_find_value(saveDataMap, "areaPlayerX");
    var areaPlayerY = ds_map_find_value(saveDataMap, "areaPlayerY");
    
    var monsterLevel = ds_map_find_value(saveDataMap, "monsterLevel");
    var playerLevel = ds_map_find_value(saveDataMap, "playerLevel");
    var maxPlayerLevel = ds_map_find_value(saveDataMap, "maxPlayerLevel");
    var experience = ds_map_find_value(saveDataMap, "experience");
    
    
    //var ptyMatrix = getObjectFromMap(saveDataMap[? "pty"]);
    
    
    var ptyMatrix = saveDataMap[? "pty"];
    
    for(var i = 0; i < ds_list_size(ptyMatrix); i++) { 
        // Retrieve row item i
        var ptyRow = ptyMatrix[| i];
        for(var j = 0; j < ds_list_size(ptyRow); j++) {
            // Retrieve column item j
            var ptyCell = ptyRow[| j];
            pty[i, j] = ptyCell;
        }
    }
    
    var arteMatrix = saveDataMap[? "upgrade"];
    
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
    
    for(var i = 0; i < ds_list_size(ctrlMatrix); i++) { 
        // Retrieve row item i
        var ctrlRow = ctrlMatrix[| i];
        for(var j = 0; j < ds_list_size(ctrlRow); j++) {
            // Retrieve column item j
            var ctrlCell = ctrlRow[| j];
            ctrl[i, j] = ctrlCell;
        }
    }
    
    var combatPartyMatrix = saveDataMap[? "combatParty"];
    
    for(var i = 0; i < ds_list_size(combatPartyMatrix); i++) { 
        // Retrieve row item i
        var combatPartyRow = combatPartyMatrix[| i];
        for(var j = 0; j < ds_list_size(combatPartyRow); j++) {
            // Retrieve column item j
            var combatPartyCell = combatPartyRow[| j];
            combatParty[i, j] = combatPartyCell;
        }
    }

    var itemCountMatrix = saveDataMap[? "itemCount"];
    
    itemCount = global.itemCount;
    for(var i = 0; i < ds_list_size(itemCountMatrix); i++) { 
        itemCount[i] = itemCountMatrix[| i];
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
    if(string(audioLevel) == "") {
        return "audioLevel save data invalid: " + string(audioLevel);        
    }
    
    if(string(playerLevel) == "0" || string(playerLevel) == "") {
        return "playerLevel save data invalid: " + string(playerLevel);        
    }
    if(string(maxPlayerLevel) == "0" || string(maxPlayerLevel) == "") {
        return "maxPlayerLevel save data invalid: " + string(maxPlayerLevel);        
    }
    if(string(experience) == "") {
        return "experience save data invalid: " + string(experience);        
    }
    
    if(string(width_view) == "0" || string(width_view) == "") {
        return "width_view save data invalid: " + string(width_view);        
    }
    if(string(height_view) == "0" || string(height_view) == "") {
        return "height_view save data invalid: " + string(height_view);        
    }
    if(string(horizontal_border) == "0" || string(horizontal_border) == "") {
        return "horizontal_border save data invalid: " + string(horizontal_border);        
    }
    if(string(vertical_border) == "0" || string(vertical_border) == "") {
        return "vertical_border save data invalid: " + string(vertical_border);        
    }
    
    if(!is_array(pty)) {
        return "pty save data invalid, not an array: " + string(pty);
    }
    if(is_undefined(pty) || !is_array(pty) || array_height_2d(pty) == 0) {
        return "pty save data invalid: " + string(pty);
    }
    
    if(is_undefined(arte) || !is_array(arte) || array_height_2d(arte) == 0) {
        return "upgrade save data invalid: " + string(arte);
    }
    
    if(is_undefined(ctrl) || !is_array(ctrl) || array_height_2d(ctrl) == 0) {
        return "ctrl save data invalid: " + string(ctrl);
    }
    
    if(string(monsterLevel) != "0" 
        && string(monsterLevel) != "" 
        && monsterLevel != undefined
    ) {
        global.monsterLevel = monsterLevel;
    }

    global.audioLevel = audioLevel;
    global.currentMap = currentMap;
    global.areaPlayerX = areaPlayerX;
    global.areaPlayerY = areaPlayerY;
    
    global.playerLevel = playerLevel;
    global.maxPlayerLevel = maxPlayerLevel;
    global.experience = experience;
    
    global.combatParty = combatParty;
    global.pty = pty;
    global.upgrade = arte;
    global.ctrl = ctrl;
    global.itemCount = itemCount;
    global.selectedItemId = selectedItemId;

    audio_set_volume(global.audioLevel)
    room_set_temporary_persistence(global.currentMap);
    
    if(global.selectedItemId == undefined) {
        selectedItemId = ITEM_HALITE;
    }
}
return "Nothing happened?";

#define getObjectFromMap
var dsId = argument0;

var dsMatrix = undefined;

if(ds_exists(dsId, ds_type_map)) {
    // iterate through all map items
    var dsMatrix = saveDataMap[? "pty"];
    return dsMatrix;
}

if(ds_exists(dsId, ds_type_list)) {
    for(var i = 0; i < ds_list_size(dsId); i++) { 
        // Retrieve row item i
        var dsRow = dsId[| i];
        
        if(!ds_exists(dsRow, ds_type_list)) {
            dsMatrix[i] = dsRow;
        }
        else {
            for(var j = 0; j < ds_list_size(dsRow); j++) {
                // Retrieve column item j
                var dsCell = dsRow[| j];
                dsMatrix[i, j] = dsCell;
            }
        }
    }
    return dsMatrix;
}

return dsId;