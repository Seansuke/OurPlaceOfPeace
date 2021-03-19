/// displayDialogue(facePlayerId_or_noone, spriteDisplayed_or_noone, message)

var facePlayerId = argument0;
var spriteDisplayed = argument1;
var message = argument2;

var dialogueX = view_xview[0];
var dialogueY = view_yview[0];

var dialogueWidth = view_wview[0];

if(facePlayerId != noone) {
    var playerSprite = global.face[facePlayerId];
    var leftXOffset = sprite_get_xoffset(playerSprite);
    var topYOffset = sprite_get_yoffset(playerSprite);
    draw_sprite(playerSprite, -1, dialogueX + leftXOffset ,dialogueY + topYOffset);
    dialogueX += sprite_get_width(playerSprite); 
}
if(spriteDisplayed != noone) {
    var leftXOffset = sprite_get_xoffset(spriteDisplayed);
    var topYOffset = sprite_get_yoffset(spriteDisplayed);
    draw_sprite(spriteDisplayed, -1, dialogueX + leftXOffset, dialogueY + topYOffset);
    dialogueX += sprite_get_width(spriteDisplayed); 
}
draw_wrapped_colored_text(dialogueX, dialogueY, message, dialogueWidth);

