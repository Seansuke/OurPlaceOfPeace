
switch(skill[ARTE_NAME])
{
    case "Ocean's Whirlpool":
        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y + getMoveSpeed()) == true){y += getMoveSpeed()};} //dash down

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Wind's Pierce":
        
        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x + getMoveSpeed() * v_dir,y) == true){x += getMoveSpeed() * v_dir};} //dash forward

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Raging Hurricane":

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x,y - getMoveSpeed()) == true){y -= getMoveSpeed()};} //dash up

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Retreating Flame":
        
        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
            {if(place_clear(x - getMoveSpeed() * v_dir,y) == true){x -= getMoveSpeed() * v_dir};} //dash backwards

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Descending Waterfall":
        if(floor(v_timer) < skill[ARTE_WAIT] + 1)
        {
            gfxId = GFX_RUN;
            v_gfx2 = gfx[gfxId];
            if(place_clear(x,y - getMoveSpeed()) == true){y -= getMoveSpeed()};
        } //dash up

        if(floor(v_timer) > skill[ARTE_WAIT] + 1)
        {
            gfxId = skill[ARTE_USER_GFX];
            v_gfx2 = gfx[gfxId];

            if(place_clear(x,y + getMoveSpeed()) == true){y += getMoveSpeed()};
        } //dash down

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Rushing Leaves":

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Friendly Fowl":

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
    case "Falling Tree":
        if(floor(v_timer) < skill[ARTE_WAIT] + 1)
        {
            gfxId = GFX_RUN;
            v_gfx2 = gfx[gfxId];
            if(place_clear(x,y - 1.5 * getMoveSpeed()) == true){y -= 1.5 * getMoveSpeed()};
        } //dash up

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

        if(floor(v_timer) == ceil(skill[ARTE_WAIT] + 1)) {
            scr_player_arte_create();
        }
    
        if(floor(v_timer) > ceil(skill[ARTE_WAIT] + skill[ARTE_POST_WAIT])) {
            v_act = "idle";
        }
    break;
}

