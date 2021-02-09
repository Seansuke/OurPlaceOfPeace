switch(v_typeB)
{
    case "TargetDir":
         x += cos(degtorad(v_dir2)) * real(amove);
         y -= sin(degtorad(v_dir2)) * real(amove);
    break;
    default:
            x = (ids).x;
            y = (ids).y;
    break;
}
