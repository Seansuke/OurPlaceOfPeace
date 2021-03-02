//CONTROL
switch(global.ctrl[combatId,BTN_TYPE])
{
    case BTN_TYPE_KEYBOARD:
        if(keyboard_check(global.ctrl[combatId,BTN_ACTION]) == true)
        {
            return BTN_ACTION;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_TARGET]) == true)
        {
            return BTN_TARGET;
        }
        else if(keyboard_check(global.ctrl[combatId,BTN_MENU]) == true)
        {
            return BTN_MENU;
        }
        else
        {
            return 0;
        }
    break;
    case BTN_TYPE_GAMEPAD:
        if(joystick_check_button(1,global.ctrl[combatId,BTN_ACTION]) == true)
        {
            return BTN_ACTION;
        }
        else if(joystick_check_button(1,global.ctrl[combatId,BTN_TARGET]) == true)
        {
            return BTN_TARGET;
        }
        else if(joystick_check_button(1,global.ctrl[combatId,BTN_MENU]) == true)
        {
            return BTN_MENU;
        }
        else
        {
            return 0;
        }
    break;
}
