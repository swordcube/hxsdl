package sdl.keyboard;

@:keep
enum abstract KeyMod(Int) from Int to Int {
    var NONE = 0x0000;
    var LSHIFT = 0x0001;
    var RSHIFT = 0x0002;
    var LCTRL = 0x0040;
    var RCTRL = 0x0080;
    var LALT = 0x0100;
    var RALT = 0x0200;
    var LGUI = 0x0400;
    var RGUI = 0x0800;
    var NUM = 0x1000;
    var CAPS = 0x2000;
    var MODE = 0x4000;
    var SCROLL = 0x8000;

    var CTRL = LCTRL | RCTRL;
    var SHIFT = LSHIFT | RSHIFT;
    var ALT = LALT | RALT;
    var GUI = LGUI | RGUI;

    var RESERVED = SCROLL;
}