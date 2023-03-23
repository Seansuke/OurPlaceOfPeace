prevx = x;
prevy = y;
x += v_dir * real(amove);
y -= real(amove);

//as timer passes, accelerate towards the ground
y += v_timer[1] * 0.75;

if(prevy != y) {
    v_dir2 = tan((prevy - y) / (prevx - x)) * 180/pi;
}
