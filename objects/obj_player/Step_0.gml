var _d = keyboard_check(ord("D"));
var _a = keyboard_check(ord("A"));
var _w = keyboard_check(ord("W"));
var _s = keyboard_check(ord("S"));

_x = _d - _a;
_y = _s - _w;

x += _x * spd;
y += _y * spd;