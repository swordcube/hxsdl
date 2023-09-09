package sdl;

@:keep
@:include("vendor/include/SDL.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")
extern class SDL {
    @:native("SDL_Init")
	public extern static function init(flags:UInt32):Int;
}

enum abstract InitFlags(UInt32) to UInt32 from UInt32 {
	var VIDEO = 0x00000020;
	var AUDIO = 0x00000010;
	var JOYSTICK = 0x00000200;
	var HAPTIC = 0x00001000;
	var CONTROLLER = 0x00002000;
	var EVENTS = 0x00004000;
	var SENSOR = 0x00004000;
	var NOPARACHUTE = 0x00100000;
	var EVERYTHING = 0x00000020 | 0x00000010 | 0x00000200 | 0x00001000 | 0x00002000 | 0x00004000 | 0x00100000;
}