package sdl.keyboard;

@:keep
enum abstract KeyState(UInt8) from UInt8 to UInt8 {
    var RELEASED = 0;
    var PRESSED = 1;
}