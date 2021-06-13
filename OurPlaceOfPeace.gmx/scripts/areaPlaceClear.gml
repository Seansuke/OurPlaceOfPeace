///areaPlaceClear(x, y)
var requestedX = argument0;
var requestedY = argument1;
return !place_meeting(requestedX,requestedY,obj_areaWall)
    && !place_meeting(requestedX,requestedY,ParentBlock)
    && requestedX > 0
    && requestedX < room_width
    && requestedY > 64
    && requestedY < room_height
;
