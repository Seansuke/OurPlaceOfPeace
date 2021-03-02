if(global.menu == true){exit;}

//init
depth = -999999;
v_img += 1/3;
v_timer[1] += 1;
image_xscale = v_dir;
image_index = v_img;

//check player
if(instance_exists(ids) == false || ids == -1){
    instance_destroy();exit;}
    
//timer
if(v_timer[1] > v_timer[0]){
    scr_attack_destroy();
    exit;}

//damage cancel
if((ids).v_act == "damage" && v_type == TYPE_PHYSICAL) {
    scr_attack_destroy();
    exit;
}

//effect effects
switch(effect)
{
    case ARTE_EFFECT_LIFT:
         v_dir2 = 90;
    break;
}

//movement?
switch(v_type)
{
    case TYPE_PHYSICAL:
         scr_attack_physical();
    break;
    case TYPE_SELF:
         scr_attack_self();
    break;
    case TYPE_SHOT:
         x += v_dir * real(amove);
    break;
    case TYPE_GRAVITY_SHOT:
         x += v_dir * real(amove);
         y += 1;
    break;
    case TYPE_AIR_SHOT:
        scr_attack_air_shot();
    break;
    case TYPE_DIAGONAL_SHOT:
         if(v_timer[1] == 1 && real(amove) < 0)
         {
            v_dir *= -1;
         }
         x += v_dir * amove;
         y -= real(amove);
    break;
    case TYPE_VERTICAL_SHOT:
         y -= real(amove);
    break;
    case TYPE_PLACE:
         if(v_timer[1] == 1) {
            x += v_dir * real(amove);
         }
    break;
    case TYPE_GROUND:
         while(place_clear(x,y + 32) == true && y < room_height) {
            y += 32;
         }
         while(place_clear(x,y + 1) == true && y < room_height) {
            y += 1;
         }
    break;
    case TYPE_AREA_TARGET:
         scr_attack_tech();
    break;
}
