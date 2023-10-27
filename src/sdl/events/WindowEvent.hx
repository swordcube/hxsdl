package sdl.events;

@:keep
@:unreflective
@:native("SDL_WindowEvent")
@:include("vendor/include/sdl2/SDL.h")
@:structAccess
extern class WindowEvent {
    var timestamp:UInt32;
    var windowID:UInt32;
    var event:SDL.WindowEventID;
    var padding1:UInt8;
    var padding2:UInt8;
    var padding3:UInt8;
    var data1:Int;
    var data2:Int;
}