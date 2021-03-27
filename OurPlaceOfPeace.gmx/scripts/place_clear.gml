//x
if(argument0 < 16){return false;}
if(argument0 > room_width - 16){return false;}

//y
if(argument1 < 16){return false;}
if(argument1 > room_height - 16){return false;}
if(argument1 > obj_camera.y){return false;}

return true;//success!
