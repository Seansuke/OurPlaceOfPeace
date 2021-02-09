global.subimg = global.subimg + 1/3 mod 10000;

if(ctrl_press(BTN_MENU) == true || (subMenu == "Main" && (ctrl_press(BTN_GUARD) == true || ctrl_press(BTN_ARTES1) == true)))    //exit menu
{
    global.menu = false;
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    with(obj_areaMenu){instance_destroy();}
    with(obj_areaMenu_artes_desc){instance_destroy();}
    with(obj_areaMenu_stats_desc){instance_destroy();}
    exit;
}

if(ctrl_press(BTN_UP) == true)
{
    sound_play(sfx_zelda_cursor);
    menuPos -= 1;
}
if(ctrl_press(BTN_DOWN) == true)
{
    sound_play(sfx_zelda_cursor);
    menuPos += 1;
}
if(menuPos < 1){menuPos = menus[0];}
if(menuPos > menus[0]){menuPos = 1;}

menu_position_action();

if(ctrl_press(BTN_ATTACK) == true || ctrl_press(BTN_RIGHT) == true)
{
    sound_play(sfx_zelda_select);
    menu_execute();
    menuPos = 1;
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_ARTES2) == true || ctrl_press(BTN_LEFT) == true)
{
    sound_play(sfx_zelda_select);
    menu_secondary_execute();
    menuPos = 1;
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_GUARD) == true || ctrl_press(BTN_ARTES1) == true)
{
    sound_play(sfx_zelda_select);
    menu_back();
    menuPos = 1;
    exit;
}
