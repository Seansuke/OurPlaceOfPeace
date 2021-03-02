//CONTROL
switch(global.ctrl[combatId,BTN_TYPE])
{
    case BTN_TYPE_KEYBOARD:
        if(keyboard_check(global.ctrl[combatId,BTN_UP]) == true)
        {
            return BTN_UP;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_DOWN]) == true)
        {
            return BTN_DOWN;
        }
        else
        {
            return 0;
        }
    break;
    case BTN_TYPE_GAMEPAD:
        switch(joystick_direction(1))
        {
            case vk_numpad8:
                return BTN_UP;
            break;
            case vk_numpad7:
                return BTN_UP;
            break;
            case vk_numpad9:
                return BTN_UP;
            break;
            case vk_numpad2:
                return BTN_DOWN;
            break;
            case vk_numpad3:
                return BTN_DOWN;
            break;
            case vk_numpad1:
                return BTN_DOWN;
            break;
            default:
                    if(joystick_has_pov(1) == true)
                    {
                        if((joystick_pov(1) > 270 || joystick_pov(1) < 90) && joystick_pov(1) != -1)
                        {
                            return BTN_UP;
                        }
                        else if(joystick_pov(1) > 90 && joystick_pov(1) < 270)
                        {
                            return BTN_DOWN;
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
