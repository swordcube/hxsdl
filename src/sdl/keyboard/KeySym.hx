package sdl.keyboard;

import sdl.keyboard.ScanCode;
import sdl.keyboard.KeyCode;

@:keep
@:native("SDL_Keysym")
@:structAccess
extern class KeySym {
    public var scancode:ScanCode; // physical keycode
    public var sym:KeyCode; // virtual keycode
    public var mod:KeyMod; // key mods
    public var unused:UInt32; // okay
}