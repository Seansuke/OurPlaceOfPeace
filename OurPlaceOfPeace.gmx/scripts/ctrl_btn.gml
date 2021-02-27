//CONTROL
switch(global.ctrl[plyr,BTN_TYPE])
{
    case "Keyboard":
        if(keyboard_check(global.ctrl[plyr,BTN_ATTACK]) == true)
        {
            return BTN_ATTACK;
        }
        else if(keyboard_check(global.ctrl[plyr,BTN_GUARD]) == true)
        {
            return BTN_GUARD;
        }
        else if(keyboard_check(global.ctrl[plyr,BTN_ARTES1]) == true)
        {
            return BTN_ARTES1;
        }
        else if(keyboard_check(global.ctrl[plyr,BTN_ARTES2]) == true)
        {
            return BTN_ARTES2;
        }
        else
        {
            return 0;
        }
    break;
    case "Gamepad1":
        if(joystick_check_button(1,global.ctrl[plyr,BTN_ATTACK]) == true)
        {
            return BTN_ATTACK;
        }
        else if(joystick_check_button(1,global.ctrl[plyr,BTN_GUARD]) == true)
        {
            return BTN_GUARD;
        }
        else if(joystick_check_button(1,global.ctrl[plyr,BTN_ARTES1]) == true)
        {
            return BTN_ARTES1;
        }
        else if(joystick_check_button(1,global.ctrl[plyr,BTN_ARTES2]) == true)
        {
            return BTN_ARTES2;
        }
        else
        {
            return 0;
        }
    break;
    case "Gamepad2":
        if(joystick_check_button(2,global.ctrl[plyr,BTN_ATTACK]) == true)
        {
            return BTN_ATTACK;
        }
        else if(joystick_check_button(2,global.ctrl[plyr,BTN_GUARD]) == true)
        {
            return BTN_GUARD;
        }
        else if(joystick_check_button(2,global.ctrl[plyr,BTN_ARTES1]) == true)
        {
            return BTN_ARTES1;
        }
        else if(joystick_check_button(2,global.ctrl[plyr,BTN_ARTES2]) == true)
        {
            return BTN_ARTES2;
        }
        else
        {
            return 0;
        }
    break;
}
