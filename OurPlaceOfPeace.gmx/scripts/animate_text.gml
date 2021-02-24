///animate_text(txt, x, y);
tmp_anim = instance_create(x,y,obj_animate_text);
(tmp_anim).v_text = argument0;
(tmp_anim).alarm[0] = 35;
(tmp_anim).x += argument1;
(tmp_anim).y += argument2;
