package sdl;

import cpp.ConstCharStar;
import cpp.RawConstPointer;

import haxe.io.BytesData;

@:keep
@:include("vendor/include/sdl2/SDL.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

// WARNING: This will not have every feature SDL has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxsdl/issues

extern class SDL {
	@:native("SDL_Init")
	public extern static function init(flags:UInt32):Int;

	@:native("SDL_SetHint")
	public extern static function setHint(name:ConstCharStar, value:ConstCharStar):UInt8;

	@:native("SDL_Delay")
	public extern static function delay(ms:UInt32):Void;
	
	@:native("SDL_GetTicks")
	public extern static function getTicks():UInt32;

	@:native("SDL_GetTicks64")
	public extern static function getTicks64():UInt64;

	@:native("SDL_Quit")
	public extern static function quit():Void;

	@:native("SDL_GetError")
	public extern static function getError():ConstCharStar;

	@:native("SDL_GetPerformanceCounter")
	public extern static function getPerformanceCounter():UInt64;

	@:native("SDL_GetPerformanceFrequency")
	public extern static function getPerformanceFrequency():UInt64;

	@:native("SDL_CreateWindow")
	public extern static function createWindow(title:ConstCharStar, x:Int, y:Int, width:Int, height:Int, flags:UInt32 = 0):Window;

	@:native("SDL_DestroyWindow")
	public extern static function destroyWindow(window:Window):Void;

	@:native("SDL_GetWindowPosition")
	public static inline function getWindowPosition(window:Window):Point {
		var winX:Int = 0;
		var winY:Int = 0;
		untyped __cpp__("SDL_GetWindowPosition({0}, {1}, {2})", window, Pointer.addressOf(winX), Pointer.addressOf(winY));
		return Point.create(winX, winY);
	}

	@:native("SDL_SetWindowPosition")
	public extern static function setWindowPosition(window:Window, x:Int, y:Int):Void;

	@:native("SDL_GetWindowSize")
	public static inline function getWindowSize(window:Window):Point {
		var sizeX:Int = 0;
		var sizeY:Int = 0;
		untyped __cpp__("SDL_GetWindowSize({0}, {1}, {2})", window, Pointer.addressOf(sizeX), Pointer.addressOf(sizeY));
		return Point.create(sizeX, sizeY);
	}

	@:native("SDL_SetWindowSize")
	public extern static function setWindowSize(window:Window, x:Int, y:Int):Void;

	@:native("SDL_GetWindowTitle")
	public extern static function getWindowTitle(window:Window):ConstCharStar;

	@:native("SDL_SetWindowTitle")
	public extern static function setWindowTitle(window:Window, title:ConstCharStar):Void;

	@:native("SDL_CreateRenderer")
	public extern static function createRenderer(window:Window, index:Int, flags:UInt32):Renderer;

	@:native("SDL_GetRenderDrawColor")
	public static inline function getRenderDrawColor(renderer:Renderer) {
		var r:UInt8 = 0;
		var g:UInt8 = 0;
		var b:UInt8 = 0;
		var a:UInt8 = 0;
		untyped __cpp__("SDL_GetRenderDrawColor({0}, {1}, {2}, {3}, {4})", renderer, Pointer.addressOf(r), Pointer.addressOf(g), Pointer.addressOf(b), Pointer.addressOf(a));
		return {r: r, g: g, b: b, a: a};
	}

	@:native("SDL_SetRenderDrawColor")
	public extern static function setRenderDrawColor(renderer:Renderer, r:UInt8, g:UInt8, b:UInt8, a:UInt8):Int;
	
	@:native("SDL_RenderFillRect")
	public static inline function renderFillRect(renderer:Renderer, rect:Rectangle):Int {
		return untyped __cpp__("SDL_RenderFillRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

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
		return untyped __cpp__("SDL_RenderCopyEx({0}, {1}, {2}, {3}, {4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), untyped __cpp__("(SDL_RendererFlip){0}", flip));
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

	@:native("SDL_GetTextureScaleMode")
	public static inline function getTextureScaleMode(texture:Texture):Int {
		var scaleMode:TextureScaleMode = -1;
		untyped __cpp__("SDL_ScaleMode output;
		SDL_GetTextureScaleMode({0}, &output);
		{1} = output", texture, scaleMode);
		return scaleMode;
	}

	@:native("SDL_SetTextureScaleMode")
	public static inline function setTextureScaleMode(texture:Texture, scaleMode:TextureScaleMode):Int {
		return untyped __cpp__("SDL_SetTextureScaleMode({0}, (SDL_ScaleMode){1})", texture, scaleMode);
	}

	@:native("SDL_CreateTexture")
	public extern static function createTexture(renderer:Renderer, format:UInt32, access:Int, width:Int, height:Int):Texture;

	@:native("SDL_DestroyTexture")
	public extern static function destroyTexture(texture:Texture):Void;

	@:native("SDL_CreateTextureFromSurface")
	public extern static function createTextureFromSurface(renderer:Renderer, surface:Surface):Texture;

	@:native("SDL_FreeSurface")
	public extern static function freeSurface(surface:Surface):Int;

	@:native("SDL_LockSurface")
	public extern static function lockSurface(surface:Surface):Int;

	@:native("SDL_UnlockSurface")
	public extern static function unlockSurface(surface:Surface):Int;

	@:native("SDL_RWFromConstMem")
	public static inline function rwFromConstMem(mem:BytesData, size:Int):RWops {
		return untyped __cpp__("SDL_RWFromConstMem((void*)&{0}[0], {1})", mem, size);
	}

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
enum abstract WindowEventID(UInt8) from UInt8 to UInt8 {
	var NONE = 0;       /**< Never used */
    var SHOWN;          /**< Window has been shown */
    var HIDDEN;         /**< Window has been hidden */
    var EXPOSED;        /**< Window has been exposed and should be
                                         redrawn */
    var MOVED;          /**< Window has been moved to data1, data2
                                     */
    var RESIZED;        /**< Window has been resized to data1xdata2 */
    var SIZE_CHANGED;   /**< The window size has changed, either as
                                         a result of an API call or through the
                                         system or user changing the window size. */
    var MINIMIZED;      /**< Window has been minimized */
    var MAXIMIZED;      /**< Window has been maximized */
    var RESTORED;       /**< Window has been restored to normal size
                                         and position */
    var ENTER;          /**< Window has gained mouse focus */
    var LEAVE;          /**< Window has lost mouse focus */
    var FOCUS_GAINED;   /**< Window has gained keyboard focus */
    var FOCUS_LOST;     /**< Window has lost keyboard focus */
    var CLOSE;          /**< The window manager requests that the window be closed */
    var TAKE_FOCUS;     /**< Window is being offered a focus (should SetWindowInputFocus() on itself or a subwindow, or ignore) */
    var HIT_TEST;       /**< Window had a hit test that wasn't SDL_HITTEST_NORMAL. */
    var ICCPROF_CHANGED; /**< The ICC profile of the window's display has changed. */
    var DISPLAY_CHANGED; /**< Window has been moved to display data1. */
}

@:keep
enum abstract PixelType(UInt32) from UInt32 to UInt32 {
	var UNKNOWN = 0;
	var INDEX1;
	var INDEX4;
	var INDEX8;
	var PACKED8;
	var PACKED16;
	var PACKED32;
	var ARRAYU8;
	var ARRAYU16;
	var ARRAYU32;
	var ARRAYF16;
	var ARRAYF32;
}

@:keep
enum abstract BitmapOrder(UInt32) from UInt32 to UInt32 {
	var ORDER_NONE = 0;
	var ORDER_4321;
	var ORDER_1234;
}

@:keep
enum abstract PackedOrder(UInt32) from UInt32 to UInt32 {
	var NONE = 0;
	var XRGB;
	var RGBX;
	var ARGB;
	var RGBA;
	var XBGR;
	var BGRX;
	var ABGR;
	var BGRA;
}

@:keep
enum abstract ArrayOrder(UInt32) from UInt32 to UInt32 {
	var NONE = 0;
	var RGB;
	var RGBA;
	var ARGB;
	var BGR;
	var BGRA;
	var ABGR;
}

@:keep
enum abstract PackedLayout(UInt32) from UInt32 to UInt32 {
	var LAYOUT_NONE = 0;
	var LAYOUT_332;
	var LAYOUT_4444;
	var LAYOUT_1555;
	var LAYOUT_5551;
	var LAYOUT_565;
	var LAYOUT_8888;
	var LAYOUT_2101010;
	var LAYOUT_1010102;
}

// i almost went insane making this fucking enum
@:keep
enum abstract PixelFormatEnum(UInt32) from UInt32 to UInt32 {
	private static inline function definePixelFormat(type:Int, order:Int, layout:Int, bits:Int, bytes:Int) {
		return (1 << 28) | ((type) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | ((bytes) << 0);
	}

	var UNKNOWN = 0;
	var INDEX1LSB = definePixelFormat(PixelType.INDEX1, BitmapOrder.ORDER_4321, 0, 1, 0);
	var INDEX1MSB = definePixelFormat(PixelType.INDEX1, BitmapOrder.ORDER_1234, 0, 1, 0);
	var INDEX4LSB = definePixelFormat(PixelType.INDEX4, BitmapOrder.ORDER_4321, 0, 4, 0);
	var INDEX4MSB = definePixelFormat(PixelType.INDEX4, BitmapOrder.ORDER_1234, 0, 4, 0);
	var INDEX8 = definePixelFormat(PixelType.INDEX8, 0, 0, 8, 1);
	var RGB332 = definePixelFormat(PixelType.PACKED8, PackedOrder.XRGB, PackedLayout.LAYOUT_332, 8, 1);
	var XRGB4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.XRGB, PackedLayout.LAYOUT_4444, 12, 2);
	var RGB444 = XRGB4444;
	var XBGR4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.XBGR, PackedLayout.LAYOUT_4444, 12, 2);
	var BGR444 = XBGR4444;
	var XRGB1555 = definePixelFormat(PixelType.PACKED16, PackedOrder.XRGB, PackedLayout.LAYOUT_1555, 15, 2);
	var RGB555 = XRGB1555;
	var XBGR1555 = definePixelFormat(PixelType.PACKED16, PackedOrder.XBGR, PackedLayout.LAYOUT_1555, 15, 2);
	var BGR555 = XBGR1555;
	var ARGB4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.ARGB, PackedLayout.LAYOUT_4444, 16, 2);
	var RGBA4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.RGBA, PackedLayout.LAYOUT_4444, 16, 2);
	var ABGR4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.ABGR, PackedLayout.LAYOUT_4444, 16, 2);
	var BGRA4444 = definePixelFormat(PixelType.PACKED16, PackedOrder.BGRA, PackedLayout.LAYOUT_4444, 16, 2);
	var ARGB1555 = definePixelFormat(PixelType.PACKED16, PackedOrder.ARGB, PackedLayout.LAYOUT_1555, 16, 2);
	var RGBA5551 = definePixelFormat(PixelType.PACKED16, PackedOrder.RGBA, PackedLayout.LAYOUT_5551, 16, 2);
	var ABGR1555 = definePixelFormat(PixelType.PACKED16, PackedOrder.ABGR, PackedLayout.LAYOUT_1555, 16, 2);
	var BGRA5551 = definePixelFormat(PixelType.PACKED16, PackedOrder.BGRA, PackedLayout.LAYOUT_5551, 16, 2);
	var RGB565 = definePixelFormat(PixelType.PACKED16, PackedOrder.XRGB, PackedLayout.LAYOUT_565, 16, 2);
	var BGR565 = definePixelFormat(PixelType.PACKED16, PackedOrder.XBGR, PackedLayout.LAYOUT_565, 16, 2);
	var RGB24 = definePixelFormat(PixelType.ARRAYU8, ArrayOrder.RGB, 0, 24, 3);
	var BGR24 = definePixelFormat(PixelType.ARRAYU8, ArrayOrder.BGR, 0, 24, 3);
	var XRGB8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.XRGB, PackedLayout.LAYOUT_8888, 24, 4);
	var RGB888 = XRGB8888;
	var RGBX8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.RGBX, PackedLayout.LAYOUT_8888, 24, 4);
	var XBGR8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.XBGR, PackedLayout.LAYOUT_8888, 24, 4);
	var BGR888 = XBGR8888;
	var BGRX8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.BGRX, PackedLayout.LAYOUT_8888, 24, 4);
	var ARGB8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.ARGB, PackedLayout.LAYOUT_8888, 32, 4);
	var RGBA8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.RGBA, PackedLayout.LAYOUT_8888, 32, 4);
	var ABGR8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.ABGR, PackedLayout.LAYOUT_8888, 32, 4);
	var BGRA8888 = definePixelFormat(PixelType.PACKED32, PackedOrder.BGRA, PackedLayout.LAYOUT_8888, 32, 4);
	var ARGB2101010 = definePixelFormat(PixelType.PACKED32, PackedOrder.ARGB, PackedLayout.LAYOUT_2101010, 32, 4);
}

