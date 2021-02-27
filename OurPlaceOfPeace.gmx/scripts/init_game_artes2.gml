
arte_init();

//======================Sean======================
//melee
arte_new(Sean,"Smash",spr_sean_att_up,GFX_ATTACK_UP,    
    10,10,   6,100,  1,
    "Hold [ARTE] to charge attack to push foes back.");
arte_new(Sean,"Wall",spr_wall,GFX_DEF,                  
    5,20,    1,100,  3,
    "Foes that melee will be sent flying.");
arte_new(Sean,"Divide",spr_divide,GFX_ATTACK_AIR,                     
    20,10,  9,300,  5,
    "Hold [ARTE] to charge attack to push foes back.");
//range
arte_new(Sean,"Wave",spr_wave,GFX_ATTACK_UP,          
    15,10,  6,50,   1,
    "Produce a wave of pressure that pushes back foes.");
arte_new(Sean,"Uprise",spr_uprise,GFX_ATTACK_UP,       
    7,15,  6,200,  2,
    "Force foes upward at a distance.");

//======================AD======================
//heal
arte_new(AD,"Medic",spr_medic,GFX_CAST,          
    5,100,  16,100, 1,
    "Hold [ARTE] to regenerate an ally's HP."); 
arte_new(AD,"Restore",spr_restore,GFX_CAST,      
    50,100, 48,200, 5,
    "Give an ally a burst of HP, hold [ARTE] to increase effect.");
//buff
arte_new(AD,"Might",spr_might,GFX_CAST,          
    10,100, 32,100, 3,
    "Ally will give more damage to foes.");     
arte_new(AD,"Endure",spr_endure,GFX_CAST,        
    10,100, 32,100, 2,
    "Ally will recieve less damage from foes.");
//offense
arte_new(AD,"Holy Beam",spr_holy,GFX_CAST,       
    50,20,  48,200, 1,
    "Blast foes with a condensation of holy energy.");

//======================Dan======================
//knife
arte_new(Dan,"Combat Knife",spr_dan_knife,GFX_CAST,      
    15,15,  3,100,  1,
    "Quickly unleash a knife that pushes foes back.");
//arrows
arte_new(Dan,"Aimed Arrow",spr_arrow,GFX_ATTACK_SIDE,     
    4,5,    9,100,  1,
    "Fire an arrow diagonally.");
arte_new(Dan,"Ice Arrow",spr_icearrow,GFX_ATTACK_SIDE,    
    2,1,    9,100,  2,
    "Fire a fast but weak arrow infused with ice.");
arte_new(Dan,"Fire Arrow",spr_firearrow,GFX_ATTACK_SIDE,  
    9,10,   9,100,  3,
    "Fire a slow but strong arrow infused with fire.");

//======================John======================
//melee
arte_new(John,"Incapacitate",spr_thrust,GFX_ATTACK_SIDE,  
    18,5,   3,200,  1,
    "Strike at such speed that stuns the opponent.");
//range
arte_new(John,"Jolt",spr_jolt,GFX_CAST,                   
    23,2,   9,100,  1,
    "Call lightning from the sky.");

//======================Serena======================
// movement
arte_new(Serena,"Ocean's Whirlpool",spr_spin,GFX_ATTACK_AIR,            
    18,5, 3,100, 1,
    "Anti-aerial spin like flowing water.");
arte_new(Serena,"Wind's Pierce",spr_thrust,GFX_ATTACK_SIDE,             
    18,2, 3,100, 1,
    "Slide through foes like the wind.");
arte_new(Serena,"Raging Hurricane",spr_hurricane,GFX_ATTACK_UP,             
    18,2, 3,100, 2,
    "Tear through foes like a rising storm.");
arte_new(Serena,"Retreating Flame",spr_flame,GFX_ATTACK_UP,             
    18,2, 3,100, 3,
    "Flicker from foes like a flame in the breeze.");
arte_new(Serena,"Descending Waterfall",spr_waterfall,GFX_ATTACK_AIR,    
    28,2, 3*4,200, 5,
    "Rise above your foes and rush them like a falling river.");

//======================James======================
// magic
arte_new(James,"Petal Storm",spr_petal_storm,GFX_CAST, 
    30,2,   3,300,  1,
    "Spin flaming petals around for anti-air.");
arte_new(James,"Petal Beam",spr_petal_beam,GFX_CAST,   
    30,2,   3,300,  1,
    "Beam out flaming petals.");

//======================Taliko======================
arte_new(Taliko,"Chill Wounds",ClearIceBlockSprite,GFX_CAST,           
    25,100,  32,200, 1,
    "Heal an ally with a small burst of HP."); 
arte_new(Taliko,"Frosted Defense",ClearIceWallSprite,GFX_CAST,        
    10,100, 32,100, 1,
    "Ally will recieve less damage from foes.");

//======================Noel======================
arte_new(Noel,"Shove",NoelGrabSprite,GFX_CAST, 
    32,20,  12,100, 1,
    "Push a foe far away."); 
arte_new(Noel,"Tension",spr_might,GFX_DEF, 
    10,100, 32,100, 1,
    "Increase your attack power through tense combat.");

//======================Alister======================
arte_new(Alister,"Bullet Blaze",BulletSprite,GFX_CAST, 
    1,0,  3,20, 1,
    "Fill your foes with lead."); 
arte_new(Alister,"Cross Gun",BulletSprite,GFX_CAST, 
    1,0,  3,20, 1,
    "Fill foes with lead from both sides.");

//======================Raka======================
arte_new(Raka,"Rushing Leaves",ShortWindSprite,GFX_CAST,
    6,15,  9,100, 1,
    "Blow away your foes with the wind from your leaf fan."); 
arte_new(Raka,"Falling Tree",spr_thrust,GFX_ATTACK_DOWN,        
    16,0,  9,200, 1,
    "Land a powerful strike on your foe from the sky.");

//======================Chloe======================
arte_new(Chloe,"Bullet Blaze",BulletSprite,GFX_CAST,           
    3,0,  9,20, 1,
    "Fill your foes with lead."); 
arte_new(Chloe,"Cross Gun",BulletSprite,GFX_CAST,        
    3,0,  9,20, 1,
    "Fill foes with lead from both sides.");

//======================Monsters======================
arte_new(MAX_PLAYERS,"Strike",spr_icon,spr_icon,
    10,5,   6,100,  1,
    "");
