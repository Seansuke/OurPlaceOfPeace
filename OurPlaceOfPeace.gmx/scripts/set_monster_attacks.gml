#define set_monster_attacks
/// set_monster_attacks(foeId, attackName1, attackName2 etc...);
var foeId = argument[0];
for(var i = 1; i < argument_count; i++) {
    global.foeArte[foeId, i - 1] = argument[i];
}
global.foeArteCount[foeId] = argument_count - 1;

#define get_monster_arte
/// get_monster_arte(foeId)
var foeId = argument0;
var foeArteCount = global.foeArteCount[foeId];
var foeArteIndex = floor(random(foeArteCount));
return global.foeArte[foeId, foeArteIndex];
