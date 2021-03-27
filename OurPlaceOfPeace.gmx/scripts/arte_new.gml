///arte_new(playerId,arteName,gfx,userGfx, dmg,pow,waittime,cost, lvl,desc, ARTE_EFFECT_, TYPE_, duration);

//search for next empty arte spot in the array
var i = global.maxArte;

// Replace the empty spot with our new arte
arte_replace_by_id(i, argument0, argument1, argument2, argument3,
    argument4, argument5, argument6, argument7, argument8, 
    argument9, argument10, argument11, argument12);

global.arte[i, ARTE_MOVE_SPEED] = 0;
global.arte[i, ARTE_POST_WAIT] = 0;

// Default the visibility
global.arte[i, ARTE_VISIBLE] = true;

global.maxArte++;

for(var j = 0; j < ARTE_MAX; j++) {
    upgrade_set(i, j, 0);
}

return i;
