for(i = 0;i <= MAX_PLAYERS;i += 1)
{
    if(name_get(i) == argument0)
    {
        return i;
    }
}
return 0;
