global.subimg = global.subimg + 1/3 mod 10000;

if(ctrl_press(BTN_MENU) == true || (subMenu == "Main" && (ctrl_press(BTN_GUARD) == true || ctrl_press(BTN_ARTES1) == true)))    //exit menu
{
    global.menu = false;
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    with(obj_areaMenu){instance_destroy();}
    with(obj_areaMenu_artes_desc){instance_destroy();}
    with(obj_areaMenu_stats_desc){instance_destroy();}
    ds_map_destroy(lastMenuPos);
    instance_deactivate_all(self);
    exit;
}

if(ctrl_press(BTN_UP) == true)
{
    audio_play_sound(sfx_zelda_cursor, 3, false);
    menuPos -= 1;
}
if(ctrl_press(BTN_DOWN) == true)
{
    audio_play_sound(sfx_zelda_cursor, 3, false);
    menuPos += 1;
}

menu_wrapMenuPos();

menu_position_action();

if(ctrl_press(BTN_ATTACK) == true || ctrl_press(BTN_RIGHT) == true)
{
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_execute();
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_ARTES2) == true || ctrl_press(BTN_LEFT) == true)
{
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_secondary_execute();
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_GUARD) == true || ctrl_press(BTN_ARTES1) == true)
{
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_back();
    exit;
}
