//CONTROL
switch(global.ctrl[combatId,BTN_TYPE])
{
    case BTN_TYPE_KEYBOARD:
        if(keyboard_check(global.ctrl[combatId,BTN_ATTACK]) == true)
        {
            return BTN_ATTACK;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_GUARD]) == true)
        {
            return BTN_GUARD;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_ARTES1]) == true)
        {
            return BTN_ARTES1;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_ARTES2]) == true)
        {
            return BTN_ARTES2;
        }
        else
        {
            return 0;
        }
    break;
    case BTN_TYPE_GAMEPAD:
        if(joystick_check_button(1,global.ctrl[combatId,BTN_ATTACK]) == true)
        {
            return BTN_ATTACK;
        }
        else if(joystick_check_button(1,global.ctrl[combatId,BTN_GUARD]) == true)
        {
            return BTN_GUARD;
        }
        else if(joystick_check_button(1,global.ctrl[combatId,BTN_ARTES1]) == true)
        {
            return BTN_ARTES1;
        }
        else if(joystick_check_button(1,global.ctrl[combatId,BTN_ARTES2]) == true)
        {
            return BTN_ARTES2;
        }
        else
        {
            return 0;
        }
    break;
}