@:keep
enum abstract TextureAccess(Int) from Int to Int {
	/** Changes rarely, not lockable **/
	var STATIC = 0;
	/** Changes frequently, lockable **/ 
    var STREAMING;
	/** Texture can be used as a render target **/
    var RENDER_TARGET;
}

@:keep
enum abstract TextureScaleMode(Int) from Int to Int {
	/** Nearest pixel sampling **/
	var NEAREST = 0;
	/** Linear filtering **/ 
    var LINEAR;
	/** Anisotropic filtering **/
    var ANISOTROPIC;
}

@:keep
@:native("SDL_Point")
@:include("vendor/include/sdl2/SDL.h")
@:structAccess
extern class Point {
	public var x:Int;
	public var y:Int;

	public static inline function create(x:Int, y:Int):Point {
		return cast untyped __cpp__("SDL_Point{ (int){0}, (int){1} }", x, y);
	}
}

@:keep
@:native("SDL_Rect")
@:include("vendor/include/sdl2/SDL.h")
@:structAccess
extern class Rectangle {
	public var x:Int;
	public var y:Int;
	public var w:Int;
	public var h:Int;

	public static inline function create(x:Int, y:Int, w:Int, h:Int):Rectangle {
		return cast untyped __cpp__("SDL_Rect{ (int){0}, (int){1}, (int){2}, (int){3} }", x, y, w, h);
	}
}

@:keep
@:native("SDL_Color")
@:include("vendor/include/sdl2/SDL.h")
@:structAccess
extern class Color {
	public var r:UInt8;
	public var g:UInt8;
	public var b:UInt8;
	public var a:UInt8;

	public static inline function create(r:UInt8, g:UInt8, b:UInt8, a:UInt8):Color {
		return cast untyped __cpp__("SDL_Color{ (Uint8){0}, (Uint8){1}, (Uint8){2}, (Uint8){3} }", r, g, b, a);
	}
}

typedef Double = cpp.Float64;
