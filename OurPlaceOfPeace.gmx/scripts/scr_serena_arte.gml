
switch(skill[ARTE_NAME])
{
    case "Ocean's Whirlpool":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y + getMoveSpeed()) == true){y += getMoveSpeed()};} //dash down

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Wind's Pierce":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x + getMoveSpeed() * v_dir,y) == true){x += getMoveSpeed() * v_dir};} //dash forward

        if(v_timer > 3*4)
            {scr_player_arte_create();} //create attack
            
        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Raging Hurricane":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y - getMoveSpeed()) == true){y -= getMoveSpeed()};} //dash up

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Retreating Flame":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x - getMoveSpeed() * v_dir,y) == true){x -= getMoveSpeed() * v_dir};} //dash backwards


        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Descending Waterfall":
        if(floor(v_timer) < skill[ARTE_WAIT] + 1)
        {
            gfxId = GFX_RUN;
            v_gfx2 = gfx[gfxId];
            if(place_clear(x,y - getMoveSpeed()) == true){y -= getMoveSpeed()};
        } //dash up

        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
        {
            gfxId = skill[ARTE_USER_GFX];
            v_gfx2 = gfx[gfxId];

            if(place_clear(x,y + getMoveSpeed()) == true){y += getMoveSpeed()};
        } //dash down

        if(v_timer > 3*5)
            {v_act = "idle";}
    break;
    case "Rushing Leaves":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > skill[ARTE_WAIT] + 3*4)
            {v_act = "idle";}
    break;
    case "Friendly Fowl":
        
        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(v_timer > skill[ARTE_WAIT] + 3*4)
            {v_act = "idle";}
    break;
    case "Falling Tree":
        if(floor(v_timer) < skill[ARTE_WAIT] + 1)
        {
            gfxId = GFX_RUN;
            v_gfx2 = gfx[gfxId];
            if(place_clear(x,y - 1.5 * getMoveSpeed()) == true){y -= 1.5 * getMoveSpeed()};
        } //dash up

        if(floor(v_timer) == skill[ARTE_WAIT] + 1)
            {scr_player_arte_create();} //create attack

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
        {
            gfxId = skill[ARTE_USER_GFX];
            v_gfx2 = gfx[gfxId];

            //dash down-forward
            if(place_clear(x + 1.5 * getMoveSpeed() * v_dir, y)){
                x += 1.5 * getMoveSpeed() * v_dir;
            };
            if(place_clear(x, y + 1.5 * getMoveSpeed())){
                y += 1.5 * getMoveSpeed();
            };
        } 

        if(v_timer > skill[ARTE_WAIT] + 3*3)
            {v_act = "idle";}
    break;
}

