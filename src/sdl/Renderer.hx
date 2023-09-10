package sdl;

@:keep
@:native("SDL_Renderer")
@:include("vendor/include/sdl2/SDL.h")
extern class SDL_Renderer {}

typedef Renderer = Pointer<SDL_Renderer>;

@:keep
enum abstract RenderFlags(UInt32) to UInt32 from UInt32 {
	var SOFTWARE = 0x00000001;
	var ACCELERATED = 0x00000002;
	var VSYNC = 0x00000004;
	var TARGETTEXTURE = 0x00000008;
}

@:keep
enum abstract RendererFlip(UInt32) to UInt32 from UInt32 {
	var NONE = 0x00000000;
    var HORIZONTAL = 0x00000001;
    var VERTICAL = 0x00000002;
}