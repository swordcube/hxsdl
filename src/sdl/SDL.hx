package sdl;

import cpp.RawConstPointer;

@:keep
@:include("vendor/include/sdl2/SDL.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")
extern class SDL {
    @:native("SDL_Init")
	public extern static function init(flags:UInt32):Int;

	@:native("SDL_Quit")
	public extern static function quit():Void;

	@:native("SDL_CreateWindow")
	public extern static function createWindow(title:String, x:Int, y:Int, width:Int, height:Int, flags:UInt32 = 0):Window;

	@:native("SDL_DestroyWindow")
	public extern static function destroyWindow(window:Window):Void;

	@:native("SDL_CreateRenderer")
	public extern static function createRenderer(window:Window, index:Int, flags:UInt32):Renderer;

	@:native("SDL_SetRenderDrawColor")
	public extern static function setRenderDrawColor(renderer:Renderer, r:UInt8, g:UInt8, b:UInt8, a:UInt8):Int;

	@:native("SDL_RenderClear")
	public extern static function renderClear(renderer:Renderer):Int;

	@:native("SDL_RenderPresent")
	public extern static function renderPresent(renderer:Renderer):Int;

	@:native("SDL_RenderCopy")
	public static inline function renderCopy(renderer:Renderer, texture:Texture, src:Rectangle, dst:Rectangle):Int {
		return untyped __cpp__("SDL_RenderCopy({0}, {1}, {2}, {3})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst));
	}

	@:native("SDL_RenderCopyEx")
	public static inline function renderCopyEx(renderer:Renderer, texture:Texture, src:Rectangle, dst:Rectangle, angle:Double, center:Point, flip:sdl.Renderer.RendererFlip = NONE):Int {
		return untyped __cpp__("SDL_RenderCopy({0}, {1}, {2}, {3}, {4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), flip);
	}

	@:native("SDL_RenderSetVSync")
	public extern static function renderSetVSync(renderer:Renderer, vsync:Boolean):Int;

	@:native("SDL_GetRenderTarget")
	public extern static function getRenderTarget(renderer:Renderer):Texture;

	@:native("SDL_SetRenderTarget")
	public extern static function setRenderTarget(renderer:Renderer, texture:Texture):Int;
	
	@:native("SDL_SetRenderTarget")
	public static inline function resetRenderTarget(renderer:Renderer):Int
		return untyped __cpp__("SDL_SetRenderTarget({0}, NULL)", renderer);

	@:native("SDL_DestroyRenderer")
	public extern static function destroyRenderer(renderer:Renderer):Int;

	@:native("SDL_QueryTexture")
	public extern static function queryTexture(texture:Texture, format:Pointer<UInt32>, access:Pointer<Int>, width:Pointer<Int>, height:Pointer<Int>):Int;

	// utilizes queryTexture to get texture size :3
	public static inline function getTextureSize(texture:Texture):Point {
		var w:Int = 0;
		var h:Int = 0;
		queryTexture(texture, null, null, Pointer.addressOf(w), Pointer.addressOf(h));
		return Point.create(w, h);
	}

	@:native("SDL_CreateTexture")
	public extern static function createTexture(renderer:Renderer):Texture;

	@:native("SDL_CreateTextureFromSurface")
	public extern static function createTextureFromSurface(renderer:Renderer, surface:Surface):Texture;

	@:native("SDL_FreeSurface")
	public extern static function freeSurface(surface:Surface):Int;

	@:native("SDL_PollEvent")
	public extern static function pollEvent(event:Event):Int;
	
	@:native("SDL_Event")
	public static inline function createEventPtr():Event {
		var event:Event = null;
		untyped __cpp__('SDL_Event __sdl_ev__; {0} = &__sdl_ev__', event);
		return event;
	}
}

@:keep
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

@:keep
enum abstract Boolean(UInt8) from UInt8 to UInt8 {
	var FALSE = 0;
	var TRUE = 1;
}

@:keep
@:native("SDL_Point")
@:structAccess
@:structInit
extern class Point {
	public var x:Int;
	public var y:Int;

	public static inline function create(x:Int, y:Int):Point {
		return untyped __cpp__("SDL_Point{ (int){0}, (int){1} }", x, y);
	}
}

@:keep
@:native("SDL_Rect")
@:structAccess
@:structInit
extern class Rectangle {
	public var x:Int;
	public var y:Int;
	public var w:Int;
	public var h:Int;

	public static inline function create(x:Int, y:Int, w:Int, h:Int):Rectangle {
		return untyped __cpp__("SDL_Rect{ (int){0}, (int){1}, (int){2}, (int){3} }", x, y, w, h);
	}
}

/*enum abstract PixelFormatEnum(UInt32) from UInt32 to UInt32 {
	private function definePixelFormat(type:Int, order:Int, layout:Int, bits:Int, bytes:Int) {
		return ((1 << 28) | ((type) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | ((bytes) << 0));
	}

	var SDL_PIXELFORMAT_UNKNOWN;
    var SDL_PIXELFORMAT_INDEX1LSB =
        definePixelFormat(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0,
                               1, 0);
    var SDL_PIXELFORMAT_INDEX1MSB =
        definePixelFormat(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0,
                               1, 0);
							   var SDL_PIXELFORMAT_INDEX4LSB =
        definePixelFormat(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0,
                               4, 0);
							   var SDL_PIXELFORMAT_INDEX4MSB =
        definePixelFormat(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0,
                               4, 0);
							   var SDL_PIXELFORMAT_INDEX8 =
        definePixelFormat(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1);
		var SDL_PIXELFORMAT_RGB332 =
        definePixelFormat(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB,
                               SDL_PACKEDLAYOUT_332, 8, 1);
							   var SDL_PIXELFORMAT_XRGB4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB,
                               SDL_PACKEDLAYOUT_4444, 12, 2);
							   var SDL_PIXELFORMAT_RGB444 = SDL_PIXELFORMAT_XRGB4444;
							   var SDL_PIXELFORMAT_XBGR4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR,
                               SDL_PACKEDLAYOUT_4444, 12, 2);
							   var SDL_PIXELFORMAT_BGR444 = SDL_PIXELFORMAT_XBGR4444;
							   var SDL_PIXELFORMAT_XRGB1555 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB,
                               SDL_PACKEDLAYOUT_1555, 15, 2);
							   var SDL_PIXELFORMAT_RGB555 = SDL_PIXELFORMAT_XRGB1555;
							   var SDL_PIXELFORMAT_XBGR1555 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR,
                               SDL_PACKEDLAYOUT_1555, 15, 2);
							   var SDL_PIXELFORMAT_BGR555 = SDL_PIXELFORMAT_XBGR1555;
							   var SDL_PIXELFORMAT_ARGB4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB,
                               SDL_PACKEDLAYOUT_4444, 16, 2);
							   var SDL_PIXELFORMAT_RGBA4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA,
                               SDL_PACKEDLAYOUT_4444, 16, 2),
    SDL_PIXELFORMAT_ABGR4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR,
                               SDL_PACKEDLAYOUT_4444, 16, 2),
    SDL_PIXELFORMAT_BGRA4444 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA,
                               SDL_PACKEDLAYOUT_4444, 16, 2),
    SDL_PIXELFORMAT_ARGB1555 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB,
                               SDL_PACKEDLAYOUT_1555, 16, 2),
    SDL_PIXELFORMAT_RGBA5551 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA,
                               SDL_PACKEDLAYOUT_5551, 16, 2),
    SDL_PIXELFORMAT_ABGR1555 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR,
                               SDL_PACKEDLAYOUT_1555, 16, 2),
    SDL_PIXELFORMAT_BGRA5551 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA,
                               SDL_PACKEDLAYOUT_5551, 16, 2),
    SDL_PIXELFORMAT_RGB565 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB,
                               SDL_PACKEDLAYOUT_565, 16, 2),
    SDL_PIXELFORMAT_BGR565 =
        definePixelFormat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR,
                               SDL_PACKEDLAYOUT_565, 16, 2),
    SDL_PIXELFORMAT_RGB24 =
        definePixelFormat(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0,
                               24, 3),
    SDL_PIXELFORMAT_BGR24 =
        definePixelFormat(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0,
                               24, 3),
    SDL_PIXELFORMAT_XRGB8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB,
                               SDL_PACKEDLAYOUT_8888, 24, 4),
    SDL_PIXELFORMAT_RGB888 = SDL_PIXELFORMAT_XRGB8888,
    SDL_PIXELFORMAT_RGBX8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX,
                               SDL_PACKEDLAYOUT_8888, 24, 4),
    SDL_PIXELFORMAT_XBGR8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR,
                               SDL_PACKEDLAYOUT_8888, 24, 4),
    SDL_PIXELFORMAT_BGR888 = SDL_PIXELFORMAT_XBGR8888,
    SDL_PIXELFORMAT_BGRX8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX,
                               SDL_PACKEDLAYOUT_8888, 24, 4),
    SDL_PIXELFORMAT_ARGB8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB,
                               SDL_PACKEDLAYOUT_8888, 32, 4),
    SDL_PIXELFORMAT_RGBA8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA,
                               SDL_PACKEDLAYOUT_8888, 32, 4),
    SDL_PIXELFORMAT_ABGR8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR,
                               SDL_PACKEDLAYOUT_8888, 32, 4),
    SDL_PIXELFORMAT_BGRA8888 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA,
                               SDL_PACKEDLAYOUT_8888, 32, 4),
    SDL_PIXELFORMAT_ARGB2101010 =
        definePixelFormat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB,
                               SDL_PACKEDLAYOUT_2101010, 32, 4),
}*/

typedef Double = cpp.Float64;