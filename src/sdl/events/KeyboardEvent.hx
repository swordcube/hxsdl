package sdl.events;

import sdl.keyboard.*;

@:keep
@:native("SDL_KeyboardEvent")
@:include("vendor/include/includeWorkaround.h")
@:structAccess
extern class KeyboardEvent {
    public var timestamp:UInt32;
    public var windowID:UInt32;
    public var state:KeyState;
    public var repeat:SDL.Boolean;
    public var padding2:UInt8;
    public var padding3:UInt8;
    public var keysym:KeySym;
}