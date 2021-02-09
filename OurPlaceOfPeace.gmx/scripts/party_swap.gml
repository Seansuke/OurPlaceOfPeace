tmp_num1 = argument0;
tmp_num2 = argument1;
for(tmp_i = PTY_HP;tmp_i < PTY_MAX;tmp_i += 1)
{
    tmp_data = party_get(tmp_num1,tmp_i);
    global.pty[tmp_num1,tmp_i] = party_get(tmp_num2,tmp_i);
    global.pty[tmp_num2,tmp_i] = tmp_data;
}
