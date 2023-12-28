package sdl;

import cpp.UInt8;
import cpp.UInt16;
import cpp.UInt32;
import cpp.UInt64;
import cpp.RawConstPointer;
import cpp.ConstPointer;
import cpp.ConstCharStar;
import cpp.CastCharStar;
import cpp.Rest;
import cpp.Pointer;
import cpp.VarArg;

import sdl.Types;

@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

extern class SDL {
	// SDL.h //
	@:native("SDL_Init")
	static function init(flags:InitFlags):Int;

	@:native("SDL_InitSubSystem")
	static function initSubSystem(flags:InitFlags):Int;

	@:native("SDL_QuitSubSystem")
	static function quitSubSystem(flags:InitFlags):Void;

	@:native("SDL_WasInit")
	static function wasInit(flags:InitFlags):InitFlags;

	@:native("SDL_Quit")
	static function quit():Void;

	// SDL_hints.h //
	@:native("SDL_SetHintWithPriority")
	static function setHintWithPriority(name:ConstCharStar, value:ConstCharStar, priority:HintPriority):Boolean;

	@:native("SDL_SetHint")
	static function setHint(name:ConstCharStar, value:ConstCharStar):Boolean;
	
	@:native("SDL_ResetHint")
	static function resetHint(name:ConstCharStar):Boolean;
	
	@:native("SDL_ResetHints")
	static function resetHints():Boolean;

	@:native("SDL_GetHint")
	static function getHint(name:ConstCharStar):ConstCharStar;

	@:native("SDL_GetHintBoolean")
	static function getHintBoolean(name:ConstCharStar, defaultValue:Boolean):Boolean;

	@:native("SDL_AddHintCallback")
	static function addHintCallback(name:ConstCharStar, callback:HintCallback, userdata:Pointer<Void>):Void;

	@:native("SDL_DelHintCallback")
	static function deleteHintCallback(name:ConstCharStar, callback:HintCallback, userdata:Pointer<Void>):Void;

	@:native("SDL_ClearHints")
	static function clearHints():Void;

	// SDL_error.h //
	@:native("SDL_SetError")
	static function setError(fmt:ConstCharStar, args:Rest<Any>):Int;

	@:native("SDL_GetError")
	static function getError():ConstCharStar;

	@:native("SDL_GetErrorMsg")
	static function getErrorMessage(errStr:CastCharStar, maxLen:Int):CastCharStar;

	@:native("SDL_ClearError")
	static function clearError():Void;

	// SDL_log.h
	@:native("SDL_LogAllSetPriority")
	static function logAllSetPriority(priority:LogPriority):Void;

	@:native("SDL_LogSetPriority")
	static function logSetPriority(category:LogCategory, priority:LogPriority):Void;

	@:native("SDL_LogGetPriority")
	static function logGetPriority(category:LogCategory):LogPriority;

	@:native("SDL_LogResetPriorities")
	static function logResetPriorities():Void;

	@:native("SDL_Log")
	static function log(fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogVerbose")
	static function logVerbose(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogDebug")
	static function logDebug(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogInfo")
	static function logInfo(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogWarn")
	static function logWarn(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogError")
	static function logError(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogCritical")
	static function logCritical(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogMessage")
	static function logMessage(category:LogCategory, priority:LogPriority, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogMessageV")
	static function logMessageV(category:LogCategory, priority:LogPriority, fmt:ConstCharStar, va:VarArg):Void;

	@:native("SDL_LogGetOutputFunction")
	static inline function logGetOutputFunction(userdata:Any):LogOutputFunction {
		untyped __cpp__("SDL_LogOutputFunction _func; SDL_LogGetOutputFunction(&_func, &{0})", userdata);
		return untyped __cpp__("_func");
	}

	@:native("SDL_LogSetOutputFunction")
	static inline function logSetOutputFunction(callback:LogOutputFunction, userdata:Any):Void {
		untyped __cpp__("SDL_LogSetOutputFunction({0}, (void*){1})", callback, userdata);
	}

	// SDL_version.h //
	@:native("SDL_MAJOR_VERSION")
	static final majorVersion:Int;

	@:native("SDL_MINOR_VERSION")
	static final minorVersion:Int;

	@:native("SDL_PATCHLEVEL")
	static final patchLevel:Int;

	@:native("SDL_GetVersion")
	static function getVersion():Version;
	
	@:native("SDL_VERSION_ATLEAST")
	static inline function versionAtLeast(major:Int, minor:Int, patch:Int):Bool {
		return untyped __cpp__("SDL_VERSION_ATLEAST({0}, {1}, {2})", major, minor, patch);
	}

	@:native("SDL_GetRevision")
	static function getRevision():ConstCharStar;

	@:native("SDL_GetRevisionNumber")
	@:deprecated("Use SDL.getRevision() instead; if SDL was carefully built, it will return a git hash.")
	static function getRevisionNumber():Int;

	// SDL_video.h //
	@:native("SDL_GetNumVideoDrivers")
	static function getNumVideoDrivers():Int;

	@:native("SDL_GetVideoDriver")
	static function getVideoDriver(index:Int):ConstCharStar;

	@:native("SDL_VideoInit")
	static function videoInit(driver_name:ConstCharStar):Int;

	@:native("SDL_VideoQuit")
	static function videoQuit():Void;

	@:native("SDL_GetCurrentVideoDriver")
	static function getCurrentVideoDriver():ConstCharStar;

	@:native("SDL_GetNumVideoDisplays")
	static function getNumVideoDisplays():Int;

	@:native("SDL_GetDisplayName")
	static function getDisplayName(displayIndex:Int):ConstCharStar;
	
	@:native("SDL_GetDisplayBounds")
	static inline function getDisplayBounds(displayIndex:Int):Rectangle {
		var result:Int;
		untyped __cpp__("SDL_Rect _rect; {1} = SDL_GetDisplayBounds({0}, &_rect)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_rect") : null;
	}

	@:native("SDL_GetDisplayUsableBounds")
	static inline function getDisplayUsableBounds(displayIndex:Int):Rectangle {
		var result:Int;
		untyped __cpp__("SDL_Rect _rect; {1} = SDL_GetDisplayUsableBounds({0}, &_rect)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_rect") : null;
	}

	@:native("SDL_GetDisplayDPI")
	static function getDisplayDPI(displayIndex:Int, ddpi:Pointer<Float>, hdpi:Pointer<Float>, vdpi:Pointer<Float>):Int;

	@:native("SDL_GetDisplayOrientation")
	static function getDisplayOrientation(displayIndex:Int):DisplayOrientation;

	@:native("SDL_GetNumDisplayModes")
	static function getNumDisplayModes(displayIndex:Int):Int;

	@:native("SDL_GetDisplayMode")
	static inline function getDisplayMode(displayIndex:Int, modeIndex:Int):DisplayMode {
		var result:Int;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetDisplayMode({1}, {2}, &_mode)", result, displayIndex, modeIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetDesktopDisplayMode")
	static inline function getDesktopDisplayMode(displayIndex:Int):DisplayMode {
		var result:Int;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetDesktopDisplayMode({1}, &_mode)", result, displayIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetCurrentDisplayMode")
	static inline function getCurrentDisplayMode(displayIndex:Int):DisplayMode {
		var result:Int;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetCurrentDisplayMode({1}, &_mode)", result, displayIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetClosestDisplayMode")
	static function getClosestDisplayMode(displayIndex:Int, mode:ConstPointer<DisplayMode>, closest:Pointer<DisplayMode>):Pointer<DisplayMode>;

	@:native("SDL_GetPointDisplayIndex")
	static inline function getPointDisplayIndex(point:Point):Int {
		return untyped __cpp__("SDL_GetPointDisplayIndex(&{0})", point);
	}

	@:native("SDL_GetRectDisplayIndex")
	static inline function getRectDisplayIndex(rect:Rectangle):Int {
		return untyped __cpp__("SDL_GetRectDisplayIndex(&{0})", rect);
	}

	@:native("SDL_GetWindowDisplayIndex")
	static function getWindowDisplayIndex(window:Window):Int;

	@:native("SDL_SetWindowDisplayMode")
	static inline function setWindowDisplayMode(window:Window, mode:DisplayMode):Int {
		return untyped __cpp__("SDL_SetWindowDisplayMode({0}, &{1})", window, mode);
	}

	@:native("SDL_GetWindowDisplayMode")
	static inline function getWindowDisplayMode(window:Window):DisplayMode {
		var result:Int;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetWindowDisplayMode({1}, &_mode)", result, window);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetWindowICCProfile")
	static inline function getWindowICCProfile(window:Window, size:UInt64):Any {
		return untyped __cpp__("SDL_GetWindowICCProfile({0}, &{1})", window, size);
	}

	@:native("SDL_GetWindowPixelFormat")
	static function getWindowPixelFormat(window:Window):PixelFormat;

	@:native("SDL_CreateWindow")
	static function createWindow(title:ConstCharStar, x:Int, y:Int, w:Int, h:Int, flags:WindowInitFlags):Window;

	@:native("SDL_CreateWindowFrom")
	static inline function createWindowFrom(data:Any):Window {
		return untyped __cpp__("SDL_CreateWindowFrom((void*){0})", data);
	}

	@:native("SDL_GetWindowID")
	static function getWindowID(window:Window):UInt32;

	@:native("SDL_GetWindowFromID")
	static function getWindowFromID(id:UInt32):Window;

	@:native("SDL_GetWindowFlags")
	static function getWindowFlags(window:Window):WindowInitFlags;

	@:native("SDL_SetWindowTitle")
	static function setWindowTitle(window:Window, title:ConstCharStar):Void;

	@:native("SDL_GetWindowTitle")
	static function getWindowTitle(window:Window):ConstCharStar;

	@:native("SDL_SetWindowIcon")
	static function setWindowIcon(window:Window, icon:Surface):Void;

	@:native("SDL_SetWindowData")
	static inline function setWindowData(window:Window, name:ConstCharStar, userdata:Any):Any {
		return untyped __cpp__("SDL_SetWindowData({0}, {1}, {2})", window, name, userdata);
	}

	@:native("SDL_GetWindowData")
	static inline function getWindowData(window:Window, name:ConstCharStar):Any {
		return untyped __cpp__("SDL_GetWindowData({0}, {1})", window, name);
	}

	@:native("SDL_GetWindowPosition")
	static inline function getWindowPosition(window:Window):Point {
		var winX:Int = 0;
		var winY:Int = 0;
		untyped __cpp__("SDL_GetWindowPosition({0}, {1}, {2})", window, Pointer.addressOf(winX), Pointer.addressOf(winY));
		return Point.create(winX, winY);
	}

	@:native("SDL_SetWindowPosition")
	static function setWindowPosition(window:Window, x:Int, y:Int):Void;

	@:native("SDL_GetWindowSize")
	public static inline function getWindowSize(window:Window):Point {
		var sizeX:Int = 0;
		var sizeY:Int = 0;
		untyped __cpp__("SDL_GetWindowSize({0}, {1}, {2})", window, Pointer.addressOf(sizeX), Pointer.addressOf(sizeY));
		return Point.create(sizeX, sizeY);
	}

	@:native("SDL_SetWindowSize")
	static function setWindowSize(window:Window, x:Int, y:Int):Void;

	@:native("SDL_GetWindowBordersSize")
	static inline function getWindowBordersSize(window:Window):Rectangle {
		var top:Int;
		var left:Int;
		var bottom:Int;
		var right:Int;
		untyped __cpp__("SDL_GetWindowBordersSize({0}, {1}, {2}, {3})", Pointer.addressOf(top), Pointer.addressOf(left), Pointer.addressOf(bottom), Pointer.addressOf(right));
		return Rectangle.create(top, left, bottom, right);
	}

	@:native("SDL_GetWindowSizeInPixels")
	static inline function getWindowSizeInPixels(window:Window):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_GetWindowSizeInPixels({0}, {1}, {2})", window, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}

	@:native("SDL_SetWindowMinimumSize")
	static function setWindowMinimumSize(window:Window, minWidth:Int, minHeight:Int):Void;

	@:native("SDL_GetWindowMinimumSize")
	static inline function getWindowMinimumSize(window:Window):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_GetWindowMinimumSize({0}, {1}, {2})", window, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}

	@:native("SDL_SetWindowMaximumSize")
	static function setWindowMaximumSize(window:Window, maxWidth:Int, maxHeight:Int):Void;

	@:native("SDL_GetWindowMaximumSize")
	static inline function getWindowMaximumSize(window:Window):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_GetWindowMaximumSize({0}, {1}, {2})", window, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}

	@:native("SDL_SetWindowBordered")
	static function setWindowBordered(window:Window, bordered:Boolean):Void;

	@:native("SDL_SetWindowResizable")
	static function setWindowResizable(window:Window, resizable:Boolean):Void;

	@:native("SDL_SetWindowAlwaysOnTop")
	static function setWindowAlwaysOnTop(window:Window, onTop:Boolean):Void;

	@:native("SDL_ShowWindow")
	static function showWindow(window:Window):Void;

	@:native("SDL_HideWindow")
	static function hideWindow(window:Window):Void;

	@:native("SDL_RaiseWindow")
	static function raiseWindow(window:Window):Void;

	@:native("SDL_MaximizeWindow")
	static function maximizeWindow(window:Window):Void;

	@:native("SDL_MinimizeWindow")
	static function minimizeWindow(window:Window):Void;

	@:native("SDL_RestoreWindow")
	static function restoreWindow(window:Window):Void;

	@:native("SDL_SetWindowFullscreen")
	static function setWindowFullscreen(window:Window, flags:WindowInitFlags):Int;

	@:native("SDL_HasWindowSurface")
	static function hasWindowSurface(window:Window):Boolean;

	@:native("SDL_GetWindowSurface")
	static function getWindowSurface(window:Window):Surface;

	@:native("SDL_UpdateWindowSurface")
	static function updateWindowSurface(window:Window):Int;

	@:native("SDL_UpdateWindowSurfaceRects")
	static function updateWindowSurfaceRects(window:Window, rects:RawConstPointer<Rectangle>, numrects:Int):Int;

	@:native("SDL_DestroyWindowSurface")
	static function destroyWindowSurface(window:Window):Int;

	@:native("SDL_SetWindowGrab")
	static function setWindowGrab(window:Window, grabbed:Boolean):Void;

	@:native("SDL_SetWindowKeyboardGrab")
	static function setWindowKeyboardGrab(window:Window, grabbed:Boolean):Void;

	@:native("SDL_SetWindowMouseGrab")
	static function setWindowMouseGrab(window:Window, grabbed:Boolean):Void;

	@:native("SDL_GetWindowGrab")
	static function getWindowGrab(window:Window):Boolean;

	@:native("SDL_GetWindowKeyboardGrab")
	static function getWindowKeyboardGrab(window:Window):Boolean;

	@:native("SDL_GetWindowMouseGrab")
	static function getWindowMouseGrab(window:Window):Boolean;

	@:native("SDL_GetGrabbedWindow")
	static function getGrabbedWindow():Window;

	@:native("SDL_SetWindowMouseRect")
	static inline function setWindowMouseRect(window:Window, rect:Rectangle):Int {
		return untyped __cpp__("SDL_SetWindowMouseRect({0}, {1})", window, rect);
	}

	@:native("SDL_GetWindowMouseRect")
	static inline function getWindowMouseRect(window:Window):Rectangle {
		return untyped __cpp__("SDL_GetWindowMouseRect({0})", window);
	}

	@:native("SDL_SetWindowBrightness")
	static function setWindowBrightness(window:Window, brightness:Float):Int;

	@:native("SDL_GetWindowBrightness")
	static function getWindowBrightness(window:Window):Float;

	@:native("SDL_SetWindowOpacity")
	static function setWindowOpacity(window:Window, opacity:Float):Int;

	@:native("SDL_GetWindowOpacity")
	static inline function getWindowOpacity(window:Window):Float {
		untyped __cpp__("float _opac; SDL_GetWindowOpacity({0}, &_opac)", window);
		return untyped __cpp__("_opac");
	}

	@:native("SDL_SetWindowModalFor")
	static function setWindowModalFor(modalWindow:Window, parentWindow:Window):Int;

	@:native("SDL_SetWindowInputFocus")
	static function setWindowInputFocus(window:Window):Int;

	@:native("SDL_SetWindowGammaRamp")
	static function setWindowGammaRamp(window:Window, red:RawConstPointer<UInt16>, green:RawConstPointer<UInt16>, blue:RawConstPointer<UInt16>):Int;

	@:native("SDL_GetWindowGammaRamp")
	static function getWindowGammaRamp(window:Window, red:Pointer<UInt16>, green:Pointer<UInt16>, blue:Pointer<UInt16>):Int;

	@:native("SDL_SetWindowHitTest")
	static inline function setWindowHitTest(window:Window, callback:HitTest, callbackData:Any):Int {
		return untyped __cpp__("SDL_SetWindowHitTest({0}, {1}, {2})", window, callback, callbackData);
	}

	@:native("SDL_FlashWindow")
	static function flashWindow(window:Window, operation:FlashOperation):Int;

	@:native("SDL_DestroyWindow")
	static function destroyWindow(window:Window):Void;

	@:native("SDL_IsScreenSaverEnabled")
	static function isScreenSaverEnabled():Boolean;

	@:native("SDL_EnableScreenSaver")
	static function enableScreenSaver():Void;

	@:native("SDL_DisableScreenSaver")
	static function disableScreenSaver():Void;

	@:native("SDL_GL_LoadLibrary")
	static function glLoadLibrary(path:ConstCharStar):Int;

	@:native("SDL_GL_GetProcAddress")
	static inline function glGetProcAddress(proc:ConstCharStar):Any {
		return untyped __cpp__("SDL_GL_GetProcAddress({0})", proc);
	}

	@:native("SDL_GL_UnloadLibrary")
	static function glUnloadLibrary():Void;

	@:native("SDL_GL_ExtensionSupported")
	static function glExtensionSupported(extension:ConstCharStar):Boolean;

	@:native("SDL_GL_ResetAttributes")
	static function glResetAttributes():Void;

	@:native("SDL_GL_SetAttribute")
	static function glSetAttribute(attr:GlAttribute, value:Int):Int;

	static inline function glGetAttribute(attr:GlAttribute):Int {
		var result:Int;
		untyped __cpp__("int _val; {0} = SDL_GL_GetAttribute({1}, &_val)", result, attr);
		return (result == 0) ? untyped __cpp__("_val") : null;
	}

	@:native("SDL_GL_GetAttribute")
	@:noCompletion static function _glGetAttribute(attr:GlAttribute, value:Pointer<Int>):Int;

	@:native("SDL_GL_CreateContext")
	static function glCreateContext(window:Window):GlContext;

	@:native("SDL_GL_MakeCurrent")
	static function glMakeCurrent(window:Window, context:GlContext):Int;

	@:native("SDL_GL_GetCurrentWindow")
	static function glGetCurrentWindow():Window;

	@:native("SDL_GL_GetCurrentContext")
	static function glGetCurrentContext():GlContext;

	@:native("SDL_GL_GetDrawableSize")
	static inline function glGetDrawableSize(window:Window):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_GL_GetDrawableSize({0}, {1}, {2})", window, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}

	@:native("SDL_GL_SetSwapInterval")
	static function glSetSwapInterval(interval:Int):Int;

	@:native("SDL_GL_GetSwapInterval")
	static function glGetSwapInterval():Int;

	@:native("SDL_GL_SwapWindow")
	static function glSwapWindow(window:Window):Void;

	@:native("SDL_GL_DeleteContext")
	static function glDeleteContext(context:GlContext):Void;

	// SDL_render.h //
	@:native("SDL_GetNumRenderDrivers")
	static function getNumRenderDrivers():Int;
	
	@:native("SDL_GetRenderDriverInfo")
	static inline function getRenderDriverInfo(displayIndex:Int):RendererInfo {
		var result:Int;
		untyped __cpp__("SDL_RendererInfo _info; {1} = SDL_GetRenderDriverInfo({0}, &_info)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_info") : null;
	}

	@:native("SDL_CreateRenderer")
	static function createRenderer(window:Window, index:Int, flags:RendererFlags):Renderer;

	@:native("SDL_CreateSoftwareRenderer")
	static function createSoftwareRenderer(surface:Surface):Renderer;

	@:native("SDL_GetRenderer")
	static function getRenderer(window:Window):Renderer;

	@:native("SDL_RenderGetWindow")
	static function renderGetWindow(renderer:Window):Window;

	@:native("SDL_GetRendererInfo")
	static inline function getRendererInfo(renderer:Renderer):RendererInfo {
		var result:Int;
		untyped __cpp__("SDL_RendererInfo _info; {1} = SDL_GetRendererInfo({0}, &_info)", renderer, result);
		return (result == 0) ? untyped __cpp__("_info") : null;
	}

	@:native("SDL_GetRendererOutputSize")
	static inline function getRendererOutputSize(renderer:Renderer):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_GetRendererOutputSize({0}, {1}, {2})", renderer, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}
	
	@:native("SDL_CreateTexture")
	static function createTexture(renderer:Renderer, format:UInt32, access:Int, width:Int, height:Int):Texture;

	@:native("SDL_CreateTextureFromSurface")
	static function createTextureFromSurface(renderer:Renderer, surface:Surface):Texture;

	@:native("SDL_QueryTexture")
	static function queryTexture(texture:Texture, format:Pointer<PixelFormat>, access:Pointer<Int>, width:Pointer<Int>, height:Pointer<Int>):Int;

	@:native("SDL_SetTextureColorMod")
	static function setTextureColorMod(texture:Texture, r:UInt8, g:UInt8, b:UInt8):Int;

	/**
	 * Alpha in returned color will always be 255
	 */
	@:native("SDL_GetTextureColorMod")
	static inline function getTextureColorMod(texture:Texture):Color {
		var r:UInt8;
		var g:UInt8;
		var b:UInt8;
		untyped __cpp__("SDL_GetTextureColorMod({0}, {1}, {2}, {3})", texture, Pointer.addressOf(r), Pointer.addressOf(g), Pointer.addressOf(b));
		return Color.create(r, g, b, 255);
	}

	@:native("SDL_SetTextureAlphaMod")
	static function setTextureAlphaMod(texture:Texture, alpha:UInt8):Int;

	@:native("SDL_GetTextureAlphaMod")
	static inline function getTextureAlphaMod(texture:Texture):UInt8 {
		var a:UInt8;
		untyped __cpp__("SDL_GetTextureAlphaMod({0}, {1})", texture, Pointer.addressOf(a));
		return a;
	}

	@:native("SDL_SetTextureBlendMode")
	static function setTextureBlendMode(texture:Texture, blend:BlendMode):Int;

	@:native("SDL_GetTextureBlendMode")
	static inline function getTextureBlendMode(texture:Texture):BlendMode {
		var blend:BlendMode = INVALID;
		untyped __cpp__("SDL_GetTextureBlendMode({0}, {1})", texture, Pointer.addressOf(blend));
		return blend;
	}

	@:native("SDL_GetTextureScaleMode")
	public static inline function getTextureScaleMode(texture:Texture):Int {
		var scaleMode:TextureScaleMode;
		untyped __cpp__("SDL_ScaleMode output; SDL_GetTextureScaleMode({0}, &output); {1} = output", texture, scaleMode);
		return scaleMode;
	}

	@:native("SDL_SetTextureScaleMode")
	public static inline function setTextureScaleMode(texture:Texture, scaleMode:TextureScaleMode):Int {
		return untyped __cpp__("SDL_SetTextureScaleMode({0}, (SDL_ScaleMode){1})", texture, scaleMode);
	}

	// haxe helper functions //
	@:native("SDL_Event")
	static inline function makeEventPtr():Event {
		untyped __cpp__('SDL_Event __sdl_ev__');
		return untyped __cpp__('__sdl_ev__');
	}
}