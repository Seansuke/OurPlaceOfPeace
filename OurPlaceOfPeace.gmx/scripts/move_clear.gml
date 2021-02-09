//attempt to move forward while on ground

//check if a fall
if(place_clear(x + argument0 * v_dir,y + 17) == true && place_clear(x + argument0 * v_dir,y + 16) == true)
{
   //forward
   if(place_clear(x + argument0 * v_dir,y) == true)
   {
       x += argument0 * v_dir;
       return true;
   }
}

//down forward
for(tmp03_i = 16;tmp03_i > 0;tmp03_i -= 1)
{
    if(place_clear(x + argument0 * v_dir,y + tmp03_i) == true)
    {
        x += argument0 * v_dir;
        y += tmp03_i;
        return true;
    }
}

//forward
for(tmp03_i = argument0;tmp03_i > 0;tmp03_i -= 1)
{
    if(place_clear(x + tmp03_i * v_dir,y) == true)
    {
        x += tmp03_i * v_dir;
        return true;
    }
}

//up forward
for(tmp03_i = 1;tmp03_i < 17;tmp03_i += 1)
{
    if(place_clear(x + argument0 * v_dir,y - tmp03_i) == true)
    {
        x += argument0 * v_dir;
        y -= tmp03_i;
        return true;
    }
}

return false;
