/// set_simple_monster(monsterId, runGfx, attackGfx)
for(var i = 0;i < GFX_MAX; i++) {
    global.foeGfx[argument0, i] = argument1;
}
global.foeGfx[argument0, GFX_ATTACK] = argument2;
global.foeGfx[argument0, GFX_ATTACK_SIDE] = global.foeGfx[argument0, GFX_ATTACK];
global.foeGfx[argument0, GFX_ATTACK_UP] = global.foeGfx[argument0, GFX_ATTACK];
global.foeGfx[argument0, GFX_ATTACK_DOWN] = global.foeGfx[argument0, GFX_ATTACK];
global.foeGfx[argument0, GFX_ATTACK_AIR] = global.foeGfx[argument0, GFX_ATTACK];
global.foeGfx[argument0, GFX_MAX] = global.foeGfx[argument0, GFX_ATTACK];
