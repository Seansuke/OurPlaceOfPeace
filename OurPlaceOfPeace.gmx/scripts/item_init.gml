///item_init(itemId, ARTE_EFFECT_type, name, description)
var itemId = argument0;
var ARTE_EFFECT_type = argument1;
var attack = argument2;
var name = argument3;
var description = argument4;

global.itemCount[itemId] = 0;
global.itemType[itemId] = ARTE_EFFECT_type;
global.itemAttack[itemId] = attack;
global.itemName[itemId] = name;
global.itemDesc[itemId] = description;
