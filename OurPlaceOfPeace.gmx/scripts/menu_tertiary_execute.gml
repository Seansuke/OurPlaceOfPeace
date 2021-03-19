// Pressing Right Key
switch(subMenu) {
    case "Party":
        with(menus[menuPos]) {
            audio_play_sound(sfx_zelda_select, 4, false);
            event_user(2);
        }
        menu_position_action();
    break;
    case "Settings":
        with(menus[menuPos]) {
            audio_play_sound(sfx_zelda_select, 4, false);
            event_user(2);
        }
        menu_position_action();
    break;
}
