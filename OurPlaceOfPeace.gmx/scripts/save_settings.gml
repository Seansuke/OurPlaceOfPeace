#define save_settings
global.currentMap = room;
global.areaPlayerX = obj_areaPlayer.x;
global.areaPlayerY = obj_areaPlayer.y;

var saveDataMap = ds_map_create();

ds_map_add(saveDataMap, "width_view", global.width_view);
ds_map_add(saveDataMap, "height_view", global.height_view);
ds_map_add(saveDataMap, "horizontal_border", global.horizontal_border);
ds_map_add(saveDataMap, "vertical_border", global.vertical_border);
ds_map_add(saveDataMap, "selectedItemId", global.selectedItemId);

ds_map_add(saveDataMap, "audioLevel", global.audioLevel);
ds_map_add(saveDataMap, "currentMap", global.currentMap);
ds_map_add(saveDataMap, "areaPlayerX", global.areaPlayerX);
ds_map_add(saveDataMap, "areaPlayerY", global.areaPlayerY);

ds_map_add(saveDataMap, "monsterLevel", global.monsterLevel);
ds_map_add(saveDataMap, "playerLevel", global.playerLevel);
ds_map_add(saveDataMap, "maxPlayerLevel", global.maxPlayerLevel);
ds_map_add(saveDataMap, "experience", global.experience);
ds_map_add(saveDataMap, "combatParty", global.combatParty);
    
ds_map_add(saveDataMap, "pty", global.pty);
ds_map_add(saveDataMap, "upgrade", global.upgrade);
ds_map_add(saveDataMap, "ctrl", global.ctrl);
ds_map_add(saveDataMap, "itemCount", global.itemCount);

if(os_browser == browser_not_a_browser) {
    game_save("save.sav");
    return true;
    
    var file = file_text_open_write(working_directory + "/saveFile.txt");
    file_text_write_string(file, json_encode(saveDataMap));
    file_text_close(file);
}
else {    
    save_web_file(json_encode(saveDataMap));
}

ds_map_destroy(saveDataMap);
return true;

#define audio_set_volume
///audio_set_volume(volume_0_to_1)
var num = audio_get_listener_count();
 for( var i = 0; i < num; i++;)
    {
    var info = audio_get_listener_info(i);
    audio_set_master_gain(info[? "index"], argument0);
    ds_map_destroy(info);
    }