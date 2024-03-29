package sdl;

import cpp.Int16;
import cpp.NativeArray;
import cpp.Helpers;
import cpp.RawPointer;
import cpp.UInt8;
import cpp.UInt16;
import cpp.UInt32;
import cpp.UInt64;
import cpp.RawConstPointer;
import cpp.ConstPointer;
import cpp.ConstCharStar;
import cpp.CastCharStar;
import cpp.Rest;
import cpp.VarArg;

import sdl.Types;

#if SDL_PREFIX
import sdl.Types.SDLInitFlags;
#else
import sdl.Types.InitFlags;
#end

@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

/**
 * The class containing a majority of SDL's functions!
 * 
 * Keep in mind that the functions have been modifyied to be easier used in Haxe.
 * 
 * Refer to the SDL2 Category API documentation as none
 * of these functions have documentation in this Haxe class!
 * 
 * @see https://wiki.libsdl.org/SDL2/CategoryAPI
 */
extern class SDL {
	// SDL.h //
	@:native("SDL_Init")
	#if SDL_PREFIX
	static function init(flags:SDLInitFlags):Int;
	#else
	static function init(flags:InitFlags):Int;
	#end

	@:native("SDL_InitSubSystem")
	#if SDL_PREFIX
	static function initSubSystem(flags:SDLInitFlags):Int;
	#else
	static function initSubSystem(flags:InitFlags):Int;
	#end

	@:native("SDL_QuitSubSystem")
	#if SDL_PREFIX
	static function quitSubSystem(flags:SDLInitFlags):Void;
	#else
	static function quitSubSystem(flags:InitFlags):Void;
	#end

	@:native("SDL_WasInit")
	#if SDL_PREFIX
	static function wasInit(flags:SDLInitFlags):SDLInitFlags;
	#else
	static function wasInit(flags:InitFlags):InitFlags;
	#end

	@:native("SDL_Quit")
	static function quit():Void;

	// SDL_hints.h //
	@:native("SDL_SetHintWithPriority")
	static inline function setHintWithPriority(name:ConstCharStar, value:ConstCharStar, priority:#if SDL_PREFIX SDLHintPriority #else HintPriority #end):Bool {
		return untyped __cpp__("SDL_SetHintWithPriority({0}, {1}, (SDL_HintPriority){2})", name, value, priority) == Boolean.TRUE;
	}

	@:native("SDL_SetHint")
	static inline function setHint(name:ConstCharStar, value:ConstCharStar):Bool {
		return untyped __cpp__("SDL_SetHint({0}, {1})") == Boolean.TRUE;
	}
	
	@:native("SDL_ResetHint")
	static inline function resetHint(name:ConstCharStar):Bool {
		return untyped __cpp__("SDL_ResetHint({0})", name) == Boolean.TRUE;
	}
	
	@:native("SDL_ResetHints")
	static inline function resetHints():Bool {
		return untyped __cpp__("SDL_ResetHints()") == Boolean.TRUE;
	}

	@:native("SDL_GetHint")
	static function getHint(name:ConstCharStar):ConstCharStar;

	@:native("SDL_GetHintBoolean")
	static inline function getHintBoolean(name:ConstCharStar, defaultValue:Bool):Bool {
		return untyped __cpp__("SDL_GetHintBoolean({0}, (SDL_bool){1})") == Boolean.TRUE;	
	}

	@:native("SDL_AddHintCallback")
	static function addHintCallback(name:ConstCharStar, callback:#if SDL_PREFIX SDLHintCallback #else HintCallback #end, userdata:RawPointer<Void>):Void;

	@:native("SDL_DelHintCallback")
	static function deleteHintCallback(name:ConstCharStar, callback:#if SDL_PREFIX SDLHintCallback #else HintCallback #end, userdata:RawPointer<Void>):Void;

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
	static function logAllSetPriority(priority:#if SDL_PREFIX SDLLogPriority #else LogPriority #end):Void;

	@:native("SDL_LogSetPriority")
	static function logSetPriority(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, priority:#if SDL_PREFIX SDLLogPriority #else LogPriority #end):Void;

	@:native("SDL_LogGetPriority")
	static function logGetPriority(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end):#if SDL_PREFIX SDLLogPriority #else LogPriority #end;

	@:native("SDL_LogResetPriorities")
	static function logResetPriorities():Void;

	@:native("SDL_Log")
	static function log(fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogVerbose")
	static function logVerbose(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogDebug")
	static function logDebug(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogInfo")
	static function logInfo(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogWarn")
	static function logWarn(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogError")
	static function logError(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogCritical")
	static function logCritical(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogMessage")
	static function logMessage(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, priority:#if SDL_PREFIX SDLLogPriority #else LogPriority #end, fmt:ConstCharStar, args:Rest<Any>):Void;

	@:native("SDL_LogMessageV")
	static function logMessageV(category:#if SDL_PREFIX SDLLogCategory #else LogCategory #end, priority:#if SDL_PREFIX SDLLogPriority #else LogPriority #end, fmt:ConstCharStar, va:VarArg):Void;

	@:native("SDL_LogGetOutputFunction")
	static inline function logGetOutputFunction(userdata:Any):#if SDL_PREFIX SDLLogOutputFunction #else LogOutputFunction #end {
		untyped __cpp__("SDL_LogOutputFunction _func; SDL_LogGetOutputFunction(&_func, &{0})", userdata);
		return untyped __cpp__("_func");
	}

	@:native("SDL_LogSetOutputFunction")
	static inline function logSetOutputFunction(callback:#if SDL_PREFIX SDLLogOutputFunction #else LogOutputFunction #end, userdata:Any):Void {
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
	static function getVersion():#if SDL_PREFIX SDLVersion #else Version #end;
	
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
	static inline function getDisplayBounds(displayIndex:Int):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var result:Int = 0;
		untyped __cpp__("SDL_Rect _rect; {1} = SDL_GetDisplayBounds({0}, &_rect)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_rect") : null;
	}

	@:native("SDL_GetDisplayUsableBounds")
	static inline function getDisplayUsableBounds(displayIndex:Int):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var result:Int = 0;
		untyped __cpp__("SDL_Rect _rect; {1} = SDL_GetDisplayUsableBounds({0}, &_rect)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_rect") : null;
	}

	@:native("SDL_GetDisplayDPI")
	static function getDisplayDPI(displayIndex:Int, ddpi:RawPointer<Float>, hdpi:RawPointer<Float>, vdpi:RawPointer<Float>):Int;

	@:native("SDL_GetDisplayOrientation")
	static function getDisplayOrientation(displayIndex:Int):#if SDL_PREFIX SDLDisplayOrientation #else DisplayOrientation #end;

	@:native("SDL_GetNumDisplayModes")
	static function getNumDisplayModes(displayIndex:Int):Int;

	@:native("SDL_GetDisplayMode")
	static inline function getDisplayMode(displayIndex:Int, modeIndex:Int):#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end {
		var result:Int = 0;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetDisplayMode({1}, {2}, &_mode)", result, displayIndex, modeIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetDesktopDisplayMode")
	static inline function getDesktopDisplayMode(displayIndex:Int):#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end {
		var result:Int = 0;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetDesktopDisplayMode({1}, &_mode)", result, displayIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetCurrentDisplayMode")
	static inline function getCurrentDisplayMode(displayIndex:Int):#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end {
		var result:Int = 0;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetCurrentDisplayMode({1}, &_mode)", result, displayIndex);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetClosestDisplayMode")
	static function getClosestDisplayMode(displayIndex:Int, mode:ConstPointer<#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end>, closest:RawPointer<#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end>):RawPointer<#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end>;

	@:native("SDL_GetPointDisplayIndex")
	static inline function getPointDisplayIndex(point:#if SDL_PREFIX SDLPoint #else Point #end):Int {
		return untyped __cpp__("SDL_GetPointDisplayIndex(&{0})", point);
	}

	@:native("SDL_GetRectDisplayIndex")
	static inline function getRectDisplayIndex(rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_GetRectDisplayIndex(&{0})", rect);
	}

	@:native("SDL_GetWindowDisplayIndex")
	static function getWindowDisplayIndex(window:#if SDL_PREFIX SDLWindow #else Window #end):Int;

	@:native("SDL_SetWindowDisplayMode")
	static inline function setWindowDisplayMode(window:#if SDL_PREFIX SDLWindow #else Window #end, mode:#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end):Int {
		return untyped __cpp__("SDL_SetWindowDisplayMode({0}, &{1})", window, mode);
	}

	@:native("SDL_GetWindowDisplayMode")
	static inline function getWindowDisplayMode(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLDisplayMode #else DisplayMode #end {
		var result:Int = 0;
		untyped __cpp__("SDL_DisplayMode _mode; {0} = SDL_GetWindowDisplayMode({1}, &_mode)", result, window);
		return (result == 0) ? untyped __cpp__("_mode") : null;
	}

	@:native("SDL_GetWindowICCProfile")
	static inline function getWindowICCProfile(window:#if SDL_PREFIX SDLWindow #else Window #end, size:UInt64):Any {
		return untyped __cpp__("SDL_GetWindowICCProfile({0}, &{1})", window, size);
	}

	@:native("SDL_GetWindowPixelFormat")
	static function getWindowPixelFormat(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end;

	@:native("SDL_CreateWindow")
	static function createWindow(title:ConstCharStar, x:Int, y:Int, w:Int, h:Int, flags:#if SDL_PREFIX SDLWindowInitFlags #else WindowInitFlags #end):#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_CreateWindowFrom")
	static inline function createWindowFrom(data:Any):#if SDL_PREFIX SDLWindow #else Window #end {
		return untyped __cpp__("SDL_CreateWindowFrom((void*){0})", data);
	}

	@:native("SDL_GetWindowID")
	static function getWindowID(window:#if SDL_PREFIX SDLWindow #else Window #end):UInt32;

	@:native("SDL_GetWindowFromID")
	static function getWindowFromID(id:UInt32):#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_GetWindowFlags")
	static function getWindowFlags(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLWindowInitFlags #else WindowInitFlags #end;

	@:native("SDL_SetWindowTitle")
	static function setWindowTitle(window:#if SDL_PREFIX SDLWindow #else Window #end, title:ConstCharStar):Void;

	@:native("SDL_GetWindowTitle")
	static function getWindowTitle(window:#if SDL_PREFIX SDLWindow #else Window #end):ConstCharStar;

	@:native("SDL_SetWindowIcon")
	static function setWindowIcon(window:#if SDL_PREFIX SDLWindow #else Window #end, icon:#if SDL_PREFIX SDLSurface #else Surface #end):Void;

	@:native("SDL_SetWindowData")
	static inline function setWindowData(window:#if SDL_PREFIX SDLWindow #else Window #end, name:ConstCharStar, userdata:Any):Any {
		return untyped __cpp__("SDL_SetWindowData({0}, {1}, {2})", window, name, userdata);
	}

	@:native("SDL_GetWindowData")
	static inline function getWindowData(window:#if SDL_PREFIX SDLWindow #else Window #end, name:ConstCharStar):Any {
		return untyped __cpp__("SDL_GetWindowData({0}, {1})", window, name);
	}

	@:native("SDL_GetWindowPosition")
	static inline function getWindowPosition(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var winX:Int = 0;
		var winY:Int = 0;
		untyped __cpp__("SDL_GetWindowPosition({0}, {1}, {2})", window, RawPointer.addressOf(winX), RawPointer.addressOf(winY));
		#if SDL_PREFIX
		return SDLPoint.create(winX, winY);
		#else
		return Point.create(winX, winY);
		#end
	}

	@:native("SDL_SetWindowPosition")
	static function setWindowPosition(window:#if SDL_PREFIX SDLWindow #else Window #end, x:Int, y:Int):Void;

	@:native("SDL_GetWindowSize")
	static inline function getWindowSize(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var sizeX:Int = 0;
		var sizeY:Int = 0;
		untyped __cpp__("SDL_GetWindowSize({0}, {1}, {2})", window, RawPointer.addressOf(sizeX), RawPointer.addressOf(sizeY));
		#if SDL_PREFIX
		return SDLPoint.create(sizeX, sizeY);
		#else
		return Point.create(sizeX, sizeY);
		#end
	}

	@:native("SDL_SetWindowSize")
	static function setWindowSize(window:#if SDL_PREFIX SDLWindow #else Window #end, x:Int, y:Int):Void;

	@:native("SDL_GetWindowBordersSize")
	static inline function getWindowBordersSize(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var top:Int = 0;
		var left:Int = 0;
		var bottom:Int = 0;
		var right:Int = 0;
		untyped __cpp__("SDL_GetWindowBordersSize({0}, {1}, {2}, {3})", RawPointer.addressOf(top), RawPointer.addressOf(left), RawPointer.addressOf(bottom), RawPointer.addressOf(right));
		#if SDL_PREFIX
		return SDLRectangle.create(top, left, bottom, right);
		#else
		return Rectangle.create(top, left, bottom, right);
		#end
	}

	@:native("SDL_GetWindowSizeInPixels")
	static inline function getWindowSizeInPixels(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_GetWindowSizeInPixels({0}, {1}, {2})", window, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}

	@:native("SDL_SetWindowMinimumSize")
	static function setWindowMinimumSize(window:#if SDL_PREFIX SDLWindow #else Window #end, minWidth:Int, minHeight:Int):Void;

	@:native("SDL_GetWindowMinimumSize")
	static inline function getWindowMinimumSize(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_GetWindowMinimumSize({0}, {1}, {2})", window, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}

	@:native("SDL_SetWindowMaximumSize")
	static function setWindowMaximumSize(window:#if SDL_PREFIX SDLWindow #else Window #end, maxWidth:Int, maxHeight:Int):Void;

	@:native("SDL_GetWindowMaximumSize")
	static inline function getWindowMaximumSize(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_GetWindowMaximumSize({0}, {1}, {2})", window, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}

	@:native("SDL_SetWindowBordered")
	static inline function setWindowBordered(window:#if SDL_PREFIX SDLWindow #else Window #end, bordered:Bool):Void {
		untyped __cpp__("SDL_SetWindowBordered({0}, (SDL_bool){1})", window, bordered);
	}

	@:native("SDL_SetWindowResizable")
	static inline function setWindowResizable(window:#if SDL_PREFIX SDLWindow #else Window #end, resizable:Bool):Void {
		untyped __cpp__("SDL_SetWindowResizable({0}, (SDL_bool){1})", window, resizable);
	}

	@:native("SDL_SetWindowAlwaysOnTop")
	static inline function setWindowAlwaysOnTop(window:#if SDL_PREFIX SDLWindow #else Window #end, onTop:Bool):Void {
		untyped __cpp__("SDL_SetWindowAlwaysOnTop({0}, (SDL_bool){1})", window, onTop);
	}

	@:native("SDL_ShowWindow")
	static function showWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_HideWindow")
	static function hideWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_RaiseWindow")
	static function raiseWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_MaximizeWindow")
	static function maximizeWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_MinimizeWindow")
	static function minimizeWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_RestoreWindow")
	static function restoreWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_SetWindowFullscreen")
	static function setWindowFullscreen(window:#if SDL_PREFIX SDLWindow #else Window #end, flags:#if SDL_PREFIX SDLWindowInitFlags #else WindowInitFlags #end):Int;

	@:native("SDL_HasWindowSurface")
	static inline function hasWindowSurface(window:#if SDL_PREFIX SDLWindow #else Window #end):Bool {
		return untyped __cpp__("SDL_HasWindowSurface({0})", window) == Boolean.TRUE;
	}

	@:native("SDL_GetWindowSurface")
	static function getWindowSurface(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLSurface #else Surface #end;

	@:native("SDL_UpdateWindowSurface")
	static function updateWindowSurface(window:#if SDL_PREFIX SDLWindow #else Window #end):Int;

	@:native("SDL_UpdateWindowSurfaceRects")
	static function updateWindowSurfaceRects(window:#if SDL_PREFIX SDLWindow #else Window #end, rects:RawConstPointer<#if SDL_PREFIX SDLRectangle #else Rectangle #end>, numrects:Int):Int;

	@:native("SDL_DestroyWindowSurface")
	static function destroyWindowSurface(window:#if SDL_PREFIX SDLWindow #else Window #end):Int;

	@:native("SDL_SetWindowGrab")
	static inline function setWindowGrab(window:#if SDL_PREFIX SDLWindow #else Window #end, grabbed:Bool):Void {
		untyped __cpp__("SDL_SetWindowGrab({0}, (SDL_bool){1})", window, grabbed);
	}

	@:native("SDL_SetWindowKeyboardGrab")
	static inline function setWindowKeyboardGrab(window:#if SDL_PREFIX SDLWindow #else Window #end, grabbed:Bool):Void {
		untyped __cpp__("SDL_SetWindowKeyboardGrab({0}, (SDL_bool){1})", window, grabbed);
	}
	
	@:native("SDL_SetWindowMouseGrab")
	static inline function setWindowMouseGrab(window:#if SDL_PREFIX SDLWindow #else Window #end, grabbed:Bool):Void {
		untyped __cpp__("SDL_SetWindowMouseGrab({0}, (SDL_bool){1})", window, grabbed);
	}

	@:native("SDL_GetWindowGrab")
	static inline function getWindowGrab(window:#if SDL_PREFIX SDLWindow #else Window #end):Bool {
		return untyped __cpp__("SDL_GetWindowGrab({0})", window) == Boolean.TRUE;
	}

	@:native("SDL_GetWindowKeyboardGrab")
	static inline function getWindowKeyboardGrab(window:#if SDL_PREFIX SDLWindow #else Window #end):Bool {
		return untyped __cpp__("SDL_GetWindowKeyboardGrab({0})", window) == Boolean.TRUE;
	}

	@:native("SDL_GetWindowMouseGrab")
	static inline function getWindowMouseGrab(window:#if SDL_PREFIX SDLWindow #else Window #end):Bool {
		return untyped __cpp__("SDL_GetWindowMouseGrab({0})", window) == Boolean.TRUE;
	}

	@:native("SDL_GetGrabbedWindow")
	static function getGrabbedWindow():#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_SetWindowMouseRect")
	static inline function setWindowMouseRect(window:#if SDL_PREFIX SDLWindow #else Window #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_SetWindowMouseRect({0}, {1})", window, rect);
	}

	@:native("SDL_GetWindowMouseRect")
	static inline function getWindowMouseRect(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		return untyped __cpp__("SDL_GetWindowMouseRect({0})", window);
	}

	@:native("SDL_SetWindowBrightness")
	static function setWindowBrightness(window:#if SDL_PREFIX SDLWindow #else Window #end, brightness:Float):Int;

	@:native("SDL_GetWindowBrightness")
	static function getWindowBrightness(window:#if SDL_PREFIX SDLWindow #else Window #end):Float;

	@:native("SDL_SetWindowOpacity")
	static function setWindowOpacity(window:#if SDL_PREFIX SDLWindow #else Window #end, opacity:Float):Int;

	@:native("SDL_GetWindowOpacity")
	static inline function getWindowOpacity(window:#if SDL_PREFIX SDLWindow #else Window #end):Float {
		untyped __cpp__("float _opac; SDL_GetWindowOpacity({0}, &_opac)", window);
		return untyped __cpp__("_opac");
	}

	@:native("SDL_SetWindowModalFor")
	static function setWindowModalFor(modalWindow:#if SDL_PREFIX SDLWindow #else Window #end, parentWindow:#if SDL_PREFIX SDLWindow #else Window #end):Int;

	@:native("SDL_SetWindowInputFocus")
	static function setWindowInputFocus(window:#if SDL_PREFIX SDLWindow #else Window #end):Int;

	@:native("SDL_SetWindowGammaRamp")
	static function setWindowGammaRamp(window:#if SDL_PREFIX SDLWindow #else Window #end, red:RawConstPointer<UInt16>, green:RawConstPointer<UInt16>, blue:RawConstPointer<UInt16>):Int;

	@:native("SDL_GetWindowGammaRamp")
	static function getWindowGammaRamp(window:#if SDL_PREFIX SDLWindow #else Window #end, red:RawPointer<UInt16>, green:RawPointer<UInt16>, blue:RawPointer<UInt16>):Int;

	@:native("SDL_SetWindowHitTest")
	static inline function setWindowHitTest(window:#if SDL_PREFIX SDLWindow #else Window #end, callback:#if SDL_PREFIX SDLHitTest #else HitTest #end, callbackData:Any):Int {
		return untyped __cpp__("SDL_SetWindowHitTest({0}, {1}, {2})", window, callback, callbackData);
	}

	@:native("SDL_FlashWindow")
	static function flashWindow(window:#if SDL_PREFIX SDLWindow #else Window #end, operation:#if SDL_PREFIX SDLFlashOperation #else FlashOperation #end):Int;

	@:native("SDL_DestroyWindow")
	static function destroyWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_IsScreenSaverEnabled")
	static inline function isScreenSaverEnabled():Bool {
		return untyped __cpp__("SDL_IsScreenSaverEnabled()") == Boolean.TRUE;
	}

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
	static inline function glExtensionSupported(extension:ConstCharStar):Bool {
		return untyped __cpp__("SDL_GL_ExtensionSupported({0})", extension) == Boolean.TRUE;
	}

	@:native("SDL_GL_ResetAttributes")
	static function glResetAttributes():Void;

	@:native("SDL_GL_SetAttribute")
	static function glSetAttribute(attr:#if SDL_PREFIX SDLGlAttribute #else GlAttribute #end, value:Int):Int;

	@:native("SDL_GL_GetAttribute")
	static inline function glGetAttribute(attr:#if SDL_PREFIX SDLGlAttribute #else GlAttribute #end):Null<Int> {
		var result:Int = 0;
		untyped __cpp__("int _val; {0} = SDL_GL_GetAttribute({1}, &_val)", result, attr);
		return (result == 0) ? untyped __cpp__("_val") : null;
	}

	@:native("SDL_GL_CreateContext")
	static function glCreateContext(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLGlContext #else GlContext #end;

	@:native("SDL_GL_MakeCurrent")
	static function glMakeCurrent(window:#if SDL_PREFIX SDLWindow #else Window #end, context:#if SDL_PREFIX SDLGlContext #else GlContext #end):Int;

	@:native("SDL_GL_GetCurrentWindow")
	static function glGetCurrentWindow():#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_GL_GetCurrentContext")
	static function glGetCurrentContext():#if SDL_PREFIX SDLGlContext #else GlContext #end;

	@:native("SDL_GL_GetDrawableSize")
	static inline function glGetDrawableSize(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_GL_GetDrawableSize({0}, {1}, {2})", window, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}

	@:native("SDL_GL_SetSwapInterval")
	static function glSetSwapInterval(interval:Int):Int;

	@:native("SDL_GL_GetSwapInterval")
	static function glGetSwapInterval():Int;

	@:native("SDL_GL_SwapWindow")
	static function glSwapWindow(window:#if SDL_PREFIX SDLWindow #else Window #end):Void;

	@:native("SDL_GL_DeleteContext")
	static function glDeleteContext(context:#if SDL_PREFIX SDLGlContext #else GlContext #end):Void;

	// SDL_render.h //
	@:native("SDL_GetNumRenderDrivers")
	static function getNumRenderDrivers():Int;
	
	@:native("SDL_GetRenderDriverInfo")
	static inline function getRenderDriverInfo(displayIndex:Int):#if SDL_PREFIX SDLRendererInfo #else RendererInfo #end {
		var result:Int = 0;
		untyped __cpp__("SDL_RendererInfo _info; {1} = SDL_GetRenderDriverInfo({0}, &_info)", displayIndex, result);
		return (result == 0) ? untyped __cpp__("_info") : null;
	}

	@:native("SDL_CreateRenderer")
	static function createRenderer(window:#if SDL_PREFIX SDLWindow #else Window #end, index:Int, flags:#if SDL_PREFIX SDLRendererFlags #else RendererFlags #end):#if SDL_PREFIX SDLRenderer #else Renderer #end;

	@:native("SDL_CreateSoftwareRenderer")
	static function createSoftwareRenderer(surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLRenderer #else Renderer #end;

	@:native("SDL_GetRenderer")
	static function getRenderer(window:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLRenderer #else Renderer #end;

	@:native("SDL_RenderGetWindow")
	static function renderGetWindow(renderer:#if SDL_PREFIX SDLWindow #else Window #end):#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_GetRendererInfo")
	static inline function getRendererInfo(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLRendererInfo #else RendererInfo #end {
		var result:Int = 0;
		untyped __cpp__("SDL_RendererInfo _info; {1} = SDL_GetRendererInfo({0}, &_info)", renderer, result);
		return (result == 0) ? untyped __cpp__("_info") : null;
	}

	@:native("SDL_GetRendererOutputSize")
	static inline function getRendererOutputSize(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_GetRendererOutputSize({0}, {1}, {2})", renderer, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}
	
	@:native("SDL_CreateTexture")
	static function createTexture(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, format:UInt32, access:Int, width:Int, height:Int):#if SDL_PREFIX SDLTexture #else Texture #end;

	@:native("SDL_CreateTextureFromSurface")
	static function createTextureFromSurface(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLTexture #else Texture #end;

	@:native("SDL_QueryTexture")
	static function queryTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end, format:RawPointer<#if SDL_PREFIX SDLPixelFormatEnum #else PixelFormatEnum #end>, access:RawPointer<Int>, width:RawPointer<Int>, height:RawPointer<Int>):Int;

	/**
	 * A convienience function not found in base SDL
	 * to get the size of a texture.
	 * 
	 * @return A `Point` set to the width and height of the texture.
	 */
	@:native("SDL_QueryTexture")
	static inline function getTextureSize(texture:#if SDL_PREFIX SDLTexture #else Texture #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var w:Int = 0;
		var h:Int = 0;
		untyped __cpp__("SDL_QueryTexture({0}, NULL, NULL, {1}, {2})", texture, RawPointer.addressOf(w), RawPointer.addressOf(h));
		#if SDL_PREFIX
		return SDLPoint.create(w, h);
		#else
		return Point.create(w, h);
		#end
	}

	@:native("SDL_SetTextureColorMod")
	static function setTextureColorMod(texture:#if SDL_PREFIX SDLTexture #else Texture #end, r:UInt8, g:UInt8, b:UInt8):Int;

	/**
	 * Alpha in returned color will always be 255
	 */
	@:native("SDL_GetTextureColorMod")
	static inline function getTextureColorMod(texture:#if SDL_PREFIX SDLTexture #else Texture #end):#if SDL_PREFIX SDLColor #else Color #end {
		var r:UInt8 = 0;
		var g:UInt8 = 0;
		var b:UInt8 = 0;
		untyped __cpp__("SDL_GetTextureColorMod({0}, {1}, {2}, {3})", texture, RawPointer.addressOf(r), RawPointer.addressOf(g), RawPointer.addressOf(b));
		#if SDL_PREFIX
		return SDLColor.create(r, g, b, 255);
		#else
		return Color.create(r, g, b, 255);
		#end
	}

	@:native("SDL_SetTextureAlphaMod")
	static function setTextureAlphaMod(texture:#if SDL_PREFIX SDLTexture #else Texture #end, alpha:UInt8):Int;

	@:native("SDL_GetTextureAlphaMod")
	static inline function getTextureAlphaMod(texture:#if SDL_PREFIX SDLTexture #else Texture #end):UInt8 {
		var a:UInt8 = 0;
		untyped __cpp__("SDL_GetTextureAlphaMod({0}, {1})", texture, RawPointer.addressOf(a));
		return a;
	}

	@:native("SDL_SetTextureBlendMode")
	static function setTextureBlendMode(texture:#if SDL_PREFIX SDLTexture #else Texture #end, blend:#if SDL_PREFIX SDLBlendMode #else BlendMode #end):Int;

	@:native("SDL_GetTextureBlendMode")
	static inline function getTextureBlendMode(texture:#if SDL_PREFIX SDLTexture #else Texture #end):#if SDL_PREFIX SDLBlendMode #else BlendMode #end {
		var blend:#if SDL_PREFIX SDLBlendMode #else BlendMode #end = INVALID;
		untyped __cpp__("SDL_GetTextureBlendMode({0}, {1})", texture, RawPointer.addressOf(blend));
		return blend;
	}

	@:native("SDL_GetTextureScaleMode")
	static inline function getTextureScaleMode(texture:#if SDL_PREFIX SDLTexture #else Texture #end):#if SDL_PREFIX SDLTextureScaleMode #else TextureScaleMode #end {
		var scaleMode:#if SDL_PREFIX SDLTextureScaleMode #else TextureScaleMode #end = NEAREST;
		untyped __cpp__("SDL_ScaleMode output; SDL_GetTextureScaleMode({0}, &output); {1} = output", texture, scaleMode);
		return scaleMode;
	}

	@:native("SDL_SetTextureScaleMode")
	static inline function setTextureScaleMode(texture:#if SDL_PREFIX SDLTexture #else Texture #end, scaleMode:#if SDL_PREFIX SDLTextureScaleMode #else TextureScaleMode #end):Int {
		return untyped __cpp__("SDL_SetTextureScaleMode({0}, (SDL_ScaleMode){1})", texture, scaleMode);
	}

	@:native("SDL_SetTextureUserData")
	static function setTextureUserData(texture:#if SDL_PREFIX SDLTexture #else Texture #end, userdata:RawPointer<cpp.Void>):Int;

	@:native("SDL_GetTextureUserData")
	static function getTextureUserData(texture:#if SDL_PREFIX SDLTexture #else Texture #end):Any;

	@:native("SDL_UpdateTexture")
	static inline function updateTextureRaw(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:RawConstPointer<#if SDL_PREFIX SDLRectangle #else Rectangle #end>, pixels:Any, pitch:Int) {
		return untyped __cpp__("SDL_UpdateTexture({0}, {1}, (void*){2}, {3})", texture, rect, pixels, pitch);
	}

	@:native("SDL_UpdateTexture")
	static inline function updateTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, pixels:Array<Any>, pitch:Int):Int {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);

		return untyped __cpp__("SDL_UpdateTexture({0}, {1}, _cArray, {2})", texture, RawConstPointer.addressOf(rect), pitch);
	}

	@:native("SDL_UpdateYUVTexture")
	static inline function updateYUVTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, Yplane:Array<UInt8>, Ypitch:Int, Uplane:Array<UInt8>, Upitch:Int, Vplane:Array<UInt8>, Vpitch:Int):Int {
		untyped __cpp__("
		unsigned char* _cArray = (unsigned char*)malloc(sizeof(unsigned char) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", Yplane, Yplane.length);

		untyped __cpp__("
		unsigned char* _cArray2 = (unsigned char*)malloc(sizeof(unsigned char) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray2[i] = {0}->__get(i);
		}", Uplane, Uplane.length);

		untyped __cpp__("
		unsigned char* _cArray3 = (unsigned char*)malloc(sizeof(unsigned char) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray3[i] = {0}->__get(i);
		}", Vplane, Vplane.length);

		return untyped __cpp__("SDL_UpdateYUVTexture({0}, {1}, _cArray, {2}, _cArray2, {3}, _cArray3, {4})", texture, RawConstPointer.addressOf(rect), Ypitch, Upitch, Vpitch);
	}

	@:native("SDL_UpdateNVTexture")
	static inline function updateNVTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, Yplane:Array<UInt8>, Ypitch:Int, UVplane:Array<UInt8>, UVpitch:Int):Int {
		untyped __cpp__("
		unsigned char* _cArray = (unsigned char*)malloc(sizeof(unsigned char) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", Yplane, Yplane.length);

		untyped __cpp__("
		unsigned char* _cArray2 = (unsigned char*)malloc(sizeof(unsigned char) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray2[i] = {0}->__get(i);
		}", UVplane, UVplane.length);

		return untyped __cpp__("SDL_UpdateNVTexture({0}, {1}, _cArray, {2}, _cArray2, {3})", texture, RawConstPointer.addressOf(rect), Ypitch, UVpitch);
	}

	@:native("SDL_LockTexture")
	static inline function lockTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, pixels:Any, pitch:Int):Int {
		return untyped __cpp__("SDL_LockTexture({0}, {1})", texture, RawConstPointer.addressOf(rect), RawPointer.addressOf(pixels), RawPointer.addressOf(pitch));
	}

	@:native("SDL_LockTextureToSurface")
	static inline function lockTextureToSurface(texture:#if SDL_PREFIX SDLTexture #else Texture #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, surface:#if SDL_PREFIX SDLSurface #else Surface #end):Int {
		return untyped __cpp__("SDL_LockTextureToSurface({0}, {1})", texture, RawConstPointer.addressOf(rect), RawPointer.addressOf(surface));
	}

	@:native("SDL_UnlockTexture")
	static function unlockTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end):Void;

	@:native("SDL_RenderTargetSupported")
	static inline function renderTargetSupported(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Bool {
		return untyped __cpp__("SDL_RenderTargetSupported({0})", renderer) == Boolean.TRUE;
	}

	@:native("SDL_SetRenderTarget")
	static function setRenderTarget(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end):Int;

	@:native("SDL_GetRenderTarget")
	static function getRenderTarget(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLTexture #else Texture #end;

	@:native("SDL_RenderSetLogicalSize")
	static function renderSetLogicalSize(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, w:Int, h:Int):Int;

	@:native("SDL_RenderGetLogicalSize")
	static inline function renderGetLogicalSize(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLPoint #else Point #end {
		var width:Int = 0;
		var height:Int = 0;
		untyped __cpp__("SDL_RenderGetLogicalSize({0}, {1}, {2})", renderer, RawPointer.addressOf(width), RawPointer.addressOf(height));
		#if SDL_PREFIX
		return SDLPoint.create(width, height);
		#else
		return Point.create(width, height);
		#end
	}

	@:native("SDL_RenderSetIntegerScale")
	static inline function renderSetIntegerScale(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, enable:Bool):Int {
		return untyped __cpp__("SDL_RenderSetIntegerScale({0}, (SDL_bool){1})", renderer, enable);
	}

	@:native("SDL_RenderGetIntegerScale")
	static inline function renderGetIntegerScale(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Bool {
		return untyped __cpp__("SDL_RenderGetIntegerScale({0})", renderer) == Boolean.TRUE;
	}

	@:native("SDL_RenderSetViewport")
	static inline function renderSetViewport(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_RenderSetViewport({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderGetViewport")
	static inline function renderGetViewport(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end = null;
		untyped __cpp__("SDL_RenderGetViewport({0}, {1})", renderer, RawPointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_RenderSetClipRect")
	static inline function renderSetClipRect(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_RenderSetClipRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderGetClipRect")
	static inline function renderGetClipRect(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end = null;
		untyped __cpp__("SDL_RenderGetClipRect({0}, {1})", renderer, RawPointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_RenderIsClipEnabled")
	static inline function renderIsClipEnabled(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Bool {
		return untyped __cpp__("SDL_RenderIsClipEnabled({0})", renderer) == Boolean.TRUE;
	}

	@:native("SDL_RenderSetScale")
	static function renderSetScale(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, scaleX:Float, scaleY:Float):Int;

	@:native("SDL_RenderGetScale")
	static inline function renderGetScale(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLFPoint #else FPoint #end {
		var scaleX:Float = 0;
		var scaleY:Float = 0;
		untyped __cpp__("SDL_RenderGetScale({0}, {1}, {2})", renderer, RawPointer.addressOf(scaleX), RawPointer.addressOf(scaleY));
		#if SDL_PREFIX
		return SDLFPoint.create(scaleX, scaleY);
		#else
		return FPoint.create(scaleX, scaleY);
		#end
	}

	@:native("SDL_RenderWindowToLogical")
	static inline function renderWindowToLogical(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, windowX:Int, windowY:Int, logicalX:Float, logicalY:Float):Void {
		untyped __cpp__("SDL_RenderWindowToLogical({0}, {1}, {2}, {3}, {4})", renderer, windowX, windowY, RawPointer.addressOf(logicalX), RawPointer.addressOf(logicalY));
	}

	@:native("SDL_RenderLogicalToWindow")
	static inline function renderLogicalToWindow(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, logicalX:Float, logicalY:Float, windowX:Int, windowY:Int):Void {
		untyped __cpp__("SDL_RenderWindowToLogical({0}, {1}, {2}, {3}, {4})", renderer, RawPointer.addressOf(windowX), RawPointer.addressOf(windowY), logicalX, logicalY);
	}

	@:native("SDL_SetRenderDrawColor")
	static function setRenderDrawColor(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, r:UInt8, g:UInt8, b:UInt8, a:UInt8):Int;

	@:native("SDL_GetRenderDrawColor")
	static inline function getRenderDrawColor(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):#if SDL_PREFIX SDLColor #else Color #end {
		var r:UInt8 = 0;
		var g:UInt8 = 0;
		var b:UInt8 = 0;
		var a:UInt8 = 0;
		untyped __cpp__("SDL_GetRenderDrawColor({0}, {1}, {2}, {3}, {4})", renderer, RawPointer.addressOf(r), RawPointer.addressOf(g), RawPointer.addressOf(b), RawPointer.addressOf(a));
		#if SDL_PREFIX
		return SDLColor.create(r, g, b, a);
		#else
		return Color.create(r, g, b, a);
		#end
	}

	@:native("SDL_SetRenderDrawBlendMode")
	static inline function setRenderDrawBlendMode(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, blendMode:#if SDL_PREFIX SDLBlendMode #else BlendMode #end):Int {
		return untyped __cpp__("SDL_SetRenderDrawBlendMode({0}, (SDL_BlendMode){1})", renderer, blendMode);
	}

	@:native("SDL_GetRenderDrawBlendMode")
	static inline function getRenderDrawBlendMode(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, blendMode:#if SDL_PREFIX SDLBlendMode #else BlendMode #end):#if SDL_PREFIX SDLBlendMode #else BlendMode #end {
		var blendMode:#if SDL_PREFIX SDLBlendMode #else BlendMode #end = INVALID;
		untyped __cpp__("SDL_GetRenderDrawBlendMode({0}, {1})", renderer, RawPointer.addressOf(blendMode));
		return blendMode;
	}

	@:native("SDL_RenderClear")
	static function renderClear(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Int;

	@:native("SDL_RenderDrawPoint")
	static function renderDrawPoint(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, x:Int, y:Int):Int;

	@:native("SDL_RenderDrawPoints")
	static inline function renderDrawPoints(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, points:Array<#if SDL_PREFIX SDLPoint #else Point #end>, count:Int):Int {
		untyped __cpp__("
		SDL_Point* _cArray = (SDL_Point*)malloc(sizeof(SDL_Point) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawPoints({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawLine")
	static function renderDrawLine(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, x1:Int, y1:Int, x2:Int, y2:Int):Int;

	@:native("SDL_RenderDrawLines")
	static inline function renderDrawLines(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, points:Array<#if SDL_PREFIX SDLPoint #else Point #end>, count:Int):Int {
		untyped __cpp__("
		SDL_Point* _cArray = (SDL_Point*)malloc(sizeof(SDL_Point) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawLines({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawRect")
	static inline function renderDrawRect(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_RenderDrawRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderDrawRects")
	static inline function renderDrawRects(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rects:Array<#if SDL_PREFIX SDLRectangle #else Rectangle #end>, count:Int):Int {
		untyped __cpp__("
		SDL_Rect* _cArray = (SDL_Rect*)malloc(sizeof(SDL_Rect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderDrawRects({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderFillRect")
	static inline function renderFillRect(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_RenderFillRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderFillRects")
	static inline function renderFillRects(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rects:RawConstPointer<#if SDL_PREFIX SDLRectangle #else Rectangle #end>, count:Int):Int {
		untyped __cpp__("
		SDL_Rect* _cArray = (SDL_Rect*)malloc(sizeof(SDL_Rect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderFillRects({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderCopy")
	static inline function renderCopy(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, src:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_RenderCopy({0}, {1}, {2}, {3})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst));
	}

	@:native("SDL_RenderCopyEx")
	static inline function renderCopyEx(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, src:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLRectangle #else Rectangle #end, angle:Float, center:#if SDL_PREFIX SDLPoint #else Point #end, flip:#if SDL_PREFIX SDLRendererFlip #else RendererFlip #end = NONE):Int {
		return untyped __cpp__("SDL_RenderCopyEx({0}, {1}, {2}, {3}, (double){4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), untyped __cpp__("(SDL_RendererFlip){0}", flip));
	}

	@:native("SDL_RenderDrawPointF")
	static function renderDrawPointF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, x:Float, y:Float):Int;

	@:native("SDL_RenderDrawPointsF")
	static inline function renderDrawPointsF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, points:Array<#if SDL_PREFIX SDLFPoint #else FPoint #end>, count:Int):Int {
		untyped __cpp__("
		SDL_FPoint* _cArray = (SDL_FPoint*)malloc(sizeof(SDL_FPoint) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawPointsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawLineF")
	static function renderDrawLineF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, x1:Float, y1:Float, x2:Float, y2:Float):Int;

	@:native("SDL_RenderDrawLinesF")
	static inline function renderDrawLinesF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, points:Array<#if SDL_PREFIX SDLFPoint #else FPoint #end>, count:Int):Int {
		untyped __cpp__("
		SDL_FPoint* _cArray = (SDL_FPoint*)malloc(sizeof(SDL_FPoint) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawLinesF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawRectF")
	static inline function renderDrawRectF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Int {
		return untyped __cpp__("SDL_RenderDrawRectF({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderDrawRectsF")
	static inline function renderDrawRectsF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rects:Array<#if SDL_PREFIX SDLFRectangle #else FRectangle #end>, count:Int):Int {
		untyped __cpp__("
		SDL_FRect* _cArray = (SDL_FRect*)malloc(sizeof(SDL_FRect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderDrawRectsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderFillRectF")
	static inline function renderFillRectF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Int {
		return untyped __cpp__("SDL_RenderFillRectF({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderFillRectsF")
	static inline function renderFillRectsF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rects:Array<#if SDL_PREFIX SDLFRectangle #else FRectangle #end>, count:Int):Int {
		untyped __cpp__("
		SDL_FRect* _cArray = (SDL_FRect*)malloc(sizeof(SDL_FRect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderFillRectsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderCopyF")
	static inline function renderCopyF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, src:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Int {
		return untyped __cpp__("SDL_RenderCopyF({0}, {1}, {2}, {3})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst));
	}

	@:native("SDL_RenderCopyExF")
	static inline function renderCopyExF(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, src:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, angle:Float, center:#if SDL_PREFIX SDLFPoint #else FPoint #end, flip:#if SDL_PREFIX SDLRendererFlip #else RendererFlip #end = NONE):Int {
		return untyped __cpp__("SDL_RenderCopyExF({0}, {1}, {2}, {3}, (double){4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), untyped __cpp__("(SDL_RendererFlip){0}", flip));
	}

	@:native("SDL_RenderGeometry")
	static inline function renderGeometry(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, vertices:Array<#if SDL_PREFIX SDLVertex #else Vertex #end>, numVertices:Int, indices:Array<Int>, numIndices:Int):Int {
		untyped __cpp__("
		SDL_Vertex* _cArray = (SDL_Vertex*)malloc(sizeof(SDL_Vertex) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", vertices, vertices.length);

		untyped __cpp__("
		int* _cArray2 = (int*)malloc(sizeof(int) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", indices, indices.length);

		return untyped __cpp__("SDL_RenderGeometry({0}, {1}, _cArray, {2}, _cArray2, {3})", renderer, texture, numVertices, numIndices);
	}

	@:native("SDL_RenderGeometryRaw")
	static inline function renderGeometryRaw(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, texture:#if SDL_PREFIX SDLTexture #else Texture #end, xy:Array<Float>, xyStride:Int, color:Array<#if SDL_PREFIX SDLColor #else Color #end>, colorStride:Int, uv:Array<Float>, uvStride:Int, numVertices:Int, indices:Array<Any>, numIndices:Int, sizeIndices:Int):Int {
		untyped __cpp__("
			SDL_Point* _xyArray = (SDL_Point*)malloc(sizeof(SDL_Point) * {1});
			for (int i = 0; i < {1}; i++) {
				_xyArray[i] = {0}->__get(i);
			}", xy, xy.length);

		untyped __cpp__("
			SDL_Color* _colorArray = (SDL_Color*)malloc(sizeof(SDL_Color) * {1});
			for (int i = 0; i < {1}; i++) {
				_colorArray[i] = {0}->__get(i);
			}", color, color.length);

		untyped __cpp__("
			float* _uvArray = (float*)malloc(sizeof(float) * {1});
			for (int i = 0; i < {1}; i++) {
				_uvArray[i] = {0}->__get(i);
			}", uv, uv.length);

		untyped __cpp__("
			void** _indicesArray = (void**)malloc(sizeof(void*) * {1});
			for (int i = 0; i < {1}; i++) {
				_indicesArray[i] = {0}->__get(i);
			}", indices, indices.length);

		return untyped __cpp__("SDL_RenderGeometryRaw({0}, {1}, _xyArray, {2}, _colorArray, {3}, _uvArray, {4}, {5}, _indicesArray, {6}, {7})", renderer, texture, xyStride, colorStride, uvStride, numVertices, numIndices, sizeIndices);
	}

	@:native("SDL_RenderReadPixels")
	static inline function renderReadPixels(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, pixels:Array<Any>, pitch:Int):Int {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);

		return untyped __cpp__("SDL_RenderReadPixels({0}, {1}, {2}, _cArray, {3})", renderer, RawConstPointer.addressOf(rect), format, pitch);
	}

	@:native("SDL_RenderPresent")
	static function renderPresent(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Void;

	@:native("SDL_DestroyTexture")
	static function destroyTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end):Void;

	@:native("SDL_DestroyRenderer")
	static function destroyRenderer(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Void;

	@:native("SDL_RenderFlush")
	static function renderFlush(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Int;

	@:native("SDL_GL_BindTexture")
	static inline function glBindTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end):Int {
		return untyped __cpp__("SDL_GL_BindTexture({0}, NULL, NULL)");
	}

	@:native("SDL_GL_UnbindTexture")
	static function glUnbindTexture(texture:#if SDL_PREFIX SDLTexture #else Texture #end):Int;

	@:native("SDL_RenderGetMetalLayer")
	static function renderGetMetalLayer(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Any;

	@:native("SDL_RenderGetMetalCommandEncoder")
	static function renderGetMetalCommandEncoder(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end):Any;

	@:native("SDL_RenderSetVSync")
	static function renderSetVSync(renderer:#if SDL_PREFIX SDLRenderer #else Renderer #end, vsync:Int):Int;

	// SDL_pixels.h //
	@:native("SDL_GetPixelFormatName")
	static function getPixelFormatName(format:UInt32):ConstCharStar;

	@:native("SDL_PixelFormatEnumToMasks")
	static inline function pixelFormatEnumToMasks(format:UInt32, bitsPerPixel:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32, Amask:UInt32):Bool {
		return untyped __cpp__("SDL_PixelFormatEnumToMasks({0}, {1})", format, RawPointer.addressOf(bitsPerPixel), RawPointer.addressOf(Rmask), RawPointer.addressOf(Gmask), RawPointer.addressOf(Bmask), RawPointer.addressOf(Amask)) == Boolean.TRUE;
	}

	@:native("SDL_MasksToPixelFormatEnum")
	static function masksToPixelFormatEnum(bitsPerPixel:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32, Amask:UInt32):UInt32;

	@:native("SDL_AllocFormat")
	static function allocFormat(pixelFormat:#if SDL_PREFIX SDLPixelFormatEnum #else PixelFormatEnum #end):#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end;

	@:native("SDL_FreeFormat")
	static function freeFormat(format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end):Void;

	@:native("SDL_AllocPalette")
	static function allocPalette(numColors:Int):#if SDL_PREFIX SDLPalette #else Palette #end;

	@:native("SDL_SetPixelFormatPalette")
	static function setPixelFormatPalette(format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, palette:#if SDL_PREFIX SDLPalette #else Palette #end):Int;

	@:native("SDL_SetPaletteColors")
	static inline function setPaletteColors(palette:#if SDL_PREFIX SDLPalette #else Palette #end, colors:Array<#if SDL_PREFIX SDLColor #else Color #end>, firstColor:Int, numColors:Int):Int {
		untyped __cpp__("
			SDL_Color* _colors = (SDL_Color*)malloc({2} * sizeof(SDL_Color));
			for (int i = 0; i < {2}; i++)
				_colors[i] = {1}->__get(i);
			int _result = SDL_SetPaletteColors({0}, _colors, {3}, {4});
			free(_colors)", palette, colors, colors.length, firstColor, numColors);
    	return untyped __cpp__("_result");
	}

	@:native("SDL_FreePalette")
	static function freePalette(palette:#if SDL_PREFIX SDLPalette #else Palette #end):Void;

	@:native("SDL_MapRGB")
	static function mapRGB(format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, r:UInt8, g:UInt8, b:UInt8):UInt32;

	@:native("SDL_MapRGBA")
	static function mapRGBA(format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, r:UInt8, g:UInt8, b:UInt8, a:UInt8):UInt32;

	@:native("SDL_GetRGB")
	static function getRGB(pixel:UInt32, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, r:RawPointer<UInt8>, g:RawPointer<UInt8>, b:RawPointer<UInt8>):Void;

	@:native("SDL_GetRGBA")
	static function getRGBA(pixel:UInt32, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end, r:RawPointer<UInt8>, g:RawPointer<UInt8>, b:RawPointer<UInt8>, a:RawPointer<UInt8>):Void;

	@:native("SDL_CalculateGammaRamp")
	static inline function calculateGammaRamp(gamma:Float):UInt16 {
		untyped __cpp__("unsigned short _ramp; SDL_CalculateGammaRamp({0}, &_ramp)", gamma);
		return untyped __cpp__("_ramp");
	}

	// SDL_rect.h
	@:native("SDL_PointInRect")
	static inline function pointInRect(point:#if SDL_PREFIX SDLPoint #else Point #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_PointInRect(&{0}, &{1})", point, rect) == Boolean.TRUE;
	}
	
	@:native("SDL_RectEmpty")
	static inline function rectEmpty(rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_RectEmpty(&{0})", rect) == Boolean.TRUE;
	}
	
	@:native("SDL_RectEquals")
	static inline function rectEquals(a:#if SDL_PREFIX SDLRectangle #else Rectangle #end, b:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_RectEquals(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_HasIntersection")
	static inline function hasIntersection(a:#if SDL_PREFIX SDLRectangle #else Rectangle #end, b:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_HasIntersection(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_IntersectRect")
	static inline function intersectRect(a:#if SDL_PREFIX SDLRectangle #else Rectangle #end, b:#if SDL_PREFIX SDLRectangle #else Rectangle #end, result:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_IntersectRect(&{0}, &{1}, &{2})", a, b, result) == Boolean.TRUE;
	}
	
	@:native("SDL_UnionRect")
	static inline function unionRect(a:#if SDL_PREFIX SDLRectangle #else Rectangle #end, b:#if SDL_PREFIX SDLRectangle #else Rectangle #end, result:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Void {
		untyped __cpp__("SDL_UnionRect(&{0}, &{1}, &{2})", a, b, result);
	}
	
	@:native("SDL_EnclosePoints")
	static inline function enclosePoints(points:Array<#if SDL_PREFIX SDLPoint #else Point #end>, count:Int, clip:#if SDL_PREFIX SDLRectangle #else Rectangle #end, result:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		untyped __cpp__("
		SDL_Point* _points = (SDL_Point*)malloc({1} * sizeof(SDL_Point));
		for (int i = 0; i < {1}; i++)
			_points[i] = {0}->__get(i);
		int _result = SDL_EnclosePoints(_points, {2}, &{3}, &{4});
		free(_points)", points, points.length, count, clip, result);
    	return untyped __cpp__("_result");
	}
	
	@:native("SDL_IntersectRectAndLine")
	static inline function intersectRectAndLine(rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, x1:Int, y1:Int, x2:Int, y2:Int):Bool {
		return untyped __cpp__("SDL_IntersectRectAndLine(&{0}, &{1}, &{2}, &{3}, &{4})", rect, x1, y1, x2, y2) == Boolean.TRUE;
	}

	@:native("SDL_PointInFRect")
	static inline function pointInFRect(point:#if SDL_PREFIX SDLFPoint #else FPoint #end, rect:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Bool {
		return untyped __cpp__("SDL_PointInFRect(&{0}, &{1})", point, rect) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEmpty")
	static inline function fRectEmpty(rect:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Bool {
		return untyped __cpp__("SDL_FRectEmpty(&{0})", rect) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEqualsEpsilon")
	static inline function fRectEqualsEpsilon(a:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, b:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, epsilon:Float):Bool {
		return untyped __cpp__("SDL_FRectEqualsEpsilon(&{0}, &{1}, {2})", a, b, epsilon) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEquals")
	static inline function fRectEquals(a:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, b:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Bool {
		return untyped __cpp__("SDL_FRectEquals(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_HasIntersectionF")
	static inline function hasIntersectionF(a:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, b:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Bool {
		return untyped __cpp__("SDL_HasIntersectionF(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_IntersectFRect")
	static inline function intersectFRect(a:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, b:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, result:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Bool {
		return untyped __cpp__("SDL_IntersectFRect(&{0}, &{1}, &{2})", a, b, result) == Boolean.TRUE;
	}
	
	@:native("SDL_UnionFRect")
	static inline function unionFRect(a:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, b:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, result:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Void {
		untyped __cpp__("SDL_UnionFRect(&{0}, &{1}, &{2})", a, b, result);
	}
	
	@:native("SDL_UnionFRect")
	static inline function encloseFPoints(points:Array<#if SDL_PREFIX SDLFPoint #else FPoint #end>, count:Int, clip:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, result:#if SDL_PREFIX SDLFRectangle #else FRectangle #end):Int {
		untyped __cpp__("
		SDL_FPoint* _points = (SDL_FPoint*)malloc({1} * sizeof(SDL_FPoint));
		for (int i = 0; i < {1}; i++)
			_points[i] = {0}->__get(i);
		int _result = SDL_EncloseFPoints(_points, {2}, &{3}, &{4});
		free(_points)", points, points.length, count, clip, result);
    	return untyped __cpp__("_result");
	}
	
	@:native("SDL_IntersectFRectAndLine")
	static inline function intersectFRectAndLine(rect:#if SDL_PREFIX SDLFRectangle #else FRectangle #end, x1:Float, y1:Float, x2:Float, y2:Float):Bool {
		return untyped __cpp__("SDL_IntersectFRectAndLine(&{0}, &{1}, &{2}, &{3}, &{4})", rect, x1, y1, x2, y2) == Boolean.TRUE;
	}

	// SDL_surface.h //
	@:native("SDL_CreateRGBSurface")
	static inline function createRGBSurface(width:Int, height:Int, depth:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_CreateRGBSurface(0, {0}, {1}, {2}, {3}, {4}, {5})", width, height, depth, Rmask, Gmask, Bmask);
	}

	@:native("SDL_CreateRGBSurfaceWithFormat")
	static inline function createRGBSurfaceWithFormat(width:Int, height:Int, depth:Int, format:#if SDL_PREFIX SDLPixelFormatEnum #else PixelFormatEnum #end):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_CreateRGBSurfaceWithFormat(0, {0}, {1}, {2}, (SDL_PixelFormatEnum){3})", width, height, depth, format);
	}

	@:native("SDL_CreateRGBSurfaceFrom")
	static inline function createRGBSurfaceFromRaw(pixels:Any, width:Int, height:Int, depth:Int, pitch:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_CreateRGBSurfaceFrom((void*){0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})", pixels, width, height, depth, pitch, Rmask, Gmask, Bmask);
	}

	@:native("SDL_CreateRGBSurfaceFrom")
	static inline function createRGBSurfaceFrom(pixels:Array<Any>, width:Int, height:Int, depth:Int, pitch:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32):#if SDL_PREFIX SDLSurface #else Surface #end {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);
		return untyped __cpp__("SDL_CreateRGBSurfaceFrom(_cArray, {0}, {1}, {2}, {3}, {4}, {5}, {6})", width, height, depth, pitch, Rmask, Gmask, Bmask);
	}

	@:native("SDL_CreateRGBSurfaceWithFormatFrom")
	static inline function createRGBSurfaceWithFormatFromRaw(pixels:Any, width:Int, height:Int, depth:Int, pitch:Int, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_CreateRGBSurfaceWithFormatFrom((void*){0}, {1}, {2}, {3}, {4}, (SDL_PixelFormatEnum){5})", pixels, width, height, depth, pitch, format);
	}

	@:native("SDL_CreateRGBSurfaceWithFormatFrom")
	static inline function createRGBSurfaceWithFormatFrom(pixels:Array<Any>, width:Int, height:Int, depth:Int, pitch:Int, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end):#if SDL_PREFIX SDLSurface #else Surface #end {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);
		return untyped __cpp__("SDL_CreateRGBSurfaceWithFormatFrom(_cArray, {0}, {1}, {2}, {3}, (SDL_PixelFormatEnum){4})", width, height, depth, pitch, format);
	}

	@:native("SDL_FreeSurface")
	static function freeSurface(surface:#if SDL_PREFIX SDLSurface #else Surface #end):Void;

	@:native("SDL_SetSurfacePalette")
	static inline function setSurfacePalette(surface:#if SDL_PREFIX SDLSurface #else Surface #end, palette:#if SDL_PREFIX SDLPalette #else Palette #end):Bool {
		return untyped __cpp__("SDL_SetSurfacePalette({0}, {1})", surface, palette) == Boolean.TRUE;
	}

	@:native("SDL_LockSurface")
	static function lockSurface(surface:#if SDL_PREFIX SDLSurface #else Surface #end):Void;

	@:native("SDL_UnlockSurface")
	static function unlockSurface(surface:#if SDL_PREFIX SDLSurface #else Surface #end):Void;

	@:native("SDL_LoadBMP_RW")
	static function loadBMPRW(src:#if SDL_PREFIX SDLRWops #else RWops #end, freesrc:Int):Void;

	@:native("SDL_LoadBMP")
	static function loadBMP(file:ConstCharStar):Void;

	@:native("SDL_SaveBMP_RW")
	static function saveBMPRW(src:#if SDL_PREFIX SDLRWops #else RWops #end, dst:#if SDL_PREFIX SDLRWops #else RWops #end, freesrc:Int):Void;

	@:native("SDL_SaveBMP")
	static function saveBMP(surface:#if SDL_PREFIX SDLSurface #else Surface #end, file:ConstCharStar):Void;
	
	@:native("SDL_SetSurfaceRLE")
	static function setSurfaceRLE(surface:#if SDL_PREFIX SDLSurface #else Surface #end, flag:Int):Int;

	@:native("SDL_HasSurfaceRLE")
	static inline function hasSurfaceRLE(surface:#if SDL_PREFIX SDLSurface #else Surface #end):Bool {
		return untyped __cpp__("SDL_HasSurfaceRLE({0})", surface) == Boolean.TRUE;
	}

	@:native("SDL_SetColorKey")
	static function setColorKey(surface:#if SDL_PREFIX SDLSurface #else Surface #end, flag:Int, key:UInt32):Int;

	@:native("SDL_HasColorKey")
	static inline function hasColorKey(surface:#if SDL_PREFIX SDLSurface #else Surface #end):Bool {
		return untyped __cpp__("SDL_HasColorKey({0})", surface) == Boolean.TRUE;
	}

	@:native("SDL_GetColorKey")
	static inline function getColorKey(surface:#if SDL_PREFIX SDLSurface #else Surface #end):UInt32 {
		untyped __cpp__("unsigned int _key; SDL_GetColorKey({0}, &_key)", surface);
		return untyped __cpp__("_key");
	}

	@:native("SDL_SetSurfaceColorMod")
	static function setSurfaceColorMod(surface:#if SDL_PREFIX SDLSurface #else Surface #end, r:UInt8, g:UInt8, b:UInt8):Int;

	/**
	 * Alpha in returned color will always be 255
	 */
	@:native("SDL_GetSurfaceColorMod")
	static inline function getSurfaceColorMod(surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLColor #else Color #end {
		var r:UInt8 = 0;
		var g:UInt8 = 0;
		var b:UInt8 = 0;
		untyped __cpp__("SDL_GetSurfaceColorMod({0}, {1}, {2}, {3})", surface, RawPointer.addressOf(r), RawPointer.addressOf(g), RawPointer.addressOf(b));
		#if SDL_PREFIX
		return SDLColor.create(r, g, b, 255);
		#else
		return Color.create(r, g, b, 255);
		#end
	}

	@:native("SDL_SetSurfaceAlphaMod")
	static function setSurfaceAlphaMod(surface:#if SDL_PREFIX SDLSurface #else Surface #end, alpha:UInt8):Int;

	@:native("SDL_GetSurfaceAlphaMod")
	static inline function getSurfaceAlphaMod(surface:#if SDL_PREFIX SDLSurface #else Surface #end):UInt8 {
		var a:UInt8 = 0;
		untyped __cpp__("SDL_GetSurfaceAlphaMod({0}, {1})", surface, RawPointer.addressOf(a));
		return a;
	}

	@:native("SDL_SetSurfaceBlendMode")
	static function setSurfaceBlendMode(surface:#if SDL_PREFIX SDLSurface #else Surface #end, blend:#if SDL_PREFIX SDLBlendMode #else BlendMode #end):Int;

	@:native("SDL_GetSurfaceBlendMode")
	static inline function getSurfaceBlendMode(surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLBlendMode #else BlendMode #end {
		var blend:#if SDL_PREFIX SDLBlendMode #else BlendMode #end = INVALID;
		untyped __cpp__("SDL_GetSurfaceBlendMode({0}, {1})", surface, RawPointer.addressOf(blend));
		return blend;
	}

	@:native("SDL_SetClipRect")
	static inline function setClipRect(surface:#if SDL_PREFIX SDLSurface #else Surface #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Bool {
		return untyped __cpp__("SDL_SetClipRect({0}, {1})", surface, RawConstPointer.addressOf(rect)) == Boolean.TRUE;
	}

	@:native("SDL_GetClipRect")
	static inline function getClipRect(surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLRectangle #else Rectangle #end {
		var rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end = null;
		untyped __cpp__("SDL_GetClipRect({0}, {1})", surface, RawPointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_DuplicateSurface")
	static function duplicateSurface(surface:#if SDL_PREFIX SDLSurface #else Surface #end):#if SDL_PREFIX SDLSurface #else Surface #end;

	@:native("SDL_ConvertSurface")
	static inline function convertSurface(surface:#if SDL_PREFIX SDLSurface #else Surface #end, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormat #end):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_ConvertSurface({0}, {1}, 0)", surface, RawConstPointer.addressOf(format));
	}

	@:native("SDL_ConvertSurfaceFormat")
	static inline function convertSurfaceFormat(surface:#if SDL_PREFIX SDLSurface #else Surface #end, format:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end):#if SDL_PREFIX SDLSurface #else Surface #end {
		return untyped __cpp__("SDL_ConvertSurfaceFormat({0}, (SDL_PixelFormatEnum){1}, 0)", surface, format);
	}

	@:native("SDL_ConvertPixels")
	static inline function convertPixelsRaw(width:Int, height:Int, srcFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, src:Any, srcPitch:Int, dstFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, dst:Any, dstPitch:Int):Int {
		return untyped __cpp__("SDL_ConvertPixels({0}, {1}, (SDL_PixelFormatEnum){2}, {3}, {4}, (SDL_PixelFormatEnum){5}, {6}, {7})");
	}

	@:native("SDL_ConvertPixels")
	static inline function convertPixels(width:Int, height:Int, srcFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, src:Array<Any>, srcPitch:Int, dstFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, dst:Array<Any>, dstPitch:Int):Int {
		untyped __cpp__("
		void** _srcArr = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_srcArr[i] = {0}->__get(i);
		}", src, src.length);

		untyped __cpp__("
		void** _dstArr = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_dstArr[i] = {0}->__get(i);
		}", dst, dst.length);

		return untyped __cpp__("SDL_ConvertPixels({0}, {1}, (SDL_PixelFormatEnum){2}, _srcArr, {3}, (SDL_PixelFormatEnum){4}, _dstArr, {5})", width, height, srcFormat, srcPitch, dstFormat, dstPitch);
	}

	@:native("SDL_PremultiplyAlpha")
	static inline function premultiplyAlpha(width:Int, height:Int, srcFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, src:Array<Any>, srcPitch:Int, dstFormat:#if SDL_PREFIX SDLPixelFormat #else PixelFormatEnum #end, dst:Array<Any>, dstPitch:Int):Int {
		untyped __cpp__("
		void** _srcArr = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_srcArr[i] = {0}->__get(i);
		}", src, src.length);

		untyped __cpp__("
		void** _dstArr = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_dstArr[i] = {0}->__get(i);
		}", dst, dst.length);

		return untyped __cpp__("SDL_PremultiplyAlpha({0}, {1}, (SDL_PixelFormatEnum){2}, _srcArr, {3}, (SDL_PixelFormatEnum){4}, _dstArr, {5})", width, height, srcFormat, srcPitch, dstFormat, dstPitch);
	}
	
	@:native("SDL_FillRect")
	static inline function fillRect(dst:#if SDL_PREFIX SDLSurface #else Surface #end, rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, color:UInt32):Int {
		return untyped __cpp__("SDL_FillRect({0}, {1}, {2})", dst, RawConstPointer.addressOf(rect), color);
	}

	@:native("SDL_FillRects")
	static inline function fillRects(dst:#if SDL_PREFIX SDLSurface #else Surface #end, rects:Array<#if SDL_PREFIX SDLRectangle #else Rectangle #end>, count:Int, color:UInt32):Int {
		untyped __cpp__("
		void** _rects = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_rects[i] = {0}->__get(i);
		}", rects, rects.length);
		
		return untyped __cpp__("SDL_FillRects({0}, _rects, {1}, {2})", dst, count, color);
	}

	@:native("SDL_BlitSurface")
	static inline function blitSurface(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_BlitSurface({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, GAYSEX.addressOf(dstRect));
	}

	@:native("SDL_LowerBlit")
	static inline function lowerBlit(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_LowerBlit({0}, {1}, {2}, {3})", src, GAYSEX.addressOf(srcRect), dst, GAYSEX.addressOf(dstRect));
	}

	@:native("SDL_SoftStretch")
	static inline function softStretch(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_SoftStretch({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawConstPointer.addressOf(dstRect));
	}

	@:native("SDL_SoftStretchLinear")
	static inline function softStretchLinear(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_SoftStretchLinear({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawConstPointer.addressOf(dstRect));
	}

	@:native("SDL_BlitScaled")
	static inline function blitScaled(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_BlitScaled({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, GAYSEX.addressOf(dstRect));
	}

	@:native("SDL_LowerBlitScaled")
	static inline function lowerBlitScaled(src:#if SDL_PREFIX SDLSurface #else Surface #end, srcRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end, dst:#if SDL_PREFIX SDLSurface #else Surface #end, dstRect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Int {
		return untyped __cpp__("SDL_LowerBlitScaled({0}, {1}, {2}, {3})", src, GAYSEX.addressOf(srcRect), dst, GAYSEX.addressOf(dstRect));
	}

	@:native("SDL_SetYUVConversionMode")
	static function setYUVConversionMode(mode:#if SDL_PREFIX SDLYUVConversionMode #else YUVConversionMode #end):Void;

	@:native("SDL_GetYUVConversionMode")
	static function getYUVConversionMode():#if SDL_PREFIX SDLYUVConversionMode #else YUVConversionMode #end;

	@:native("SDL_GetYUVConversionModeForResolution")
	static function getYUVConversionModeForResolution(width:Int, height:Int):#if SDL_PREFIX SDLYUVConversionMode #else YUVConversionMode #end;

	// SDL_syswm.h //
	@:native("SDL_GetWindowWMInfo")
	static inline function getWindowWMInfo(window:#if SDL_PREFIX SDLWindow #else Window #end) {
		untyped __cpp__("SDL_SysWMinfo _info; SDL_GetWindowWMInfo({0}, &_info)", window);
		return untyped __cpp__("_info");
	}

	// SDL_clipboard.h //
	@:native("SDL_SetClipboardText")
	static function setClipboardText(text:ConstCharStar):Int;

	@:native("SDL_GetClipboardText")
	static function getClipboardText():ConstCharStar;

	@:native("SDL_HasClipboardText")
	static inline function hasClipboardText():Bool {
		return untyped __cpp__("SDL_HasClipboardText()") == Boolean.TRUE;
	}

	// SDL_events.h //
	@:native("SDL_PumpEvents")
	static function pumpEvents():Void;

	@:native("SDL_PeepEvents")
	static function peepEvents(events:#if SDL_PREFIX SDLEvent #else Event #end, numEvents:Int, action:#if SDL_PREFIX SDLEventAction #else EventAction #end, minType:#if SDL_PREFIX SDLEventType #else EventType #end, maxType:#if SDL_PREFIX SDLEventType #else EventType #end):Void;
	
	@:native("SDL_HasEvent")
	static inline function hasEvent(type:#if SDL_PREFIX SDLEventType #else EventType #end):Bool {
		return untyped __cpp__("SDL_HasEvent({0})", type) == Boolean.TRUE;
	}

	@:native("SDL_HasEvents")
	static inline function hasEvents(minType:#if SDL_PREFIX SDLEventType #else EventType #end, maxType:#if SDL_PREFIX SDLEventType #else EventType #end):Bool {
		return untyped __cpp__("SDL_HasEvents({0}, {1})", minType, maxType) == Boolean.TRUE;
	}

	@:native("SDL_FlushEvent")
	static function flushEvent(type:#if SDL_PREFIX SDLEventType #else EventType #end):Void;

	@:native("SDL_FlushEvents")
	static function flushEvents(minType:#if SDL_PREFIX SDLEventType #else EventType #end, maxType:#if SDL_PREFIX SDLEventType #else EventType #end):Void;

	@:native("SDL_PollEvent")
	static function pollEvent(event:#if SDL_PREFIX SDLEvent #else Event #end):Int;

	@:native("SDL_WaitEvent")
	static function waitEvent(event:#if SDL_PREFIX SDLEvent #else Event #end):Int;

	@:native("SDL_WaitEventTimeout")
	static function waitEventTimeout(event:#if SDL_PREFIX SDLEvent #else Event #end, timeout:Int):Int;

	@:native("SDL_PushEvent")
	static function pushEvent(event:#if SDL_PREFIX SDLEvent #else Event #end):Int;

	@:native("SDL_SetEventFilter")
	static inline function setEventFilter(filter:#if SDL_PREFIX SDLEventFilter #else EventFilter #end, userdata:Any):Void {
		return untyped __cpp__("SDL_SetEventFilter({0}, (void*){1})", filter, userdata);
	}

	@:native("SDL_GetEventFilter")
	static inline function getEventFilter(userdata:Any):Void {
		return untyped __cpp__("SDL_GetEventFilter({0}, (void**){1})", filter, RawPointer.addressOf(RawPointer.addressOf(userdata)));
	}

	@:native("SDL_AddEventWatch")
	static inline function addEventWatch(filter:#if SDL_PREFIX SDLEventFilter #else EventFilter #end, userdata:Any):Void {
		return untyped __cpp__("SDL_AddEventWatch({0}, (void*){1})", filter, userdata);
	}

	@:native("SDL_DelEventWatch")
	static inline function deleteEventWatch(filter:#if SDL_PREFIX SDLEventFilter #else EventFilter #end, userdata:Any):Void {
		return untyped __cpp__("SDL_DelEventWatch({0}, (void*){1})", filter, userdata);
	}

	@:native("SDL_FilterEvents")
	static inline function filterEvents(filter:#if SDL_PREFIX SDLEventFilter #else EventFilter #end, userdata:Any):Void {
		return untyped __cpp__("SDL_FilterEvents({0}, (void*){1})", filter, userdata);
	}

	@:native("SDL_EventState")
	static function eventState(type:#if SDL_PREFIX SDLEventType #else EventType #end, state:#if SDL_PREFIX SDLEventState #else EventState #end):UInt8;

	@:native("SDL_GetEventState")
	static function getEventState(type:#if SDL_PREFIX SDLEventType #else EventType #end):UInt8;
	
	@:native("SDL_RegisterEvents")
	static function registerEvents(numEvents:Int):UInt32;

	// SDL_keyboard.h //
	@:native("SDL_GetKeyboardFocus")
	static function getKeyboardFocus():#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_GetKeyboardState")
	static inline function getKeyboardStates(numKeys:Int):Array<#if SDL_PREFIX SDLKeyState #else KeyState #end> {
		var sdlKeyStates:CArray<#if SDL_PREFIX SDLKeyState #else KeyState #end> = untyped __cpp__("*SDL_GetKeyboardState({0})", GAYSEX.addressOf(numKeys));
		var stateCount:Int = Helpers.lengthOfArray(sdlKeyStates);

		var haxeKeyStates:Array<#if SDL_PREFIX SDLKeyState #else KeyState #end> = NativeArray.create(stateCount);
		for(i in 0...stateCount) 
			haxeKeyStates[i] = sdlKeyStates[i];
		
		return haxeKeyStates;
	}

	@:native("SDL_ResetKeyboard")
	static function resetKeyboard():Void;

	@:native("SDL_GetModState")
	static function getKeyModState():#if SDL_PREFIX SDLKeyMod #else KeyMod #end; // mod = keyMod, explains the function better

	@:native("SDL_SetModState")
	static function setKeyModState(modState:#if SDL_PREFIX SDLKeyMod #else KeyMod #end):Void; // mod = keyMod, explains the function better

	@:native("SDL_GetKeyFromScancode")
	static function getKeyFromScancode(scancode:#if SDL_PREFIX SDLScanCode #else ScanCode #end):#if SDL_PREFIX SDLKeyCode #else KeyCode #end;

	@:native("SDL_GetScancodeFromKey")
	static function getScancodeFromKey(key:#if SDL_PREFIX SDLKeyCode #else KeyCode #end):#if SDL_PREFIX SDLScanCode #else ScanCode #end;

	@:native("SDL_GetScancodeName")
	static function getScancodeName(scancode:#if SDL_PREFIX SDLScanCode #else ScanCode #end):ConstCharStar;

	@:native("SDL_GetScancodeFromName")
	static function getScancodeFromName(name:ConstCharStar):#if SDL_PREFIX SDLScanCode #else ScanCode #end;

	@:native("SDL_GetKeyName")
	static function getKeyName(key:#if SDL_PREFIX SDLKeyCode #else KeyCode #end):ConstCharStar;

	@:native("SDL_GetKeyFromName")
	static function getKeyFromName(name:ConstCharStar):#if SDL_PREFIX SDLKeyCode #else KeyCode #end;

	@:native("SDL_StartTextInput")
	static function startTextInput():Void;

	@:native("SDL_IsTextInputActive")
	static inline function isTextInputActive():Bool {
		return untyped __cpp__("SDL_IsTextInputActive()") == Boolean.TRUE;
	}

	@:native("SDL_StopTextInput")
	static function stopTextInput():Void;

	@:native("SDL_ClearComposition")
	static function clearComposition():Void;

	@:native("SDL_IsTextInputShown")
	static inline function isTextInputShown():Bool {
		return untyped __cpp__("SDL_IsTextInputShown()") == Boolean.TRUE;
	}

	@:native("SDL_SetTextInputRect")
	static inline function setTextInputRect(rect:#if SDL_PREFIX SDLRectangle #else Rectangle #end):Void {
		untyped __cpp__("SDL_SetTextInputRect({0})", RawConstPointer.addressOf(rect));
	}

	@:native("SDL_HasScreenKeyboardSupport")
	static inline function hasScreenKeyboardSupport():Bool {
		return untyped __cpp__("SDL_HasScreenKeyboardSupport()") == Boolean.TRUE;
	}

	@:native("SDL_IsScreenKeyboardShown")
	static inline function isScreenKeyboardShown(window:#if SDL_PREFIX SDLWindow #else Window #end):Bool {
		return untyped __cpp__("SDL_IsScreenKeyboardShown({0})", window) == Boolean.TRUE;
	}

	// SDL_mouse.h //
	@:native("SDL_GetMouseFocus")
	static function getMouseFocus():#if SDL_PREFIX SDLWindow #else Window #end;

	@:native("SDL_GetMouseState")
	static inline function getMouseState(x:Int, y:Int):#if SDL_PREFIX SDLMouseButton #else MouseButton #end {
		return untyped __cpp__("SDL_GetMouseState({0}, {1})", RawPointer.addressOf(x), RawPointer.addressOf(y));
	}

	@:native("SDL_GetGlobalMouseState")
	static inline function getGlobalMouseState(x:Int, y:Int):#if SDL_PREFIX SDLMouseButton #else MouseButton #end {
		return untyped __cpp__("SDL_GetGlobalMouseState({0}, {1})", RawPointer.addressOf(x), RawPointer.addressOf(y));
	}

	@:native("SDL_GetRelativeMouseState")
	static inline function getRelativeMouseState(x:Int, y:Int):#if SDL_PREFIX SDLMouseButton #else MouseButton #end {
		return untyped __cpp__("SDL_GetRelativeMouseState({0}, {1})", RawPointer.addressOf(x), RawPointer.addressOf(y));
	}

	@:native("SDL_WarpMouseInWindow")
	static function warpMouseInWindow(window:#if SDL_PREFIX SDLWindow #else Window #end, x:Int, y:Int):Void;

	@:native("SDL_WarpMouseGlobal")
	static function warpMouseGlobal(x:Int, y:Int):Void;

	@:native("SDL_SetRelativeMouseMode")
	static inline function setRelativeMouseMode(enabled:Bool):Int {
		return untyped __cpp__("SDL_SetRelativeMouseMode((SDL_bool){0})", enabled);
	}

	@:native("SDL_CaptureMouse")
	static inline function captureMouse(enabled:Bool):Int {
		return untyped __cpp__("SDL_CaptureMouse((SDL_bool){0})", enabled);
	}

	@:native("SDL_GetRelativeMouseMode")
	static inline function getRelativeMouseMode():Bool {
		return untyped __cpp__("SDL_GetRelativeMouseMode()") == Boolean.TRUE;
	}
	
	@:native("SDL_CreateCursor")
	static inline function createCursor(data:UInt8, mask:UInt8, width:Int, height:Int, hotX:Int, hotY:Int):#if SDL_PREFIX SDLCursor #else Cursor #end {
		return untyped __cpp__("SDL_CreateCursor({0}, {1}, {2}, {3}, {4}, {5})", RawPointer.addressOf(data), RawPointer.addressOf(mask), width, height, hotX, hotY);
	}

	@:native("SDL_CreateColorCursor")
	static function createColorCursor(surface:#if SDL_PREFIX SDLSurface #else Surface #end, hotX:Int, hotY:Int):#if SDL_PREFIX SDLCursor #else Cursor #end;

	@:native("SDL_CreateSystemCursor")
	static function createSystemCursor(id:#if SDL_PREFIX SDLSystemCursor #else SystemCursor #end):#if SDL_PREFIX SDLCursor #else Cursor #end;

	@:native("SDL_SetCursor")
	static function setCursor(cursor:#if SDL_PREFIX SDLCursor #else Cursor #end):Void;

	@:native("SDL_GetCursor")
	static function getCursor():#if SDL_PREFIX SDLCursor #else Cursor #end;

	@:native("SDL_GetDefaultCursor")
	static function getDefaultCursor():#if SDL_PREFIX SDLCursor #else Cursor #end;

	@:native("SDL_FreeCursor")
	static function freeCursor(cursor:#if SDL_PREFIX SDLCursor #else Cursor #end):Void;

	/**
	 * Shows/hides the cursor based on the given toggle boolean.
	 */
	@:native("SDL_ShowCursor")
	static inline function toggleCursor(toggle:Bool):Bool { // renamed to toggleCursor bc that name makes more sense
		return untyped __cpp__("SDL_ShowCursor((int){0})", toggle);
	}

	/**
	 * Shows the cursor.
	 */
	@:native("SDL_ShowCursor")
	static inline function showCursor():Bool {
		return untyped __cpp__("SDL_ShowCursor(1)");
	}

	/**
	 * Hides the cursor.
	 */
	@:native("SDL_ShowCursor")
	static inline function hideCursor():Bool {
		return untyped __cpp__("SDL_ShowCursor(0)");
	}

	// SDL_joystick.h //
	@:native("SDL_LockJoysticks")
	static function lockJoysticks():Void;

	@:native("SDL_UnlockJoysticks")
	static function unlockJoysticks():Void;

	@:native("SDL_NumJoysticks")
	static function numJoysticks():Int;

	@:native("SDL_JoystickNameForIndex")
	static function joystickNameForIndex(deviceIndex:Int):ConstCharStar;

	@:native("SDL_JoystickPathForIndex")
	static function joystickPathForIndex(deviceIndex:Int):ConstCharStar;

	@:native("SDL_JoystickGetDevicePlayerIndex")
	static function joystickGetDevicePlayerIndex(deviceIndex:Int):Int;

	@:native("SDL_JoystickGetDeviceGUID")
	static function joystickGetDeviceGUID(deviceIndex:Int):#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end;

	@:native("SDL_JoystickGetDeviceVendor")
	static function joystickGetDeviceVendor(deviceIndex:Int):UInt16;

	@:native("SDL_JoystickGetDeviceProduct")
	static function joystickGetDeviceProduct(deviceIndex:Int):UInt16;

	@:native("SDL_JoystickGetDeviceProductVersion")
	static function joystickGetDeviceProductVersion(deviceIndex:Int):UInt16;

	@:native("SDL_JoystickGetDeviceType")
	static function joystickGetDeviceType(deviceIndex:Int):#if SDL_PREFIX SDLJoystickType #else JoystickType #end;

	@:native("SDL_JoystickGetDeviceInstanceID")
	static function joystickGetDeviceInstanceID(deviceIndex:Int):#if SDL_PREFIX SDLJoystickID #else JoystickID #end;

	@:native("SDL_JoystickOpen")
	static function joystickOpen(deviceIndex:Int):#if SDL_PREFIX SDLJoystick #else Joystick #end;

	@:native("SDL_JoystickFromInstanceID")
	static function joystickFromInstanceID(instanceIndex:Int):#if SDL_PREFIX SDLJoystick #else Joystick #end;

	@:native("SDL_JoystickFromPlayerIndex")
	static function joystickFromPlayerIndex(playerIndex:Int):#if SDL_PREFIX SDLJoystick #else Joystick #end;

	@:native("SDL_JoystickAttachVirtual")
	static function joystickAttachVirtual(type:#if SDL_PREFIX SDLJoystickType #else JoystickType #end, nAxes:Int, nButtons:Int, nHats:Int):Int;
	
	@:native("SDL_JoystickAttachVirtualEx")
	static function joystickAttachVirtualEx(desc:RawConstPointer<#if SDL_PREFIX SDLRawVirtualJoystickDesc #else RawVirtualJoystickDesc #end>):Int;

	@:native("SDL_JoystickDetachVirtual")
	static function joystickDetachVirtual(deviceIndex:Int):Int;

	@:native("SDL_JoystickIsVirtual")
	static inline function joystickIsVirtual(deviceIndex:Int):Bool {
		return untyped __cpp__("SDL_JoystickIsVirtual({0})", deviceIndex) == Boolean.TRUE;
	}

	@:native("SDL_JoystickSetVirtualAxis")
	static function joystickSetVirtualAxis(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, axis:Int, value:Int16):Int;

	@:native("SDL_JoystickSetVirtualButton")
	static function joystickSetVirtualButton(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, button:Int, value:Int16):Int;

	@:native("SDL_JoystickSetVirtualHat")
	static function joystickSetVirtualHat(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, hat:Int, value:Int16):Int;
	
	@:native("SDL_JoystickName")
	static function joystickName(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):ConstCharStar;

	@:native("SDL_JoystickPath")
	static function joystickPath(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):ConstCharStar;

	@:native("SDL_JoystickGetPlayerIndex")
	static function joystickGetPlayerIndex(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Int;

	@:native("SDL_JoystickSetPlayerIndex")
	static function joystickSetPlayerIndex(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, playerIndex:Int):Void;

	@:native("SDL_JoystickGetGUID")
	static function joystickGetGUID(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end;

	@:native("SDL_JoystickGetVendor")
	static function joystickGetVendor(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):UInt16;

	@:native("SDL_JoystickGetProduct")
	static function joystickGetProduct(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):UInt16;

	@:native("SDL_JoystickGetProductVersion")
	static function joystickGetProductVersion(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):UInt16;

	@:native("SDL_JoystickGetFirmwareVersion")
	static function joystickGetFirmwareVersion(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):UInt16;

	@:native("SDL_JoystickGetSerial")
	static function joystickGetSerial(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):ConstCharStar;

	@:native("SDL_JoystickGetType")
	static function joystickGetType(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):#if SDL_PREFIX SDLJoystickType #else JoystickType #end;

	@:native("SDL_JoystickGetGUIDString")
	static inline function joystickGetGUIDString(guid:#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end):CastCharStar {
		untyped __cpp__("char *pszGUID[33];
			SDL_JoystickGetGUIDString({0}, pszGUID, 33)", guid);
		return untyped __cpp__("pszGUID");
	}

	@:native("SDL_JoystickGetGUIDFromString")
	static function joystickGetGUIDFromString(pchGUID:ConstCharStar):#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end;

	@:native("SDL_getJoystickGUIDInfo")
	static inline function getJoystickGUIDInfo(guid:#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end):{vendor:UInt16, product:UInt16, version:UInt16, crc16:UInt16} {
		var vendor:UInt16 = 0;
		var product:UInt16 = 0;
		var version:UInt16 = 0;
		var crc16:UInt16 = 0;
		untyped __cpp__("SDL_GetJoystickGUIDInfo({0}, {1}, {2}, {3}, {4})", guid, RawPointer.addressOf(vendor), RawPointer.addressOf(product), RawPointer.addressOf(version), RawPointer.addressOf(crc16));
		return {
			vendor: vendor,
			product: product,
			version: version,
			crc16: crc16
		};
	}

	@:native("SDL_JoystickGetAttached")
	static inline function joystickGetAttached(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Bool {
		return untyped __cpp__("SDL_JoystickGetAttached({0})", joystick) == Boolean.TRUE;
	}

	@:native("SDL_JoystickInstanceID")
	static function joystickInstanceID(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):#if SDL_PREFIX SDLJoystickID #else JoystickID #end;

	@:native("SDL_JoystickNumAxes")
	static function joystickNumAxes(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Int;

	@:native("SDL_JoystickNumBalls")
	static function joystickNumBalls(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Int;

	@:native("SDL_JoystickNumHats")
	static function joystickNumHats(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Int;

	@:native("SDL_JoystickNumButtons")
	static function joystickNumButtons(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Int;

	@:native("SDL_JoystickUpdate")
	static function joystickUpdate():Void;

	@:native("SDL_JoystickEventState")
	static function joystickEventState(state:Int):Int;

	@:native("SDL_JoystickGetAxis")
	static function joystickGetAxis(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, axis:Int):Int16;

	@:native("SDL_JoystickGetAxisInitialState")
	static inline function joystickGetAxisInitialState(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, axis:Int):Int16 {
		var state:Int16 = 0;
		untyped __cpp__("SDL_JoystickGetAxisInitialState({0}, {1}, {2})", joystick, axis, RawPointer.addressOf(state));
		return state;
	}

	@:native("SDL_JoystickGetHat")
	static function joystickGetHat(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, hat:Int):UInt8;

	@:native("SDL_JoystickGetBall")
	static inline function joystickGetBall(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, ball:Int):#if SDL_PREFIX SDLPoint #else Point #end {
		var dx:Int = 0;
		var dy:Int = 0;
		untyped __cpp__("SDL_JoystickGetBall({0}, {1}, {2})", joystick, RawPointer.addressOf(dx), RawPointer.addressOf(dy));
		#if SDL_PREFIX
		return SDLPoint.create(dx, dy);
		#else
		return Point.create(dx, dy);
		#end
	}

	@:native("SDL_JoystickGetButton")
	static function joystickGetButton(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, button:Int):UInt8;

	@:native("SDL_JoystickRumble")
	static function joystickRumble(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, lowFrequencyRumble:UInt16, highFrequencyRumble:UInt16, durationMS:UInt32):UInt8;

	@:native("SDL_JoystickHasLED")
	static inline function joystickHasLED(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Bool {
		return untyped __cpp__("SDL_JoystickHasLED({0})", joystick) == Boolean.TRUE;
	}

	@:native("SDL_JoystickHasRumble")
	static inline function joystickHasRumble(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Bool {
		return untyped __cpp__("SDL_JoystickHasRumble({0})", joystick) == Boolean.TRUE;
	}

	@:native("SDL_JoystickHasRumbleTriggers")
	static inline function joystickHasRumbleTriggers(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Bool {
		return untyped __cpp__("SDL_JoystickHasRumbleTriggers({0})", joystick) == Boolean.TRUE;
	}

	@:native("SDL_JoystickSetLED")
	static function joystickSetLED(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, red:UInt8, green:UInt8, blue:UInt8):Int;

	@:native("SDL_JoystickSendEffect")
	static inline function joystickSendEffect(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end, data:Any, size:Int):Int {
		return untyped __cpp__("SDL_JoystickSendEffect({0}, (const void*){1}, {2})", joystick, data, size);
	}

	@:native("SDL_JoystickClose")
	static function joystickClose(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):Void;

	@:native("SDL_JoystickCurrentPowerLevel")
	static function joystickCurrentPowerLevel(joystick:#if SDL_PREFIX SDLJoystick #else Joystick #end):#if SDL_PREFIX SDLJoystickPowerLevel #else JoystickPowerLevel #end;

	// SDL_gamecontroller.h //
	/**
	 * Returns the amount of game controllers connected.
	 * 
	 * This is not a function in SDL itself, but was added
	 * for convienience.
	 */
	@:native("SDL_NumJoysticks")
	@:native("SDL_IsGameController")
	static inline function numGameControllers():Int {
		untyped __cpp__("int nJoysticks = SDL_NumJoysticks();
			int nGameControllers = 0;
			for(int i = 0; i < nJoysticks; i++) {
				if(SDL_IsGameController(i))
					nGameControllers++;
			}");
		return untyped __cpp__("nGameControllers");
	}

	@:native("SDL_GameControllerAddMappingsFromRW")
	static function gameControllerAddMappingsFromRW(rw:#if SDL_PREFIX SDLRWops #else RWops #end, freerw:Int):Int;

	@:native("SDL_GameControllerAddMappingsFromFile")
	static function gameControllerAddMappingsFromFile(file:ConstCharStar):Int;

	@:native("SDL_GameControllerAddMapping")
	static function gameControllerAddMapping(file:ConstCharStar):Int;

	@:native("SDL_GameControllerNumMappings")
	static function gameControllerNumMappings():Int;

	@:native("SDL_GameControllerMappingForIndex")
	static function gameControllerMappingForIndex(mappingIndex:Int):CastCharStar;

	@:native("SDL_GameControllerMappingForGUID")
	static function gameControllerMappingForGUID(guid:#if SDL_PREFIX SDLJoystickGUID #else JoystickGUID #end):CastCharStar;

	@:native("SDL_GameControllerMapping")
	static function gameControllerMapping(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):CastCharStar;

	@:native("SDL_IsGameController")
	static inline function isGameController(joystickIndex:Int):Bool {
		return untyped __cpp__("SDL_IsGameController({0})", joystickIndex) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerNameForIndex")
	static function gameControllerNameForIndex(joystickIndex:Int):ConstCharStar;

	@:native("SDL_GameControllerPathForIndex")
	static function gameControllerPathForIndex(joystickIndex:Int):ConstCharStar;

	@:native("SDL_GameControllerTypeForIndex")
	static function gameControllerTypeForIndex(joystickIndex:Int):#if SDL_PREFIX SDLGameControllerType #else GameControllerType #end;

	@:native("SDL_GameControllerMappingForDeviceIndex")
	static function gameControllerMappingForDeviceIndex(deviceIndex:Int):CastCharStar;

	@:native("SDL_GameControllerOpen")
	static function gameControllerOpen(joystickIndex:Int):#if SDL_PREFIX SDLGameController #else GameController #end;

	@:native("SDL_GameControllerFromInstanceID")
	static function gameControllerFromInstanceID(joystickID:#if SDL_PREFIX SDLJoystickID #else JoystickID #end):#if SDL_PREFIX SDLGameController #else GameController #end;

	@:native("SDL_GameControllerFromPlayerIndex")
	static function gameControllerFromPlayerIndex(playerIndex:Int):#if SDL_PREFIX SDLGameController #else GameController #end;

	@:native("SDL_GameControllerName")
	static function gameControllerName(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):ConstCharStar;

	@:native("SDL_GameControllerPath")
	static function gameControllerPath(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):ConstCharStar;

	@:native("SDL_GameControllerGetType")
	static function gameControllerGetType(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):#if SDL_PREFIX SDLGameControllerType #else GameControllerType #end;

	@:native("SDL_GameControllerGetPlayerIndex")
	static function gameControllerGetPlayerIndex(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Int;

	@:native("SDL_GameControllerSetPlayerIndex")
	static function gameControllerSetPlayerIndex(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, playerIndex:Int):Void;

	@:native("SDL_GameControllerGetVendor")
	static function gameControllerGetVendor(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):UInt16;

	@:native("SDL_GameControllerGetProduct")
	static function gameControllerGetProduct(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):UInt16;

	@:native("SDL_GameControllerGetProductVersion")
	static function gameControllerGetProductVersion(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):UInt16;

	@:native("SDL_GameControllerGetFirmwareVersion")
	static function gameControllerGetFirmwareVersion(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):UInt16;

	@:native("SDL_GameControllerGetSerial")
	static function gameControllerGetSerial(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):ConstCharStar;

	@:native("SDL_GameControllerGetSteamHandle")
	static function gameControllerGetSteamHandle(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):UInt64;

	@:native("SDL_GameControllerGetAttached")
	static inline function gameControllerGetAttached(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Bool {
		return untyped __cpp__("SDL_GameControllerGetAttached({0})", gameController) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerGetJoystick")
	static function gameControllerGetJoystick(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):#if SDL_PREFIX SDLJoystick #else Joystick #end;

	@:native("SDL_GameControllerEventState")
	static function gameControllerEventState(state:Int):Int;

	@:native("SDL_GameControllerUpdate")
	static function gameControllerUpdate():Void;

	@:native("SDL_GameControllerGetAxisFromString")
	static function gameControllerGetAxisFromString(str:ConstCharStar):#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end;

	@:native("SDL_GameControllerGetStringForAxis")
	static function gameControllerGetStringForAxis(axis:#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end):ConstCharStar;

	@:native("SDL_GameControllerGetBindForAxis")
	static function gameControllerGetBindForAxis(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, axis:#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end):#if SDL_PREFIX SDLGameControllerButtonBind #else GameControllerButtonBind #end;

	@:native("SDL_GameControllerHasAxis")
	static inline function gameControllerHasAxis(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, axis:#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasAxis({0}, (SDL_GameControllerAxis){1})", gameController, axis) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerGetAxis")
	static function gameControllerGetAxis(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, axis:#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end):Int16;

	@:native("SDL_GameControllerGetButtonFromString")
	static function gameControllerGetButtonFromString(str:ConstCharStar):#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end;

	@:native("SDL_GameControllerGetStringForButton")
	static function gameControllerGetStringForButton(button:#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end):ConstCharStar;

	@:native("SDL_GameControllerGetBindForButton")
	static function gameControllerGetBindForButton(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, button:#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end):#if SDL_PREFIX SDLGameControllerButtonBind #else GameControllerButtonBind #end;

	@:native("SDL_GameControllerHasButton")
	static inline function gameControllerHasButton(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, button:#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasButton({0}, (SDL_GameControllerButton){1})", gameController, button) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerGetButton")
	static function gameControllerGetButton(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, button:#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end):Int16;

	@:native("SDL_GameControllerGetNumTouchpads")
	static function gameControllerGetNumTouchpads(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Int;

	@:native("SDL_GameControllerGetNumTouchpadFingers")
	static function gameControllerGetNumTouchpadFingers(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, touchpad:Int):Int;

	@:native("SDL_GameControllerGetNumTouchpadFinger")
	static function gameControllerGetNumTouchpadFinger(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, touchpad:Int, finger:Int):Int;

	@:native("SDL_GameControllerHasSensor")
	static inline function gameControllerHasSensor(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasSensor({0}, (SDL_SensorType){1})", gameController, type) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerSetSensor")
	static inline function gameControllerSetSensor(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end, enabled:Bool):Int {
		return untyped __cpp__("SDL_GameControllerSetSensor({0}, (SDL_SensorType){1}, (SDL_bool){2})", gameController, type, enabled);
	}

	@:native("SDL_GameControllerIsSensorEnabled")
	static inline function gameControllerIsSensorEnabled(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end):Bool {
		return untyped __cpp__("SDL_GameControllerIsSensorEnabled({0}, (SDL_SensorType){1})", gameController, type) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerGetSensorDataRate")
	static inline function gameControllerGetSensorDataRate(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end):Single {
		return untyped __cpp__("SDL_GameControllerGetSensorDataRate({0}, (SDL_SensorType){1})", gameController, type);
	}

	@:native("SDL_GameControllerGetSensorData")
	static inline function gameControllerGetSensorData(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end, numValues:Int):Single {
		var data:Single = 0;
		untyped __cpp__("SDL_GameControllerGetSensorData({0}, (SDL_SensorType){1}, {2}, {3})", gameController, type, RawPointer.addressOf(data), numValues);
		return data;
	}

	@:native("SDL_GameControllerGetSensorDataWithTimestamp")
	static inline function gameControllerGetSensorDataWithTimestamp(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, type:#if SDL_PREFIX SDLSensorType #else SensorType #end, numValues:Int):{data:Single, timestamp:UInt64} {
		var data:Single = 0;
		var timestamp:UInt64 = 0;
		untyped __cpp__("SDL_GameControllerGetSensorDataWithTimestamp({0}, (SDL_SensorType){1}, {2}, {3}, {4})", gameController, type, RawPointer.addressOf(timestamp), RawPointer.addressOf(data), numValues);
		return {
			data: data,
			timestamp: timestamp
		};
	}

	@:native("SDL_GameControllerRumble")
	static function gameControllerRumble(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, lowFrequencyRumble:UInt16, highFrequencyRumble:UInt16, durationMS:UInt32):Int;

	@:native("SDL_GameControllerRumbleTriggers")
	static function gameControllerRumbleTriggers(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, leftRumble:UInt16, rightRumble:UInt16, durationMS:UInt32):Int;

	@:native("SDL_GameControllerHasLED")
	static inline function gameControllerHasLED(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasLED({0})", gameController) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerHasRumble")
	static inline function gameControllerHasRumble(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasRumble({0})", gameController) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerHasRumbleTriggers")
	static inline function gameControllerHasRumbleTriggers(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Bool {
		return untyped __cpp__("SDL_GameControllerHasRumbleTriggers({0})", gameController) == Boolean.TRUE;
	}

	@:native("SDL_GameControllerSetLED")
	static function gameControllerSetLED(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, red:UInt8, green:UInt8, blue:UInt8):Int;

	@:native("SDL_GameControllerSendEffect")
	static inline function gameControllerSendEffect(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, data:Any, size:Int):Int {
		return untyped __cpp__("SDL_GameControllerSendEffect({0}, (const void*){1}, {2})", gameController, data, size);
	}

	@:native("SDL_GameControllerClose")
	static function gameControllerClose(gameController:#if SDL_PREFIX SDLGameController #else GameController #end):Void;
	
	@:native("SDL_GameControllerGetAppleSFSymbolsNameForButton")
	static function gameControllerGetAppleSFSymbolsNameForButton(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, button:#if SDL_PREFIX SDLGameControllerButton #else GameControllerButton #end):ConstCharStar;
	
	@:native("SDL_GameControllerGetAppleSFSymbolsNameForAxis")
	static function gameControllerGetAppleSFSymbolsNameForAxis(gameController:#if SDL_PREFIX SDLGameController #else GameController #end, axis:#if SDL_PREFIX SDLGameControllerAxis #else GameControllerAxis #end):ConstCharStar;

	// SDL_sensor.h //
	@:native("SDL_LockSensors")
	static function lockSensors():Void;

	@:native("SDL_UnlockSensors")
	static function unlockSensors():Void;

	@:native("SDL_NumSensors")
	static function numSensors():Int;

	@:native("SDL_SensorGetDeviceName")
	static function sensorGetDeviceName(deviceIndex:Int):ConstCharStar;

	@:native("SDL_SensorGetDeviceType")
	static function sensorGetDeviceType(deviceIndex:Int):#if SDL_PREFIX SDLSensorType #else SensorType #end;

	@:native("SDL_SensorGetDeviceNonPortableType")
	static function sensorGetDeviceNonPortableType(deviceIndex:Int):Int;

	@:native("SDL_SensorGetDeviceInstanceID")
	static function sensorGetDeviceInstanceID(deviceIndex:Int):#if SDL_PREFIX SDLSensorID #else SensorID #end;

	@:native("SDL_SensorOpen")
	static function sensorOpen(deviceIndex:Int):#if SDL_PREFIX SDLSensor #else Sensor #end;

	@:native("SDL_SensorFromInstanceID")
	static function sensorFromInstanceID(instanceID:Int):#if SDL_PREFIX SDLSensor #else Sensor #end;

	@:native("SDL_SensorGetName")
	static function sensorGetName(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):ConstCharStar;

	@:native("SDL_SensorGetType")
	static function sensorGetType(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):ConstCharStar;

	@:native("SDL_SensorGetNonPortableType")
	static function sensorGetNonPortableType(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):Int;

	@:native("SDL_SensorGetInstanceID")
	static function sensorGetInstanceID(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):#if SDL_PREFIX SDLSensorID #else SensorID #end;

	@:native("SDL_SensorGetData")
	static inline function sensorGetData(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end, numValues:Int):Single {
		var data:Single = 0;
		untyped __cpp__("SDL_SensorGetData({0}, {1}, {2})", gameController, RawPointer.addressOf(data), numValues);
		return data;
	}

	@:native("SDL_SensorGetDataWithTimestamp")
	static inline function sensorGetDataWithTimestamp(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end, numValues:Int):{data:Single, timestamp:UInt64} {
		var data:Single = 0;
		var timestamp:UInt64 = 0;
		untyped __cpp__("SDL_SensorGetDataWithTimestamp({0}, {1}, {2}, {3})", sensor, RawPointer.addressOf(timestamp), RawPointer.addressOf(data), numValues);
		return {
			data: data,
			timestamp: timestamp
		};
	}

	@:native("SDL_SensorClose")
	static function sensorClose(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):Void;

	@:native("SDL_SensorUpdate")
	static function sensorUpdate(sensor:#if SDL_PREFIX SDLSensor #else Sensor #end):Void;

	// SDL_timer.h
	@:native("SDL_GetTicks")
	static function getTicks():UInt32;

	@:native("SDL_GetTicks64")
	static function getTicks64():UInt64;

	static inline function ticksPassed(tickA:UInt32, tickB:UInt32):Bool {
		return (cast(tickB, Int) - cast(tickA, Int) <= 0);
	}

	@:native("SDL_GetPerformanceCounter")
	static function getPerformanceCounter():UInt64;

	@:native("SDL_GetPerformanceFrequency")
	static function getPerformanceFrequency():UInt64;

	@:native("SDL_Delay")
	static function delay(ms:UInt32):Void; // funny how i mistook "ms" for a float value in seconds when i first made this library

	@:native("SDL_AddTimer")
	static inline function addTimer(intervalMS:UInt32, callback:#if SDL_PREFIX SDLTimerCallback #else TimerCallback #end, param:Any):#if SDL_PREFIX SDLTimerID #else TimerID #end {
		return untyped __cpp__("SDL_AddTimer({0}, {1}, (void*){2})", intervalMS, callback, param);
	}

	@:native("SDL_RemoveTimer")
	static inline function removeTimer(timerID:#if SDL_PREFIX SDLTimerID #else TimerID #end):Bool {
		return untyped __cpp__("SDL_RemoveTimer({0})", timerID) == Boolean.TRUE;
	}

	// haxe helper functions //
	@:native("SDL_Event")
	static inline function makeEvent():#if SDL_PREFIX SDLEvent #else Event #end {
		var event:#if SDL_PREFIX SDLEvent #else Event #end = null;
		untyped __cpp__('SDL_Event __sdl_ev__; {0} = &__sdl_ev__', event);
		return event;
	}
}