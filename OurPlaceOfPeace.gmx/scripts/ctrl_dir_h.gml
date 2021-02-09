//CONTROLS
switch(global.ctrl[plyr,BTN_TYPE])
{
    case "Keyboard":
        if(keyboard_check_direct(global.ctrl[plyr,BTN_RIGHT]) == true)
        {
            return BTN_RIGHT;
        }
        else if(keyboard_check_direct(global.ctrl[plyr,BTN_LEFT]) == true)
        {
            return BTN_LEFT;
        }
        else
        {
            return 0;
        }
    break;
    case "Gamepad1":
        switch(joystick_direction(1))
        {
            case vk_numpad9:
                return BTN_RIGHT;
            break;
            case vk_numpad6:
                return BTN_RIGHT;
            break;
            case vk_numpad3:
                return BTN_RIGHT;
            break;
            case vk_numpad7:
                return BTN_LEFT;
            break;
            case vk_numpad4:
                return BTN_LEFT;
            break;
            case vk_numpad1:
                return BTN_LEFT;
            break;
            default:
                    if(joystick_has_pov(1) == true)
                    {
                        if(joystick_pov(1) > 0 && joystick_pov(1) < 180)
                        {
                            return BTN_RIGHT;
                        }
                        else if(joystick_pov(1) > 180 && joystick_pov(1) < 360)
                        {
                            return BTN_LEFT;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return 0;
                    }
            break;
        }
    break;
    case "Gamepad2":
        switch(joystick_direction(2))
        {
            case vk_numpad9:
                return BTN_RIGHT;
            break;
            case vk_numpad6:
                return BTN_RIGHT;
            break;
            case vk_numpad3:
                return BTN_RIGHT;
            break;
            case vk_numpad7:
                return BTN_LEFT;
            break;
            case vk_numpad4:
                return BTN_LEFT;
            break;
            case vk_numpad1:
                return BTN_LEFT;
            break;
            default:
                    if(joystick_has_pov(2) == true)
                    {
                        if(joystick_pov(2) > 0 && joystick_pov(2) < 180)
                        {
                            return BTN_RIGHT;
                        }
                        else if(joystick_pov(2) > 180 && joystick_pov(2) < 360)
                        {
                            return BTN_LEFT;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return 0;
                    }
            break;
        }
    break;
}
