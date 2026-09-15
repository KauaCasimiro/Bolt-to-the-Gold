function scr_controlls(){
    var _d = keyboard_check(ord("D"));
    var _a = keyboard_check(ord("A"));
    var _w = keyboard_check(ord("W"));
    var _s = keyboard_check(ord("S"));
       
    var _o = keyboard_check_pressed(ord("O"));
    var _p = keyboard_check_pressed(ord("P"));
       
    input_x = _d - _a;
    input_y = _s - _w;
    
    inpunt_melee = _o
    input_ranged = _p
}