///scr_player_arte_create( );

animate_text(skill[ARTE_NAME], x,y+60);

//create
tmp_id = instance_create(x,y,obj_attack);
(tmp_id).sprite_index = skill[ARTE_GFX];//graphic
(tmp_id).v_dir = v_dir;//direction
(tmp_id).v_type = "Physical";//attack type
(tmp_id).v_typeB = "Simple";//attack2 type
(tmp_id).visible = true;//visible
(tmp_id).amove = -1;
(tmp_id).isArte = true;
(tmp_id).effect = ARTE_EFFECT_OUT;
(tmp_id).v_timer[0] = 3*5;//max time until departure
(tmp_id).attack = stat[PLY_AATT] + bonusATT;//attack dmg
(tmp_id).attackMultiplier = skill[ARTE_DMG];
(tmp_id).pushPower = stat[PLY_POW] * skill[ARTE_POW];//throwing power
(tmp_id).ids = id;//id of user
(tmp_id).plyr = playerNum;//plyr number
(tmp_id).v_team = "Players";//plyr number

for(var arteI = 0; arteI < ARTE_MAX; arteI++) {
    (tmp_id).arte[arteI] = skill[arteI];
}

(tmp_id).effect = skill[ARTE_EFFECT];

switch(skill[ARTE_NAME])
{
    case "Wave":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
        (tmp_id).amove = 20;
    break;
    case "Smash":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).visible = false;
        (tmp_id).v_timer[0] = 3*5 - skill[ARTE_WAIT];    //off of wait time
        (tmp_id).stat[PLY_POW] += 0.5 * stat[PLY_POW] * v_charge / v_chargeMax;
        (tmp_id).visible = false; // No double sprites.
    break;
    case "Uprise":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Place";    //attack2 type
        (tmp_id).v_timer[0] = 3*6;    //off of wait time
        (tmp_id).amove = 60;
    break;
    case "Wall":
        (tmp_id).v_timer[0] = 3*7;    //off of wait time
    break;
    case "Shove":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3;    //off of wait time
        (tmp_id).visible = false; // No double sprites.
    break;
    case "Divide":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*4;    //off of wait time
        (tmp_id).stat[PLY_POW] += 0.5 * stat[PLY_POW] * v_charge / v_chargeMax;
    break;
    case "Medic":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;  
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*6;    //off of wait time
    break;
    case "Restore":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*16;    //off of wait time
    break;
    case "Chill Wounds":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*16;    //off of wait time
    break;
    case "Might":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*15;    //off of wait time
    break;
    case "Tension":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = x;
        (tmp_id).y = y;
        (tmp_id).v_timer[0] = skill[ARTE_WAIT];    //off of wait time
    break;
    case "Endure":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*15;    //off of wait time
    break;
    case "Frosted Defense":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*15;    //off of wait time
    break;
    case "Holy Beam":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*9;    //off of wait time
    break;
    case "Combat Knife":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3*2;    //off of wait time
        (tmp_id).visible = false;
    break;
    case "Aimed Arrow":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Vertical Gravity Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*10;    //off of wait time
        (tmp_id).amove = 10;
    break;
    case "Ice Arrow":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Grav Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*10;    //off of wait time
        (tmp_id).amove = 20;
    break;
    case "Fire Arrow":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Grav Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*10;    //off of wait time
        (tmp_id).amove = 5;
    break;
    case "Incapacitate":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Jolt":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
        (tmp_id).amove = 20;
    break;
    case "Ocean's Whirlpool":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Raging Hurricane":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Wind's Pierce":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Falling Tree":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Retreating Flame":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Descending Waterfall":
        (tmp_id).v_type = "Physical";
        (tmp_id).v_typeB = "Simple";
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*8;    //off of wait time
    break;
    case "Petal Storm":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*9;    //off of wait time
    break;
    case "Petal Beam":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*9;    //off of wait time
    break;
    case "Bullet Blaze":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
        (tmp_id).amove = 30;
    break;
    case "Cross Gun":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
        (tmp_id).amove = 30;
    break;
    case "Rushing Leaves":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*7;    //off of wait time
        (tmp_id).amove = 7;
    break;
}

v_charge = 0;
v_uber = 0;

return tmp_id;
