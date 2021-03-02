prevx = x;
prevy = y;
 x += v_dir * real(amove);
 y -= real(amove);
 y += v_timer[1] * 0.75;//as timer passes, accelerate towards the ground
 if(prevy != y){v_dir2 = tan((prevy - y) / (prevx - x)) * 180/pi;}
