#define arte_find
///arte_find(arteName)
for(var arteId = 0;arteId < global.maxArte;arteId++) {
    //search for next spot or same name
   if(global.arte[arteId, ARTE_NAME] == argument0) {
        return arteId;
   }
}

return undefined;

#define arte_find_by_player
///arte_find_by_player(arteName, playerId)
for(var arteId = 0; arteId < global.maxArte; arteId += 1) {
   if(global.arte[arteId,ARTE_NAME] != argument0 
        && global.arte[arteId,ARTE_PLAYER] != argument1) 
    {
        return arteId;
   }
}

return undefined;
