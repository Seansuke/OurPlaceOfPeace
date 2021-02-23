
//other stuff
global.touchList = ds_list_create();
draw_set_color(c_white);
draw_set_font(font_courier);
draw_set_halign(fa_left);
global.menu = false;
global.areaPlayerX = 320;
global.areaPlayerY = 240;
global.currentMap = rm_area_outskirts;
global.marker = -1;
global.monsterLevel = 1;
global.menu_plyr = -1;
global.monFight[1] = MAX_MONSTERS;
global.monFight[2] = MAX_MONSTERS;
global.monFight[3] = MAX_MONSTERS;
global.subimg = 0;
cursor_sprite = spr_hand;
global.width_view = 640;
global.height_view = 480;
global.horizontal_border = 320;
global.vertical_border = 240;

if(os_browser == browser_not_a_browser) {
    TouchControlsOff();
}
else {
    global.width_view = browser_width * 1.5;
    global.height_view = browser_height * 1.5;
    global.horizontal_border = global.width_view / 2;
    global.vertical_border = global.height_view / 2;
    TouchControlsOn();
}
