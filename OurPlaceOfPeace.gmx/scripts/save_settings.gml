global.currentMap = room;
global.areaPlayerX = obj_areaPlayer.x;
global.areaPlayerY = obj_areaPlayer.y;
if(os_browser == browser_not_a_browser) {
    game_save("save.sav");
}
else {
    var saveDataMap = ds_map_create();
    
    ds_map_add(saveDataMap, "width_view", global.width_view);
    ds_map_add(saveDataMap, "height_view", global.height_view);
    ds_map_add(saveDataMap, "horizontal_border", global.horizontal_border);
    ds_map_add(saveDataMap, "vertical_border", global.vertical_border);
    
    ds_map_add(saveDataMap, "currentMap", global.currentMap);
    ds_map_add(saveDataMap, "areaPlayerX", global.areaPlayerX);
    ds_map_add(saveDataMap, "areaPlayerY", global.areaPlayerY);
    
    ds_map_add(saveDataMap, "pty", global.pty);
    ds_map_add(saveDataMap, "player", global.player);
    ds_map_add(saveDataMap, "arte", global.arte);
    ds_map_add(saveDataMap, "ctrl", global.ctrl);
    
    save_web_file(json_encode(saveDataMap));
    ds_map_destroy(saveDataMap);
}
return true;
