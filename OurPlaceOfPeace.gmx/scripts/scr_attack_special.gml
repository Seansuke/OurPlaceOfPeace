switch(v_typeB)
{
    case "Simple":
         x = (ids).x;
         y = (ids).y;
    break;
    case "Shot":
         x += v_dir * real(amove);
    break;
    case "Grav Shot":
         x += v_dir * real(amove);
         y += 1;
    break;
    case "Vertical Gravity Shot":
        prevx = x;
        prevy = y;
         x += v_dir * real(amove);
         y -= real(amove);
         y += v_timer[1] * 0.75;//as timer passes, accelerate towards the ground
         if(prevy != y){v_dir2 = tan((prevy - y) / (prevx - x)) * 180/pi;}
    break;
    case "DShot":
         if(v_timer[1] == 1 && real(amove) < 0)
         {
            v_dir *= -1;
         }
         x += v_dir * amove;
         y -= real(amove);
    break;
    case "VShot":
         y -= real(amove);
    break;
    case "Place":
         if(v_timer[1] == 1)
         {
            x += v_dir * real(amove);
         }
    break;
    case "Set":
    break;
    case "Ground":
         while(place_clear(x,y + 32) == true && y < room_height)
         {
            y += 32;
         }
         while(place_clear(x,y + 1) == true && y < room_height)
         {
            y += 1;
         }
    break;
}
