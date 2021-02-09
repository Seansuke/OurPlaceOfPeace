//arte_new(player,name,gfx, dmg,pow, wait,cost, lvl,desc);
for(i = 0;global.arte[i,ARTE_NAME] != "";i += 1){}//search for next spot
global.arte[i,ARTE_PLAYER] = argument0;
global.arte[i,ARTE_NAME] = argument1;
global.arte[i,ARTE_GFX] = argument2;
global.arte[i,ARTE_DMG] = argument3;
global.arte[i,ARTE_POW] = argument4;
global.arte[i,ARTE_WAIT] = argument5;
global.arte[i,ARTE_COST] = argument6;
global.arte[i,ARTE_LVL] = argument7;
global.arte[i,ARTE_DESC] = argument8;
global.arte[i,ARTE_USES] = 0;
global.arte[i,ARTE_POINTS] = 10;
global.arte[i + 1,ARTE_NAME] = "";//make next slot empty
