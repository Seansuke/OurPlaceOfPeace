if(global.menu == true){exit;}

//init
depth = -999999;
v_img += 1/3;
v_timer[1] += 1;
image_xscale = v_dir;
image_index = v_img;

//check player
if(instance_exists(ids) == false || ids == -1){
    instance_destroy();exit;}
    
//timer
if(v_timer[1] > v_timer[0]){
    scr_attack_destroy();
    exit;}

//damage cancel
if((ids).v_act == "damage" && v_type == "Physical"){
    scr_attack_destroy();
    exit;}

//effect effects
switch(effect)
{
    case "upthrow":
         v_dir2 = 90;
    break;
    case "attack":
            if(v_dir == 1)
            {
                v_dir2 = 25;
            }
            else
            {
                v_dir2 = 155;
            }
    break;
    case "throw":
    break;
}

//movement?
switch(v_type)
{
    case "Simple":
         scr_attack_simple();
    break;
    case "Physical":
         scr_attack_physical();
    break;
    case "Special":
         scr_attack_special();
    break;
    case "Tech":
         scr_attack_tech();
    break;
    default:
            animate_text("Type not found: ", x,y);
            scr_attack_destroy();
    break;
}
