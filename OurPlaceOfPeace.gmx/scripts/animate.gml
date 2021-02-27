///animate(sprite, time_or_0, image_speed_or_0, DIR_direction)
tmp03 = instance_create(x,y,obj_animate);
(tmp03).gfx = argument0;
if(argument2 != 0)
{
    (tmp03).spd = argument2;
}
else
{
    (tmp03).spd = 1/3;
}
if(argument1 == 0)
{
    (tmp03).time = (1 / (tmp03).spd) * sprite_get_number(argument0);
}
else
{
    (tmp03).time = argument1;
}
(tmp03).v_dir = argument3;
