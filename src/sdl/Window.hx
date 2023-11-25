package sdl;

@:keep
@:native("SDL_Window")
@:include("vendor/include/includeWorkaround.h")
extern class SDL_Window {}

typedef Window = Pointer<SDL_Window>;

@:keep
enum abstract WindowInitFlags(UInt32) from UInt32 to UInt32 {
	var FULLSCREEN = 0x00000001;
	var OPENGL = 0x00000002;
	var SHOWN = 0x00000004;
	var HIDDEN = 0x00000008;
	var BORDERLESS = 0x00000010;
	var RESIZABLE = 0x00000020;
	var MINIMIZED = 0x00000040;
	var MAXIMIZED = 0x00000080;
	var MOUSE_GRABBED = 0x00000100;
	var INPUT_FOCUS = 0x00000200;
	var MOUSE_FOCUS = 0x00000400;
	var FULLSCREEN_DESKTOP = (FULLSCREEN | 0x00001000);
	var FOREIGN = 0x00000800;
	var ALLOW_HIGHDPI = 0x00002000;
	var MOUSE_CAPTURE = 0x00004000;
	var ALWAYS_ON_TOP = 0x00008000;
	var SKIP_TASKBAR = 0x00010000;
	var UTILITY = 0x00020000;
	var TOOLTIP = 0x00040000;
	var POPUP_MENU = 0x00080000;
	var KEYBOARD_GRABBED = 0x00100000;
	var VULKAN = 0x10000000;
	var METAL = 0x20000000;
	var INPUT_GRABBED = MOUSE_GRABBED;
}

@:keep
enum abstract WindowPos(UInt32) from UInt32 to UInt32 {
	var CENTERED = 0x2FFF0000;
	var UNDEFINED = 0x1FFF0000;
}