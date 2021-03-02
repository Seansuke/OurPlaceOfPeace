//draw check
if(v_visible == false)
{
    exit;
}

//draw sprite
if(v_type == TYPE_AREA_TARGET)
{
    if(v_dir == DIR_LEFT)
    {
        draw_sprite_ext(sprite_index,v_img * 0.3,x,y,v_dir,1,v_dir2 - 180,c_white,1);//fix this
    }
    else
    {
        draw_sprite_ext(sprite_index,v_img * 0.3,x,y,v_dir,1,v_dir2,c_white,1);
    }
}
else if(v_type == TYPE_AIR_SHOT)
{
    draw_sprite_ext(sprite_index,v_img,x,y,1,1, - v_dir2,c_white,1);
}
else
{
    draw_sprite_ext(sprite_index,v_img,x,y,v_dir,1,0,c_white,1);
}
