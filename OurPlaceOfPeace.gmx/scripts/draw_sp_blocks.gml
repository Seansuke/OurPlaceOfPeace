//draw_sp_blocks(sp,maxSP,x,y);
    for(k = 0;k < argument1 / 100;k += 1)//draw SP blocks
    {
        draw_sprite(spr_sp_under,-1,argument2 + k*16,argument3);
        if(argument0 >= ((k + 1) * 100))//full block
        {
            draw_sprite(spr_sp_over,-1,argument2 + k*16,argument3 + 1);
        }
        else if(argument0 > (k * 100) && argument0 < ((k + 1) * 100))//greater than no block AND less than a whole block
        {
            draw_sprite_stretched(spr_sp_over,-1,argument2 + k*16,argument3 + 1,((argument0 - 100*k) / 100) * 16,14);
        }
        draw_sprite(spr_sp_top,-1,argument2 + k*16,argument3);
    }

