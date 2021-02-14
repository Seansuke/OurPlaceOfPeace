if(ctrl_press(BTN_MENU) == true)    //menu
{
    global.menu = true;
    instance_create(view_xview[0] + 20,view_yview[0] + 32,TouchControlsObject);
    for(i = 1;i <= 3;i += 1)
    {
        tmp = instance_create(view_xview[0] + 20+85*i,view_yview[0] + 32,obj_controls);
        (tmp).v_plyr = i;
    }
    instance_create(view_xview[0] + 5,view_yview[0] + 5,obj_areaMenu_artes_desc);
    instance_create(view_xview[0] + 5,view_yview[0] + 5,obj_areaMenu_stats_desc);
    menuPos = 1;
    subMenu = "Main";
    subMenuPos = 1;
    lastMenuPos = ds_map_create();
    menu_call(subMenu);
    return true;
}
return false;
