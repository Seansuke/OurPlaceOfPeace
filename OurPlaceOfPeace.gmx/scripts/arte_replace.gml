//arte_new(player,name,gfx, dmg,pow, waargument0t,cost, lvl,desc, uses);
i = arte_find(argument1);
global.arte[i,ARTE_PLAYER] = argument0;
global.arte[i,ARTE_NAME] = argument1;
global.arte[i,ARTE_GFX] = argument2;
global.arte[i,ARTE_DMG] = argument3;
global.arte[i,ARTE_POW] = argument4;
global.arte[i,ARTE_WAIT] = argument5;
global.arte[i,ARTE_COST] = argument6;
global.arte[i,ARTE_LVL] = argument7;
global.arte[i,ARTE_DESC] = argument8;
global.arte[i,ARTE_USES] = argument9;
global.arte[i,ARTE_POINTS] = argument10;