#define arte_find
for(i = 0;
    global.arte[i,ARTE_NAME] != argument0 && global.arte[i,ARTE_NAME] != "";
    i += 1)
{
    //search for next spot or same name
}

return i;

#define arte_find_by_player
///arte_find_by_player(arteName, playerId);
for(i = 0;
    global.arte[i,ARTE_NAME] != argument0 
        && global.arte[i,ARTE_PLAYER] != argument1
        && global.arte[i,ARTE_NAME] != "";
    i += 1)
{
    //search for next spot or same name
}

return i;