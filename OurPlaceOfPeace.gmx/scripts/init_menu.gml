if(ctrl_press(BTN_MENU) == true)    //menu
{
    instance_deactivate_all(self);
    global.menu = true;
    instance_create(getMenuXPosition(),view_yview[0] + 32,TouchControlsObject);
    for(var i = 0;i < PTY_AMNT;i += 1)
    {
        tmp = instance_create(getMenuXPosition()+85*(i+1),view_yview[0] + 32,obj_controls);
        (tmp).combatId = i;
    }
    instance_create(getMenuXPosition(),view_yview[0] + 5,obj_areaMenu_stats_desc);
    instance_create(getMenuXPosition(),view_yview[0] + 5,obj_areaMenu_artes_desc);

    menuPos = 0;
    subMenu = "Main";
    subMenuPos = 1;
    maxMenu = 0;
    previousMouseY = -1;
    lastMenuPos = ds_map_create();
    menu_call(subMenu);
    return true;
}
instance_activate_all();
return false;
