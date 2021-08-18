//CONTROLS
if(combatId == 0 && virtualHorizontalDirection >= 0) {
    var tempVirtualHorizontalDirection = virtualHorizontalDirection
    virtualHorizontalDirection = -1;
    return tempVirtualHorizontalDirection;
}
switch(global.ctrl[combatId,BTN_TYPE])
{
    case BTN_TYPE_KEYBOARD:
        if(keyboard_check(global.ctrl[combatId,BTN_RIGHT]) == true)
        {
            return BTN_RIGHT;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_LEFT]) == true)
        {
            return BTN_LEFT;
        }
        else
        {
            return 0;
        }
    break;
    case BTN_TYPE_GAMEPAD:
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
}
