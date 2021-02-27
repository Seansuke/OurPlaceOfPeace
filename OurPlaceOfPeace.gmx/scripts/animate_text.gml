///animate_text(txt, x, y);
tmp_anim = instance_create(argument1,argument2,obj_animate_text);
(tmp_anim).v_text = argument0;
(tmp_anim).alarm[0] = 5 + string_length(obj_animate_text) * 2;
