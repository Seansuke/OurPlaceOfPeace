if(place_meeting(argument0,argument1,ParentBlock)) {
    return false;
}

// y borders
if(argument1 < 16){return false;}
if(argument1 > room_height - 16){return false;}

return true;//success!
