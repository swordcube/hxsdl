package sdl.keyboard;

@:keep
enum abstract KeyMod(Int) from Int to Int {
    var KMOD_NONE = 0x0000;
    var KMOD_LSHIFT = 0x0001;
    var KMOD_RSHIFT = 0x0002;
    var KMOD_LCTRL = 0x0040;
    var KMOD_RCTRL = 0x0080;
    var KMOD_LALT = 0x0100;
    var KMOD_RALT = 0x0200;
    var KMOD_LGUI = 0x0400;
    var KMOD_RGUI = 0x0800;
    var KMOD_NUM = 0x1000;
    var KMOD_CAPS = 0x2000;
    var KMOD_MODE = 0x4000;
    var KMOD_SCROLL = 0x8000;

    var KMOD_CTRL = KMOD_LCTRL | KMOD_RCTRL;
    var KMOD_SHIFT = KMOD_LSHIFT | KMOD_RSHIFT;
    var KMOD_ALT = KMOD_LALT | KMOD_RALT;
    var KMOD_GUI = KMOD_LGUI | KMOD_RGUI;

    var KMOD_RESERVED = KMOD_SCROLL;
}