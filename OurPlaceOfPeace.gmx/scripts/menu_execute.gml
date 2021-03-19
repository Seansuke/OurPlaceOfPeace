// Pressing Accept
with(menus[menuPos]) {
    audio_play_sound(sfx_zelda_select, 4, false);
    event_user(1);
}
menu_position_action();
