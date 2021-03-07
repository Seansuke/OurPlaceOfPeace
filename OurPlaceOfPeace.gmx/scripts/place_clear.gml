//x
if(argument0 < 64){return false;}
if(argument0 > room_width - 64){return false;}

//y
if(argument1 < 64){return false;}
if(argument1 > room_height - 64){return false;}
if(argument1 > obj_camera.y){return false;}

return true;//success!
