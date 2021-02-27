///arte_new(playerId,arteName,gfx,userGfx, dmg,pow,waittime,cost, lvl,desc, effect);

//search for next empty arte spot in the array
for(i = 0;global.arte[i,ARTE_NAME] != "";i += 1){}

// Replace the empty spot with our new arte
arte_replace_by_id(i, argument0, argument1, argument2, argument3,
    argument4, argument5, argument6, argument7, argument8, 
    argument9, 0, 0, argument10);

// Set the arte cost now that the arte has been created.
global.arte[i, ARTE_POINTS] = 0;

// Make next slot empty.
global.arte[i + 1,ARTE_NAME] = "";
