global.subimg = global.subimg + 1/3 mod 10000;

if(ctrl_press(BTN_MENU) == true) {
    menu_close();
    exit;
}

if(ctrl_press(BTN_UP) == true || mouse_wheel_up()) {
    audio_play_sound(sfx_zelda_cursor, 3, false);
    menuPos -= 1;
}

if(ctrl_press(BTN_DOWN) == true || mouse_wheel_down()) {
    audio_play_sound(sfx_zelda_cursor, 3, false);
    menuPos += 1;
}

menu_wrapMenuPos();

menu_position_action();

if(ctrl_press(BTN_ATTACK) == true) {
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_execute();
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_RIGHT) == true) {
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_tertiary_execute();
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_LEFT) == true) {
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_secondary_execute();
    with(obj_controls){instance_destroy();}
    with(TouchControlsObject){instance_destroy();}
    exit;
}
if(ctrl_press(BTN_GUARD) == true == true) {
    audio_play_sound(sfx_zelda_select, 3, false);
    menu_back();
    exit;
}

// Scroll through items
if(mouse_check_button(mb_left)) {
    if(previousMouseY == -1) {
        previousMouseY = mouse_y;
    }
    else {
        var mouseYDelta = mouse_y - previousMouseY;
        if(mouseYDelta > 32) {
            audio_play_sound(sfx_zelda_select, 3, false);
            menuPos--;
            previousMouseY += 24;
        }
        else if(mouseYDelta < -32) {
            audio_play_sound(sfx_zelda_select, 3, false);
            menuPos++;
            previousMouseY -= 24;
        }
        menu_wrapMenuPos();
    }
}
else {
    previousMouseY = -1;
}

