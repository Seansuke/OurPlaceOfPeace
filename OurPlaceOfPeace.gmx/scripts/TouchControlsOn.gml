// Refresh the window every time.
canvas_fullscreen();

var size = 55;
var xSet = size;
var x2Set = window_get_width() - size * 2;
var ySet = window_get_height() - size * 2;
var yUpperSet = 0;
    
if(MOBILE_CURRENT_KEYS == MOBILE_GML_VIRTUAL_KEYS) {
    instance_create(xSet - size, ySet - size, DirectionButtonVirtualKey);

    ds_list_add(global.touchList, 
        virtual_key_add(xSet - size, ySet - size, size*3, size, vk_up));
    ds_list_add(global.touchList, 
        virtual_key_add(xSet + size, ySet - size, size, size*3, vk_right));
    ds_list_add(global.touchList, 
        virtual_key_add(xSet - size, ySet + size, size*3, size, vk_down));
    ds_list_add(global.touchList, 
        virtual_key_add(xSet - size, ySet - size, size, size*3, vk_left));
        
    instance_create(x2Set - size, ySet - size, AttackSuiteVirtualKey);
    
    ds_list_add(global.touchList, 
        virtual_key_add(x2Set - size, ySet - size, size*3, size, ord('S')));
    ds_list_add(global.touchList, 
        virtual_key_add(x2Set + size, ySet - size, size, size*3, ord('A')));
    ds_list_add(global.touchList, 
        virtual_key_add(x2Set - size, ySet + size, size*3, size, ord('Z')));
    ds_list_add(global.touchList,   
        virtual_key_add(x2Set - size, ySet - size, size, size*3, ord('X')));
        
    instance_create(xSet, yUpperSet, TrailMixButtonVirtualKey);
    ds_list_add(global.touchList,   
        virtual_key_add(xSet, yUpperSet, size, size, ord('Q')));
        
    instance_create(x2Set, yUpperSet, PauseButtonVirtualKey);
    ds_list_add(global.touchList,   
        virtual_key_add(x2Set, yUpperSet, size, size, ord('C')));
        
    for(var i = 0; i < ds_list_size(global.touchList); i += 1) {
        var node = ds_list_find_value(global.touchList, i);
        virtual_key_show(node);
    }

}
else if(MOBILE_CURRENT_KEYS == MOBILE_CUSTOM_KEYS) {
    instance_create(0, 0, AttackVirtualKey);

}
