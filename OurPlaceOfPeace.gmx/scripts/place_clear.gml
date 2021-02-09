//x
if(argument0 < 32){return false;}
if(argument0 > room_width - 32){return false;}

//y
if(argument1 > obj_camera.y){return false;}

return true;//success!
