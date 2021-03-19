/// @description draw_wrapped_colored_text(x, y, text, width, [length], [height], [align, mode])
/// @arg {real}        x        X-position
/// @arg {real}        y        Y-position
/// @arg {string}    text    Text to draw
///    @arg {real}        width    Width to wrap within
/// @arg {real}        length*    Number of characters to draw
///    @arg {real}        height*    Height in pixels to draw within
///    @arg {real}        align*    0=left, 1=center
/// @arg {real}        [mode]    Mode is used internally
/*
*
*   Draws text at position x,y. Limits text drawn to [length] characters
*   If text height exceeds [height], truncates.
*
*   This script uses web hex code colors instead of
*   c_color constants to keep me sane.
*
*    [FFFFFF] Hex sets color
*   [f=fontID] changes the font
*   [r:index] draws index value
* 
*   REQUIRES:
*   variable typewriterDelay, if | appears in the string
*
*   RETURNS:
*   An array containing three values:
*   0: The number of the last character printed
*   1: Whether the text was truncated due to height (1) or not (0);
*    2: Whether the box is "done."
*
*    RETURNS [if mode is 1]:
*    An array containing the width of each line of text
*
*    Created by Tsa05 on the GMC forums, possibly with help from GMCers
*    Terms: Use at will. Do not sell as a textbox script.
*    Feel free to sell your own assets that happen to use this for the text part.
*
*/
var typewriterAlarm = 1;  // The alarm number used in your object to advance typewriter text
var debug=0;
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var x1 = argument[0];
var y1 = argument[1];
var text = argument[2];
var boxW = argument[3];
var x2 = x1+boxW;
var font = -1;

var maxLength = 0;

if(!is_undefined(text)){
    if(is_string(text)){
        maxLength = string_length(text);
    }else if(is_array(text)){
        maxLength = array_length_1d(text)-1;
    }
}

var maxHeight = -1;
if(argument_count>5){
    maxHeight = argument[5];
}
var length = maxLength;
var retval = 0;
retval[0]=0; retval[1]=0; retval[2]=0;

if(argument_count>4){
    if(argument[4]>=0){
        length = argument[4];
    }
}
var align = 1;
if(argument_count>6){
    align = argument[6];
}
var mode = 0;
if(argument_count>7){
    mode = argument[7];
}
var lines = 0;
var currentLine = 0;
var line_height = string_height("M|");
var cc = draw_get_colour();
var cx = x1;
var cy = y1;
var skip = false;
var c;

var newLine = chr(10);
var    i = 1;
var removal = 0;
brackets = false; // Instance variable; calling instance can indicate tag

/*
*    Since this function must draw 1 character at a time,
*    string_char_at becomes a significant source of lag.
*    An array is created to accomodate the problem.
*    This method is 14% faster than using string_char_at in testing.
*/
var textArray = 0;
if(is_array(mode)){
    textArray = mode;
    mode = 1;
}else{
    if(is_array(text)){
        // If text was provided as a character array...
        textArray = text;
    }else{
        for(var z=1;z<=maxLength;z+=1){
            textArray[z]=string_char_at(text,z); //Slower
            //textArray[z]=chr(string_byte_at(text,z)); //Faster, less character support
        }
    }
}
if(align==1 && mode==0){
    // If centering, run this script once for spacing
    // textArray is passed because why not save computation time
    lines = draw_wrapped_colored_text(x1, y1, text, boxW, -1, maxHeight, align, textArray); // Mode 1
}

