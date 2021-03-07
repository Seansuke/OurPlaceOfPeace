//draw afterimage
if(previousX != x || previousY != y) {
    if(v_act == "counter") {
        draw_sprite_ext(gfx[v_gfx],v_img,previousX,previousY,v_dir,1,0,c_red,0.5);
    }
    else {
        draw_sprite_ext(gfx[v_gfx],v_img,previousX,previousY,v_dir * 1.2,1.2,0,c_navy,0.5);
    }
} 

//draw monster
draw_sprite_ext(gfx[v_gfx],v_img,x,y,v_dir,1,0,c_white,true); 

if(damageAlpha > 0) {
    // Draw damage.
    draw_sprite_ext(gfx[v_gfx], v_img, x,y, v_dir, 1,0, c_red, damageAlpha); 
}

if(v_act == "guardian") {
    draw_sprite_ext(spr_bubble,v_img,x,y - 30,1.5,1.5,0,c_aqua,0.6);
}

//draw HP bars
draw_sprite_stretched(spr_hp_under,-1,x,y + 39, 75,10);
draw_sprite_stretched(spr_hp_over,-1,x,y + 39,rollHP / stat[PLY_HP] * 75,10);
draw_sprite_stretched(spr_hp_top,-1,x,y + 39,HP / stat[PLY_HP] * 75,10);

//draw HP text
draw_bold_text(x + 30,y + 32,string(floor(HP)),c_white,c_black);
