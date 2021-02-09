//arte_new(player,name,gfx,             dmg,pow,wait,cost,lvl,desc);
arte_init();

//======================Sean======================
//melee
arte_new(Sean,"Smash",spr_sean_att,     10,10,   6,100,  1,"Hold [ARTE] to charge attack to push foes back.");
arte_new(Sean,"Wall",spr_wall,           5,20,  1,100,  3,"Foes that melee will be sent flying.");
arte_new(Sean,"Divide",spr_divide,      20,10,  9,300,  5,"Hold [ARTE] to charge attack to push foes back.");
//range
arte_new(Sean,"Wave",spr_wave,          15,10,  6,50,   1,"Produce a wave of pressure that pushes back foes.");
arte_new(Sean,"Uprise",spr_uprise,       7,15,  6,200,  2,"Force foes upward at a distance.");

//======================AD======================
//heal
arte_new(AD,"Medic",spr_medic,          5,100,  16,100, 1,"Slowly heal an ally as long as [ARTE] is held."); 
arte_new(AD,"Restore",spr_restore,      50,100, 48,200, 5,"Give an ally a burst of HP, hold [ARTE] to increase effect.");
//buff
arte_new(AD,"Might",spr_might,          10,100, 32,100, 3,"Ally will give more damage to foes.");     
arte_new(AD,"Endure",spr_endure,        10,100, 32,100, 2,"Ally will recieve less damage from foes.");
//offense
arte_new(AD,"Holy Beam",spr_holy,       50,20,  48,200, 1,"Blast foes with a condensation of holy energy.");

//======================Dan======================
//knife
arte_new(Dan,"Combat Knife",spr_knife,  15,15,  3,100,  1,"Quickly unleash a knife that pushes foes back.");
//arrows
arte_new(Dan,"Aimed Arrow",spr_arrow,   4,5,    9,100,  1,"Fire an arrow diagonally.");
arte_new(Dan,"Ice Arrow",spr_icearrow,  2,1,    9,100,  2,"Fire a fast but weak arrow infused with ice.");
arte_new(Dan,"Fire Arrow",spr_firearrow,9,10,   9,100,  3,"Fire a slow but strong arrow infused with fire.");

//======================John======================
//melee
arte_new(John,"Incapacitate",spr_thrust, 18,5,   3,200,  1,"Strike at such speed that stuns the opponent.");
//range
arte_new(John,"Jolt",spr_jolt,         23,2,   9,100,  1,"Call lightning from the sky.");

//======================Serena======================
// movement
arte_new(Serena,"Ocean's Whirlpool",spr_spin,           18,5, 3,100, 1,"Anti-aerial spin like flowing water.");
arte_new(Serena,"Wind's Pierce",spr_thrust,             18,2, 3,100, 1,"Slide through foes like the wind.");
arte_new(Serena,"Raging Hurricane",spr_hurricane,       18,2, 3,100, 2,"Tear through foes like a rising storm.");
arte_new(Serena,"Retreating Flame",spr_flame,           18,2, 3,100, 3,"Flicker from foes like a flame in the breeze.");
arte_new(Serena,"Descending Waterfall",spr_waterfall,   28,2, 3*4,200, 5,"Rise above your foes and rush them like a falling river.");

//======================James======================
// magic
arte_new(James,"Petal Storm",spr_petal_storm,30,2,   3,300,  1,"Spin flaming petals around for anti-air.");
arte_new(James,"Petal Beam",spr_petal_beam,  30,2,   3,300,  1,"Beam out flaming petals.");


//======================Monsters======================
arte_new(MAX_PLAYERS,"Strike",spr_icon,10,5,   6,100,  1,"");
