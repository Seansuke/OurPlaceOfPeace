/*
scr_player_arte_create( );
*/
animate_text(skill[ARTE_NAME], 0,60);

//create
tmp_id = instance_create(x,y,obj_attack);
(tmp_id).sprite_index = skill[ARTE_GFX];//graphic
(tmp_id).v_dir = v_dir;//direction
(tmp_id).v_type = "Physical";//attack type
(tmp_id).v_typeB = "Simple";//attack2 type
(tmp_id).visible = true;//visible
(tmp_id).amove = -1;
(tmp_id).effect = "out";
(tmp_id).v_timer[0] = 3*5;//max time until departure
(tmp_id).DMG = skill[ARTE_DMG] + bonusATT;//attack dmg
(tmp_id).POW = skill[ARTE_POW];//throwing power
(tmp_id).ids = id;//id of user
(tmp_id).plyr = playerNum;//plyr number
(tmp_id).v_team = "Players";//plyr number

switch(skill[ARTE_NAME])
{
    case "Wave":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Shot";    //attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
        (tmp_id).amove = 20;
        (tmp_id).effect = "back";
    break;
    case "Smash":
        (tmp_id).visible = false;
        (tmp_id).v_timer[0] = 3*5 - skill[ARTE_WAIT];    //off of wait time
        (tmp_id).POW += v_charge / 3;   //out of 30
        (tmp_id).effect = "back";
    break;
    case "Uprise":
        (tmp_id).v_type = "Special";   //attack type
        (tmp_id).v_typeB = "Place";    //attack2 type
        (tmp_id).v_timer[0] = 3*6;    //off of wait time
        (tmp_id).amove = 60;
        (tmp_id).effect = "upthrow";
    break;
    case "Wall":
        (tmp_id).v_timer[0] = 3*7;    //off of wait time
        (tmp_id).effect = "back";
    break;
    case "Divide":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*4;    //off of wait time
        (tmp_id).POW += v_charge / 3;   //out of 30
    break;
    case "Medic":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;  
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*6;    //off of wait time
        (tmp_id).effect = "heal";
    break;
    case "Restore":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*16;    //off of wait time
        (tmp_id).effect = "heal";
    break;
    case "Might":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).DMG = skill[ARTE_DMG];
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*15;    //off of wait time
        (tmp_id).effect = "att buff";
    break;
    case "Endure":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).DMG = skill[ARTE_DMG];
        (tmp_id).x = (obj_camera.ids[v_ally_target]).x;
        (tmp_id).y = (obj_camera.ids[v_ally_target]).y;
        (tmp_id).v_timer[0] = 3*15;    //off of wait time
        (tmp_id).effect = "def buff";
    break;
    case "Holy Beam":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*9;    //off of wait time
    break;
    case "Combat Knife":
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
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Raging Hurricane":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Wind's Pierce":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Retreating Flame":
        (tmp_id).v_typeB = "Self";//attack2 type
        (tmp_id).v_timer[0] = 3*5;    //off of wait time
    break;
    case "Descending Waterfall":
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
}

return tmp_id;
