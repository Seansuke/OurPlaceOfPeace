
//draw menu hand
if(global.menu == true && global.menu_combatId == combatId) {
    depth = -3000;
    draw_sprite(spr_hand,-1,(menus[menuPos]).x,(menus[menuPos]).y);
    draw_bold_text((menus[menuPos]).x - 8,(menus[menuPos]).y - 8,"P" + str(combatId + 1),c_red,c_black);
}

if(global.menu) {
    exit;
}

depth = -y;

//draw player offscreen
if(ctrl_get(combatId,BTN_TYPE) != BTN_TYPE_NONE) {
    if(x > view_xview[0] + view_wview[0]) {
        draw_sprite(spr_bubble,0,view_xview[0] + view_wview[0]-30,y);
        draw_sprite_ext(gfx[v_gfx],v_img,view_xview[0] + view_wview[0]-30,y,0.5 * v_dir,0.5,0,c_white,1);
    }
    else if(x < view_xview[0]) {
        draw_sprite(spr_bubble,0,view_xview[0] + 30,y);
        draw_sprite_ext(gfx[v_gfx],v_img,view_xview[0] + 30,y,0.5 * v_dir,0.5,0,c_white,1);
    }
}

//draw afterimage
draw_sprite_ext(previousGfx,v_img - 1,previousX,previousY,v_dir,1,0,c_white,0.3);
if(previousX != x || previousY != y) {
    if(v_act == "counter") {
        draw_sprite_ext(previousGfx,v_img,previousX,previousY,v_dir,1,0,c_red,0.5);
    }
}

//draw player
draw_sprite_ext(gfx[v_gfx],v_img,x,y,v_dir,1,0,v_color,true); 

if(damageAlpha > 0) {
    // Draw damage.
    draw_sprite_ext(gfx[v_gfx], v_img, x,y, v_dir, 1,0, c_red, damageAlpha); 
}

depth = -3000;
    
//draw guardian
if(v_act == "guardian") {
    draw_sprite_ext(spr_bubble,v_img,x,y - 30,1.5,1.5,0,c_aqua,0.6);
}

//draw guard
if(v_act == "guard") {
    draw_sprite_ext(GuardSprite,v_img,x,y,v_dir,1,0,c_white,0.6);
}

//draw charge bar
if(v_charge > 1) {
    draw_rectangle_color(x - 30,y + 20, x + 30, y + 25, c_dkgray,c_gray,c_black,c_white, false);
    draw_rectangle_color(x - 30,y + 20, x - 30 + 60*(v_charge / v_chargeMax), y + 25, c_red,c_maroon,c_orange,c_yellow, false);
}

//draw charge bar
if(v_uber > 1) {
    draw_rectangle_color(x - 30,y + 20, x - 30 + 60*(v_uber / v_uberMax), y + 25, c_green,c_teal,c_olive,c_teal, false);
}

//draw icon over enemy head
if(v_target >= 1 && v_target <= 8)  {
    draw_sprite(spr_hand, -1, (obj_camera.bad[v_target]).x ,(obj_camera.bad[v_target]).y);
    draw_bold_text((obj_camera.bad[v_target]).x - 8,(obj_camera.bad[v_target]).y - 8,"P" + str(combatId),c_red,c_black);
}

