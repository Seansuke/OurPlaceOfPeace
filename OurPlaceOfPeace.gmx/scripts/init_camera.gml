
depth = -3000;
fixPlayers = false;
v_timer = -1;
init_battle_players();
init_battle_monsters();
audio_play_arena();

if(ds_list_size(global.touchList) > 0) 
{
    // Refresh Touch Controls since the digital keys are not persistent.
    TouchControlsOff();
    TouchControlsOn();    
}
