if(global.menu == true)
    {exit;}

//if players were swapped fix them
if(fixPlayers == true)
{
    newPty[1] = party_get(1,PTY_PLAYER);
    newPty[2] = party_get(2,PTY_PLAYER);
    newPty[3] = party_get(3,PTY_PLAYER);

    oldPlyr[1] = (ids[1]).playerNum;
    oldPlyr[2] = (ids[2]).playerNum;
    oldPlyr[3] = (ids[3]).playerNum;

    oldId[1] = ids[1];
    oldId[2] = ids[2];
    oldId[3] = ids[3];
    
    //match old players with new players and swap
    for(plyr=1;plyr<=3;plyr+=1)    {
        for(pty=1;pty<=3;pty+=1)        {
            if(oldPlyr[plyr] == newPty[pty])            {
                ids[pty] = oldId[plyr];
                (ids[pty]).plyr = pty;    }}}
                
    fixPlayers = false;
}

//center camera
camx = room_width;
cam2x = 0;

for(i = 1;i <= 3;i += 1)
{
    if(ids[i] != -1)
    {
        if(party_get((ids[i]).plyr,PTY_HMN) == "Human")
        {
            if((ids[i]).x < camx)
            {
                camx = (ids[i]).x;
            }
            if((ids[i]).x > cam2x)
            {
                cam2x = (ids[i]).x;
            }
        }
    }
}
x = (camx + cam2x) / 2;

//monsters dead?
for(i = 1;i <= 3;i += 1)
{
    if(instance_exists(mon[i]) == false)
    {
        mon[i] = -1;
    }
}

//battle over
if(mon[1] == -1 && mon[2] == -1 && mon[3] == -1)
{
    if(v_timer == -1)
        {v_timer = 100;}
    v_timer -= 1;
    if(v_timer == 99)
        {animate_text("VICTORY!",0,-100);}
    if(v_timer > 1)
        {exit;}
    global.monFight[1] = MAX_MONSTERS;
    global.monFight[2] = MAX_MONSTERS;
    global.monFight[3] = MAX_MONSTERS;
    for(partyNum = 1;partyNum <= 3;partyNum += 1)
        {party_set(partyNum, PTY_HP, (ids[partyNum]).rollHP);}
    room = rm_area_outskirts;
    audio_stop_sound(AccionBgm);
}
