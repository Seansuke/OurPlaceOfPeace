//CONTROL
switch(global.ctrl[plyr,BTN_TYPE])
{
    case "Keyboard":
        if(keyboard_check(global.ctrl[plyr,BTN_ACTION]) == true)
        {
            return BTN_ACTION;
        }
        else if(keyboard_check(global.ctrl[plyr,BTN_TARGET]) == true)
        {
            return BTN_TARGET;
        }
        else if(keyboard_check(global.ctrl[plyr,BTN_MENU]) == true)
        {
            return BTN_MENU;
        }
        else
        {
            return 0;
        }
    break;
    case "Gamepad1":
        if(joystick_check_button(1,global.ctrl[plyr,BTN_ACTION]) == true)
        {
            return BTN_ACTION;
        }
        else if(joystick_check_button(1,global.ctrl[plyr,BTN_TARGET]) == true)
        {
            return BTN_TARGET;
        }
        else if(joystick_check_button(1,global.ctrl[plyr,BTN_MENU]) == true)
        {
            return BTN_MENU;
        }
        else
        {
            return 0;
        }
    break;
    case "Gamepad2":
        if(joystick_check_button(2,global.ctrl[plyr,BTN_ACTION]) == true)
        {
            return BTN_ACTION;
        }
        else if(joystick_check_button(2,global.ctrl[plyr,BTN_TARGET]) == true)
        {
            return BTN_TARGET;
        }
        else if(joystick_check_button(2,global.ctrl[plyr,BTN_MENU]) == true)
        {
            return BTN_MENU;
        }
        else
        {
            return 0;
        }
    break;
}