while (i<=length){
  
    if(debug) show_debug_message("mode:"+string(mode)+" i:"+string(i));
  
    //c = string_char_at(text,i);
    c = textArray[i];
  
    var nextChar = ""; var prevChar = "";
    if(i<array_length_1d(textArray)-1){
        //var nextChar = string_char_at(text,i+1);
        nextChar = textArray[i+1]
    }
    if(i>1){
        //var prevChar = string_char_at(text,i-1);
        prevChar = textArray[i-1];
    }
  
    if(debug) show_debug_message("i:"+string(i)+" prevChar:"+prevChar+" nextChar:"+nextChar);
  
    // ANALYSE CURRENT CHARACTER //
  
    if (c == "\\"){
        if(debug) show_debug_message("escape character or pause");
        if ( nextChar == "[" ||
            nextChar == "|" ){
          
            i += 1;
            //if (i > string_length(text)){
            if (i > maxLength){
                break;
            }
        }
    }else if (c == newLine){
        // IF LINE-BREAK CHARACTER
        if(debug) show_debug_message("newline character");
        if (prevChar != "\\"){
            if(debug) show_debug_message("newline committed");
            if(mode){
                lines[currentLine] = cx-x1;
            }
            currentLine+=1;
            cy += line_height;
            cx = x1;
            //if (i > string_length(text)) break;
            if (i > maxLength) break;
          
        }else{
            if(debug) show_debug_message("newline was escaped");
            c = newLine; // In case you escaped newline?
        }
    }else if (c == "["){
        if(debug) show_debug_message("tag begins");
        // IF THE START OF A TAG
        if (prevChar == "\\"){
            if(debug) show_debug_message("tag escaped");
            c = c;
        }else{
            brackets = true;
            code = "";
            i += 1;
            //c = string_char_at(text,i);
            if(i<array_length_1d(textArray)){
                c = textArray[i];
            }else{ c=""; }
          
            if(debug) show_debug_message("Within tag, i:"+string(i)+" c:"+string(c));
          
            while (c != "]"){
                code += c;
                i += 1;
              
                if(debug) show_debug_message("code:"+code+" i:"+string(i));
              
                //if (i > string_length(text)) break;
                if (i > maxLength) break;
              
                //c = string_char_at(text,i);
                if(i<array_length_1d(textArray)){
                    c = textArray[i];
                }else{ c=""; }
                if(debug) show_debug_message("next character of code:"+c);
            }
          
            if (c == "]"){
                brackets = false;
                c="";
                // Analyze code
                if(string_pos("f=",code)==1||string_pos("font=",code)==1){
                    var fontName = string_delete(code,1,2);
                    if(asset_get_index(fontName)!=-1){
                        if(asset_get_type(fontName)==asset_font){
                            font = asset_get_index(fontName);
                        }
                    }
                }else if(string_pos("r:",code)==1){
                    var num = string_delete(code,1,2);
                    var txt = "[Register "+string(num)+"]";
                    var tag = "[r"+string(num)+"]";
                    c=txt;

                    length+=string_length(txt)-string_length(tag);
                }else{
                    if(mode==0){ //Don't swap colors when measuring
                        // Convert...
                        code = string_upper(code);
                        var dec = 0;
                       var h = "0123456789ABCDEF";
                       for (var p=1; p<=string_length(code); p+=1) {
                           dec = dec << 4 | (string_pos(string_char_at(code, p), h) - 1);
                       }
                        var cc = (dec & 16711680) >> 16 | (dec & 65280) | (dec & 255) << 16;
                        ///////////////////////////
                      
                    }
                }
                // Increase length to display, since we're not
                // Showing these characters.
                length+=string_length(code)+2; //Plus 2 for brackets
                code = "";
            }else{
                // if no end bracket was found, don't draw this
                c="";
            }
        }
    }else
    // IF PAUSE CHARACTER
    if (c == "|"){
        //if (i==1 || string_char_at(text,i-1) != "\\"){
        if (i==1 || textArray[i-1] != "\\"){
            i += 1;
            c="";
            if(i==length && alarm[typewriterAlarm]==-1){
                // Add a delay...
                if(variable_instance_exists(id,"typewriterDelay")){
                    alarm[typewriterAlarm]=2*typewriterDelay;
                }
            }
        }
    }
 
    // IF BEGINNING OF NEW WORD //
    while(i>array_length_1d(textArray)){
        if(debug) show_debug_message("trimming i:"+string(i));
        i-=1;
    }
    prevChar = "";
    if(i>1 ){
        //var prevChar = string_char_at(text,i-1);
        prevChar = textArray[i-1];
    }
  
    /* The string_char_at version... */
    /*
    if( (i == 1) or
    ( (string_char_at(text,i-1) == " ") || (string_char_at(text,i-1) == "-") ) or
    ( (string_char_at(text,i-1) == newLine) && (string_char_at(text,i - 2) != "\\") ))
    */
  
    if( (i == 1) or
    ( (prevChar == " ") || (prevChar == "-") ) or
    ( (prevChar == newLine) && ( array_length_1d(textArray)>3 && textArray[i - 2] != "\\") ) )
    {      
        // CHECK WIDTH //
        if(debug) show_debug_message("determine if linebreak is needed");
        var w  = 0;
        var ii = i;
        var n  = 0;
        var ci  = c;
      
        while ((ci != " ") && (ci != "-") && ci != newLine){
            if (ci == "[") n = 1;
            //if ((ci == "\\") && (string_char_at(text,ii + 1) == newLine))
            if ((ci == "\\") && (textArray[ii + 1] == newLine))
                {
                ii += 1;
                //if (ii > string_length(text)) break;
                if(debug) show_debug_message("ii:"+string(ii));
                if (ii > maxLength){
                    if(debug) show_debug_message("breaking");
                    break;
                }
                continue;
              
                }
          
            if ((!n) && (ci != "\\")) w += string_width(ci);
          
            if (cx + w > x2){
                if(debug) show_debug_message("new line found");
                if(i!=1){
                    if(mode){
                        lines[currentLine]=cx-x1;
                    }
                    currentLine+=1;
                    cy+=line_height;
                    cx=x1;
                }
                w=0;
            }
          
            ii += 1;
            //if (ii > string_length(text)) break;
            if (ii > maxLength) {
                if(debug) show_debug_message("breaking here:"+string(ii));
                break;
            }
          
            //ci  = string_char_at(text,ii);
            ci = textArray[ii];
            if(debug) show_debug_message("ci:"+string(ci));
            if (ci == "]") n = 0;
        }
    }
  
    var cW = string_width(c);
    if(cx+cW>x2){  
        // Check the width again, in case word wrap found no words
        // This means your "word" is bigger than the whole box.
        if(mode){
            lines[currentLine]=cx-x1;
        }
        currentLine+=1;
        cy+=line_height;
        cx=x1;
    }
  
    if(maxHeight && cy+line_height>y1+maxHeight){
      
        retval[0] = i-removal-1;
        retval[1] = 1;
        if(mode) retval = lines;
        return retval;
        exit;
    }else{
        draw_set_color(cc);
        if(font_exists(font)) draw_set_font(font);
        var newX = cx;
        if(mode==0){
            if(align==1){
                if(is_array(lines)&&array_length_1d(lines)>=currentLine){
                    var lineW = lines[currentLine];
                    var d = cx-x1;
                    var centerX = x1+boxW/2;
                    var newX = centerX-lineW/2+d;
                }
            }
            draw_text(newX,cy,c);
        }
        draw_set_halign(fa_left);
        cx += cW;
      
        i += 1;
      
        //if (i > string_length(text)){
        if (i > maxLength){
            retval[0] = maxLength;
            retval[1] = 0;
            retval[2] = 1;
            if(mode){
                lines[currentLine]=cx-x1;
                retval = lines;
            }
            return retval;
            break;
        }
    }   
}

retval[0] = i;
if(mode) retval=lines;
return retval;
