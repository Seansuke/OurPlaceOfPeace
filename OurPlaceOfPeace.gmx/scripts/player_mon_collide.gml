if(other.rollHP > 0)
{
    if(other.x < x) {
        other.x -= 5;
    }
    else {
        other.x += 5;
    }
}

if(v_act == "guard") {
    other.x += v_dir * stat[PLY_DEF];
}
