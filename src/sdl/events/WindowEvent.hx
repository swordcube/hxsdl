package sdl.events;

@:keep
@:native("SDL_WindowEvent")
@:include("vendor/include/Headers.h")
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