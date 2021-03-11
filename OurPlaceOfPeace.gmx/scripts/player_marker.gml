///player_marker(markerIndex);
var markerIndex = argument0;
if(markerIndex < 0 || markerIndex > 4) {
    exit;
}

var marker = array_create(5);
var i = 0;
marker[i] = obj_areaCam;
i++;
marker[i] = obj_marker1;
i++;
marker[i] = obj_marker2;
i++;
marker[i] = obj_marker3;
i++;
marker[i] = obj_marker4;

global.areaPlayerX = (marker[markerIndex]).x;
global.areaPlayerY = (marker[markerIndex]).y;

with(PlayerObject) {
    x = global.areaPlayerX - combatId * 16;
    y = global.areaPlayerY;
}
