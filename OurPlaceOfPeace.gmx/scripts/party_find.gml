for(i = 1;i <= 3;i += 1)
{
    if(name_get(party_get(i,PTY_PLAYER)) == argument0)
    {
        return i;
    }
}
return 0;
