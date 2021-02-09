//instance_destroy(DPadObject);
//instance_destroy(AimCircleObject);

for(var i = 0; i < ds_list_size(global.touchList); i += 1)
{
    var node = ds_list_find_value(global.touchList, i);
    virtual_key_hide(node);
    virtual_key_delete(node);
}
ds_list_clear(global.touchList);

