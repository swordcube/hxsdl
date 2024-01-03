package sdl;

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
import cpp.Pointer;
import cpp.VarArg;

import sdl.Types;
import sdl.Types.*;

@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

/**
 * The class containing a majority of SDL's functions!
 * 
 * Keep in mind that the functions have been modifyied to be easier used in Haxe.
 */
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
	static inline function getWindowSize(window:Window):Point {
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

	@:native("SDL_GL_GetAttribute")
	static inline function glGetAttribute(attr:GlAttribute):Int {
		var result:Int;
		untyped __cpp__("int _val; {0} = SDL_GL_GetAttribute({1}, &_val)", result, attr);
		return (result == 0) ? untyped __cpp__("_val") : null;
	}

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
	static inline function getTextureScaleMode(texture:Texture):TextureScaleMode {
		var scaleMode:TextureScaleMode;
		untyped __cpp__("SDL_ScaleMode output; SDL_GetTextureScaleMode({0}, &output); {1} = output", texture, scaleMode);
		return scaleMode;
	}

	@:native("SDL_SetTextureScaleMode")
	static inline function setTextureScaleMode(texture:Texture, scaleMode:TextureScaleMode):Int {
		return untyped __cpp__("SDL_SetTextureScaleMode({0}, (SDL_ScaleMode){1})", texture, scaleMode);
	}

	@:native("SDL_SetTextureUserData")
	static function setTextureUserData(texture:Texture, userdata:Pointer<cpp.Void>):Int;

	@:native("SDL_GetTextureUserData")
	static function getTextureUserData(texture:Texture):Any;

	@:native("SDL_UpdateTexture")
	static inline function updateTexture(texture:Texture, rect:Rectangle, pixels:Array<Any>, pitch:Int):Int {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);

		return untyped __cpp__("SDL_UpdateTexture({0}, {1}, _cArray, {2})", texture, RawConstPointer.addressOf(rect), pitch);
	}

	@:native("SDL_UpdateYUVTexture")
	static inline function updateYUVTexture(texture:Texture, rect:Rectangle, Yplane:Array<UInt8>, Ypitch:Int, Uplane:Array<UInt8>, Upitch:Int, Vplane:Array<UInt8>, Vpitch:Int):Int {
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
	static inline function updateNVTexture(texture:Texture, rect:Rectangle, Yplane:Array<UInt8>, Ypitch:Int, UVplane:Array<UInt8>, UVpitch:Int):Int {
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
	static inline function lockTexture(texture:Texture, rect:Rectangle, pixels:Any, pitch:Int):Int {
		return untyped __cpp__("SDL_LockTexture({0}, {1})", texture, RawConstPointer.addressOf(rect), Pointer.addressOf(pixels), Pointer.addressOf(pitch));
	}

	@:native("SDL_LockTextureToSurface")
	static inline function lockTextureToSurface(texture:Texture, rect:Rectangle, surface:Surface):Int {
		return untyped __cpp__("SDL_LockTextureToSurface({0}, {1})", texture, RawConstPointer.addressOf(rect), Pointer.addressOf(surface));
	}

	@:native("SDL_UnlockTexture")
	static function unlockTexture(texture:Texture):Void;

	@:native("SDL_RenderTargetSupported")
	static function renderTargetSupported(renderer:Renderer):Boolean;

	@:native("SDL_SetRenderTarget")
	static function setRenderTarget(renderer:Renderer, texture:Texture):Int;

	@:native("SDL_GetRenderTarget")
	static function getRenderTarget(renderer:Renderer):Texture;

	@:native("SDL_RenderSetLogicalSize")
	static function renderSetLogicalSize(renderer:Renderer, w:Int, h:Int):Int;

	@:native("SDL_RenderGetLogicalSize")
	static inline function renderGetLogicalSize(renderer:Renderer):Point {
		var width:Int;
		var height:Int;
		untyped __cpp__("SDL_RenderGetLogicalSize({0}, {1}, {2})", renderer, Pointer.addressOf(width), Pointer.addressOf(height));
		return Point.create(width, height);
	}

	@:native("SDL_RenderSetIntegerScale")
	static function renderSetIntegerScale(renderer:Renderer, enable:Boolean):Int;

	@:native("SDL_RenderGetIntegerScale")
	static function renderGetIntegerScale(renderer:Renderer):Boolean;

	@:native("SDL_RenderSetViewport")
	static inline function renderSetViewport(renderer:Renderer, rect:Rectangle):Int {
		return untyped __cpp__("SDL_RenderSetViewport({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderGetViewport")
	static inline function renderGetViewport(renderer:Renderer):Rectangle {
		var rect:Rectangle;
		untyped __cpp__("SDL_RenderGetViewport({0}, {1})", renderer, Pointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_RenderSetClipRect")
	static inline function renderSetClipRect(renderer:Renderer, rect:Rectangle):Int {
		return untyped __cpp__("SDL_RenderSetClipRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderGetClipRect")
	static inline function renderGetClipRect(renderer:Renderer):Rectangle {
		var rect:Rectangle;
		untyped __cpp__("SDL_RenderGetClipRect({0}, {1})", renderer, Pointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_RenderIsClipEnabled")
	static function renderIsClipEnabled(renderer:Renderer):Boolean;

	@:native("SDL_RenderSetScale")
	static function renderSetScale(renderer:Renderer, scaleX:Float, scaleY:Float):Int;

	@:native("SDL_RenderGetScale")
	static inline function renderGetScale(renderer:Renderer):FPoint {
		var scaleX:Float;
		var scaleY:Float;
		untyped __cpp__("SDL_RenderGetScale({0}, {1}, {2})", renderer, Pointer.addressOf(scaleX), Pointer.addressOf(scaleY));
		return FPoint.create(scaleX, scaleY);
	}

	@:native("SDL_RenderWindowToLogical")
	static inline function renderWindowToLogical(renderer:Renderer, windowX:Int, windowY:Int, logicalX:Float, logicalY:Float):Void {
		untyped __cpp__("SDL_RenderWindowToLogical({0}, {1}, {2}, {3}, {4})", renderer, windowX, windowY, Pointer.addressOf(logicalX), Pointer.addressOf(logicalY));
	}

	@:native("SDL_RenderLogicalToWindow")
	static inline function renderLogicalToWindow(renderer:Renderer, logicalX:Float, logicalY:Float, windowX:Int, windowY:Int):Void {
		untyped __cpp__("SDL_RenderWindowToLogical({0}, {1}, {2}, {3}, {4})", renderer, Pointer.addressOf(windowX), Pointer.addressOf(windowY), logicalX, logicalY);
	}

	@:native("SDL_SetRenderDrawColor")
	static function setRenderDrawColor(renderer:Renderer, r:UInt8, g:UInt8, b:UInt8, a:UInt8):Int;

	@:native("SDL_GetRenderDrawColor")
	static inline function getRenderDrawColor(renderer:Renderer):Color {
		var r:UInt8 = 0;
		var g:UInt8 = 0;
		var b:UInt8 = 0;
		var a:UInt8 = 0;
		untyped __cpp__("SDL_GetRenderDrawColor({0}, {1}, {2}, {3}, {4})", renderer, Pointer.addressOf(r), Pointer.addressOf(g), Pointer.addressOf(b), Pointer.addressOf(a));
		return Color.create(r, g, b, a);
	}

	@:native("SDL_SetRenderDrawBlendMode")
	static function setRenderDrawBlendMode(renderer:Renderer, blendMode:BlendMode):Int;

	@:native("SDL_GetRenderDrawBlendMode")
	static inline function getRenderDrawBlendMode(renderer:Renderer, blendMode:BlendMode):BlendMode {
		var blendMode:BlendMode;
		untyped __cpp__("SDL_GetRenderDrawBlendMode({0}, {1})", renderer, Pointer.addressOf(blendMode));
		return blendMode;
	}

	@:native("SDL_RenderClear")
	static function renderClear(renderer:Renderer):Int;

	@:native("SDL_RenderDrawPoint")
	static function renderDrawPoint(renderer:Renderer, x:Int, y:Int):Int;

	@:native("SDL_RenderDrawPoints")
	static inline function renderDrawPoints(renderer:Renderer, points:Array<Point>, count:Int):Int {
		untyped __cpp__("
		SDL_Point* _cArray = (SDL_Point*)malloc(sizeof(SDL_Point) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawPoints({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawLine")
	static function renderDrawLine(renderer:Renderer, x1:Int, y1:Int, x2:Int, y2:Int):Int;

	@:native("SDL_RenderDrawLines")
	static inline function renderDrawLines(renderer:Renderer, points:Array<Point>, count:Int):Int {
		untyped __cpp__("
		SDL_Point* _cArray = (SDL_Point*)malloc(sizeof(SDL_Point) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawLines({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawRect")
	static inline function renderDrawRect(renderer:Renderer, rect:Rectangle):Int {
		return untyped __cpp__("SDL_RenderDrawRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderDrawRects")
	static inline function renderDrawRects(renderer:Renderer, rects:Array<Rectangle>, count:Int):Int {
		untyped __cpp__("
		SDL_Rect* _cArray = (SDL_Rect*)malloc(sizeof(SDL_Rect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderDrawRects({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderFillRect")
	static inline function renderFillRect(renderer:Renderer, rect:Rectangle):Int {
		return untyped __cpp__("SDL_RenderFillRect({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderFillRects")
	static inline function renderFillRects(renderer:Renderer, rects:RawConstPointer<Rectangle>, count:Int):Int {
		untyped __cpp__("
		SDL_Rect* _cArray = (SDL_Rect*)malloc(sizeof(SDL_Rect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderFillRects({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderCopy")
	static inline function renderCopy(renderer:Renderer, texture:Texture, src:Rectangle, dst:Rectangle):Int {
		return untyped __cpp__("SDL_RenderCopy({0}, {1}, {2}, {3})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst));
	}

	@:native("SDL_RenderCopyEx")
	static inline function renderCopyEx(renderer:Renderer, texture:Texture, src:Rectangle, dst:Rectangle, angle:Double, center:Point, flip:RendererFlip = NONE):Int {
		return untyped __cpp__("SDL_RenderCopyEx({0}, {1}, {2}, {3}, {4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), untyped __cpp__("(SDL_RendererFlip){0}", flip));
	}

	@:native("SDL_RenderDrawPointF")
	static function renderDrawPointF(renderer:Renderer, x:Float, y:Float):Int;

	@:native("SDL_RenderDrawPointsF")
	static inline function renderDrawPointsF(renderer:Renderer, points:Array<FPoint>, count:Int):Int {
		untyped __cpp__("
		SDL_FPoint* _cArray = (SDL_FPoint*)malloc(sizeof(SDL_FPoint) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawPointsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawLineF")
	static function renderDrawLineF(renderer:Renderer, x1:Float, y1:Float, x2:Float, y2:Float):Int;

	@:native("SDL_RenderDrawLinesF")
	static inline function renderDrawLinesF(renderer:Renderer, points:Array<FPoint>, count:Int):Int {
		untyped __cpp__("
		SDL_FPoint* _cArray = (SDL_FPoint*)malloc(sizeof(SDL_FPoint) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", points, points.length);

		return untyped __cpp__("SDL_RenderDrawLinesF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderDrawRectF")
	static inline function renderDrawRectF(renderer:Renderer, rect:FRectangle):Int {
		return untyped __cpp__("SDL_RenderDrawRectF({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderDrawRectsF")
	static inline function renderDrawRectsF(renderer:Renderer, rects:Array<FRectangle>, count:Int):Int {
		untyped __cpp__("
		SDL_FRect* _cArray = (SDL_FRect*)malloc(sizeof(SDL_FRect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderDrawRectsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderFillRectF")
	static inline function renderFillRectF(renderer:Renderer, rect:FRectangle):Int {
		return untyped __cpp__("SDL_RenderFillRectF({0}, {1})", renderer, RawConstPointer.addressOf(rect));
	}

	@:native("SDL_RenderFillRectsF")
	static inline function renderFillRectsF(renderer:Renderer, rects:Array<FRectangle>, count:Int):Int {
		untyped __cpp__("
		SDL_FRect* _cArray = (SDL_FRect*)malloc(sizeof(SDL_FRect) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", rects, rects.length);

		return untyped __cpp__("SDL_RenderFillRectsF({0}, _cArray, {1})", renderer, count);
	}

	@:native("SDL_RenderCopyF")
	static inline function renderCopyF(renderer:Renderer, texture:Texture, src:Rectangle, dst:FRectangle):Int {
		return untyped __cpp__("SDL_RenderCopyF({0}, {1}, {2}, {3})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst));
	}

	@:native("SDL_RenderCopyExF")
	static inline function renderCopyExF(renderer:Renderer, texture:Texture, src:Rectangle, dst:FRectangle, angle:Double, center:FPoint, flip:RendererFlip = NONE):Int {
		return untyped __cpp__("SDL_RenderCopyExF({0}, {1}, {2}, {3}, {4}, {5}, {6})", renderer, texture, RawConstPointer.addressOf(src), RawConstPointer.addressOf(dst), angle, RawConstPointer.addressOf(center), untyped __cpp__("(SDL_RendererFlip){0}", flip));
	}

	@:native("SDL_RenderGeometry")
	static inline function renderGeometry(renderer:Renderer, texture:Texture, vertices:Array<Vertex>, numVertices:Int, indices:Array<Int>, numIndices:Int):Int {
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
	static inline function renderGeometryRaw(renderer:Renderer, texture:Texture, xy:Array<Float>, xyStride:Int, color:Array<Color>, colorStride:Int, uv:Array<Float>, uvStride:Int, numVertices:Int, indices:Array<Any>, numIndices:Int, sizeIndices:Int):Int {
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
	static inline function renderReadPixels(renderer:Renderer, rect:Rectangle, format:PixelFormat, pixels:Array<Any>, pitch:Int):Int {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);

		return untyped __cpp__("SDL_RenderReadPixels({0}, {1}, {2}, _cArray, {3})", renderer, RawConstPointer.addressOf(rect), format, pitch);
	}

	@:native("SDL_RenderPresent")
	static function renderPresent(renderer:Renderer):Void;

	@:native("SDL_DestroyTexture")
	static function destroyTexture(texture:Texture):Void;

	@:native("SDL_DestroyRenderer")
	static function destroyRenderer(renderer:Renderer):Void;

	@:native("SDL_RenderFlush")
	static function renderFlush(renderer:Renderer):Int;

	@:native("SDL_GL_BindTexture")
	static inline function glBindTexture(texture:Texture):Int {
		return untyped __cpp__("SDL_GL_BindTexture({0}, NULL, NULL)");
	}

	@:native("SDL_GL_UnbindTexture")
	static function glUnbindTexture(texture:Texture):Int;

	@:native("SDL_RenderGetMetalLayer")
	static function renderGetMetalLayer(renderer:Renderer):Any;

	@:native("SDL_RenderGetMetalCommandEncoder")
	static function renderGetMetalCommandEncoder(renderer:Renderer):Any;

	@:native("SDL_RenderSetVSync")
	static function renderSetVSync(renderer:Renderer, vsync:Int):Int;

	// SDL_pixels.h //
	@:native("SDL_GetPixelFormatName")
	static function getPixelFormatName(format:UInt32):ConstCharStar;

	@:native("SDL_PixelFormatEnumToMasks")
	static inline function pixelFormatEnumToMasks(format:UInt32, bitsPerPixel:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32, Amask:UInt32):Boolean {
		return untyped __cpp__("SDL_PixelFormatEnumToMasks({0}, {1})", format, Pointer.addressOf(bitsPerPixel), Pointer.addressOf(Rmask), Pointer.addressOf(Gmask), Pointer.addressOf(Bmask), Pointer.addressOf(Amask));
	}

	@:native("SDL_MasksToPixelFormatEnum")
	static function masksToPixelFormatEnum(bitsPerPixel:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32, Amask:UInt32):UInt32;

	@:native("SDL_AllocFormat")
	static function allocFormat(pixelFormat:PixelFormatEnum):PixelFormat;

	@:native("SDL_FreeFormat")
	static function freeFormat(format:PixelFormat):Void;

	@:native("SDL_AllocPalette")
	static function allocPalette(numColors:Int):Palette;

	@:native("SDL_SetPixelFormatPalette")
	static function setPixelFormatPalette(format:PixelFormat, palette:Palette):Int;

	@:native("SDL_SetPaletteColors")
	static inline function setPaletteColors(palette:Palette, colors:Array<Color>, firstColor:Int, numColors:Int):Int {
		untyped __cpp__("
			SDL_Color* _colors = (SDL_Color*)malloc({2} * sizeof(SDL_Color));
			for (int i = 0; i < {2}; i++)
				_colors[i] = {1}->__get(i);
			int _result = SDL_SetPaletteColors({0}, _colors, {3}, {4});
			free(_colors)", palette, colors, colors.length, firstColor, numColors);
    	return untyped __cpp__("_result");
	}

	@:native("SDL_FreePalette")
	static function freePalette(palette:Palette):Void;

	@:native("SDL_MapRGB")
	static function mapRGB(format:PixelFormat, r:UInt8, g:UInt8, b:UInt8):UInt32;

	@:native("SDL_MapRGBA")
	static function mapRGBA(format:PixelFormat, r:UInt8, g:UInt8, b:UInt8, a:UInt8):UInt32;

	@:native("SDL_GetRGB")
	static function getRGB(pixel:UInt32, format:PixelFormat, r:Pointer<UInt8>, g:Pointer<UInt8>, b:Pointer<UInt8>):Void;

	@:native("SDL_GetRGBA")
	static function getRGBA(pixel:UInt32, format:PixelFormat, r:Pointer<UInt8>, g:Pointer<UInt8>, b:Pointer<UInt8>, a:Pointer<UInt8>):Void;

	@:native("SDL_CalculateGammaRamp")
	static inline function calculateGammaRamp(gamma:Float):UInt16 {
		untyped __cpp__("unsigned short _ramp; SDL_CalculateGammaRamp({0}, &_ramp)", gamma);
		return untyped __cpp__("_ramp");
	}

	// SDL_rect.h
	@:native("SDL_PointInRect")
	static inline function pointInRect(point:Point, rect:Rectangle):Bool {
		return untyped __cpp__("SDL_PointInRect(&{0}, &{1})", point, rect) == Boolean.TRUE;
	}
	
	@:native("SDL_RectEmpty")
	static inline function rectEmpty(rect:Rectangle):Bool {
		return untyped __cpp__("SDL_RectEmpty(&{0})", rect) == Boolean.TRUE;
	}
	
	@:native("SDL_RectEquals")
	static inline function rectEquals(a:Rectangle, b:Rectangle):Bool {
		return untyped __cpp__("SDL_RectEquals(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_HasIntersection")
	static inline function hasIntersection(a:Rectangle, b:Rectangle):Bool {
		return untyped __cpp__("SDL_HasIntersection(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_IntersectRect")
	static inline function intersectRect(a:Rectangle, b:Rectangle, result:Rectangle):Bool {
		return untyped __cpp__("SDL_IntersectRect(&{0}, &{1}, &{2})", a, b, result) == Boolean.TRUE;
	}
	
	@:native("SDL_UnionRect")
	static inline function unionRect(a:Rectangle, b:Rectangle, result:Rectangle):Void {
		untyped __cpp__("SDL_UnionRect(&{0}, &{1}, &{2})", a, b, result);
	}
	
	@:native("SDL_EnclosePoints")
	static inline function enclosePoints(points:Array<Point>, count:Int, clip:Rectangle, result:Rectangle):Int {
		untyped __cpp__("
		SDL_Point* _points = (SDL_Point*)malloc({1} * sizeof(SDL_Point));
		for (int i = 0; i < {1}; i++)
			_points[i] = {0}->__get(i);
		int _result = SDL_EnclosePoints(_points, {2}, &{3}, &{4});
		free(_points)", points, points.length, count, clip, result);
    	return untyped __cpp__("_result");
	}
	
	@:native("SDL_IntersectRectAndLine")
	static inline function intersectRectAndLine(rect:Rectangle, x1:Int, y1:Int, x2:Int, y2:Int):Bool {
		return untyped __cpp__("SDL_IntersectRectAndLine(&{0}, &{1}, &{2}, &{3}, &{4})", rect, x1, y1, x2, y2) == Boolean.TRUE;
	}

	@:native("SDL_PointInFRect")
	static inline function pointInFRect(point:FPoint, rect:FRectangle):Bool {
		return untyped __cpp__("SDL_PointInFRect(&{0}, &{1})", point, rect) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEmpty")
	static inline function fRectEmpty(rect:FRectangle):Bool {
		return untyped __cpp__("SDL_FRectEmpty(&{0})", rect) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEqualsEpsilon")
	static inline function fRectEqualsEpsilon(a:FRectangle, b:FRectangle, epsilon:Float):Bool {
		return untyped __cpp__("SDL_FRectEqualsEpsilon(&{0}, &{1}, {2})", a, b, epsilon) == Boolean.TRUE;
	}
	
	@:native("SDL_FRectEquals")
	static inline function fRectEquals(a:FRectangle, b:FRectangle):Bool {
		return untyped __cpp__("SDL_FRectEquals(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_HasIntersectionF")
	static inline function hasIntersectionF(a:FRectangle, b:FRectangle):Bool {
		return untyped __cpp__("SDL_HasIntersectionF(&{0}, &{1})", a, b) == Boolean.TRUE;
	}
	
	@:native("SDL_IntersectFRect")
	static inline function intersectFRect(a:FRectangle, b:FRectangle, result:FRectangle):Bool {
		return untyped __cpp__("SDL_IntersectFRect(&{0}, &{1}, &{2})", a, b, result) == Boolean.TRUE;
	}
	
	@:native("SDL_UnionFRect")
	static inline function unionFRect(a:FRectangle, b:FRectangle, result:FRectangle):Void {
		untyped __cpp__("SDL_UnionFRect(&{0}, &{1}, &{2})", a, b, result);
	}
	
	@:native("SDL_UnionFRect")
	static inline function encloseFPoints(points:Array<FPoint>, count:Int, clip:FRectangle, result:FRectangle):Int {
		untyped __cpp__("
		SDL_FPoint* _points = (SDL_FPoint*)malloc({1} * sizeof(SDL_FPoint));
		for (int i = 0; i < {1}; i++)
			_points[i] = {0}->__get(i);
		int _result = SDL_EncloseFPoints(_points, {2}, &{3}, &{4});
		free(_points)", points, points.length, count, clip, result);
    	return untyped __cpp__("_result");
	}
	
	@:native("SDL_IntersectFRectAndLine")
	static inline function intersectFRectAndLine(rect:FRectangle, x1:Float, y1:Float, x2:Float, y2:Float):Bool {
		return untyped __cpp__("SDL_IntersectFRectAndLine(&{0}, &{1}, &{2}, &{3}, &{4})", rect, x1, y1, x2, y2) == Boolean.TRUE;
	}

	// SDL_surface.h //
	@:native("SDL_CreateRGBSurface")
	static inline function createRGBSurface(width:Int, height:Int, depth:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32):Surface {
		return untyped __cpp__("SDL_CreateRGBSurface(0, {0}, {1}, {2}, {3}, {4}, {5})", width, height, depth, Rmask, Gmask, Bmask);
	}

	@:native("SDL_CreateRGBSurfaceWithFormat")
	static inline function createRGBSurfaceWithFormat(width:Int, height:Int, depth:Int, format:PixelFormatEnum):Surface {
		return untyped __cpp__("SDL_CreateRGBSurfaceWithFormat(0, {0}, {1}, {2}, {3})", width, height, depth, format);
	}

	@:native("SDL_CreateRGBSurfaceFrom")
	static inline function createRGBSurfaceFrom(pixels:Array<Any>, width:Int, height:Int, depth:Int, pitch:Int, Rmask:UInt32, Gmask:UInt32, Bmask:UInt32):Surface {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);
		return untyped __cpp__("SDL_CreateRGBSurfaceFrom(_cArray, {0}, {1}, {2}, {3}, {4}, {5}, {6})", width, height, depth, pitch, Rmask, Gmask, Bmask);
	}

	@:native("SDL_CreateRGBSurfaceWithFormatFrom")
	static inline function createRGBSurfaceWithFormatFrom(pixels:Array<Any>, width:Int, height:Int, depth:Int, pitch:Int, format:PixelFormatEnum):Surface {
		untyped __cpp__("
		void** _cArray = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_cArray[i] = {0}->__get(i);
		}", pixels, pixels.length);
		return untyped __cpp__("SDL_CreateRGBSurfaceWithFormatFrom(_cArray, {0}, {1}, {2}, {3}, {4})", width, height, depth, pitch, format);
	}

	@:native("SDL_FreeSurface")
	static function freeSurface(surface:Surface):Void;

	@:native("SDL_SetSurfacePalette")
	static function setSurfacePalette(surface:Surface, palette:Palette):Boolean;

	@:native("SDL_LockSurface")
	static function lockSurface(surface:Surface):Void;

	@:native("SDL_UnlockSurface")
	static function unlockSurface(surface:Surface):Void;

	@:native("SDL_LoadBMP_RW")
	static function loadBMPRW(src:RWops, freesrc:Int):Void;

	@:native("SDL_LoadBMP")
	static function loadBMP(file:ConstCharStar):Void;

	@:native("SDL_SaveBMP_RW")
	static function saveBMPRW(src:RWops, dst:RWops, freesrc:Int):Void;

	@:native("SDL_SaveBMP")
	static function saveBMP(surface:Surface, file:ConstCharStar):Void;
	
	@:native("SDL_SetSurfaceRLE")
	static function setSurfaceRLE(surface:Surface, flag:Int):Int;

	@:native("SDL_HasSurfaceRLE")
	static function hasSurfaceRLE(surface:Surface):Boolean;

	@:native("SDL_SetColorKey")
	static function setColorKey(surface:Surface, flag:Int, key:UInt32):Int;

	@:native("SDL_HasColorKey")
	static function hasColorKey(surface:Surface):Boolean;

	@:native("SDL_GetColorKey")
	static inline function getColorKey(surface:Surface):UInt32 {
		untyped __cpp__("unsigned int _key; SDL_GetColorKey({0}, &_key)", surface);
		return untyped __cpp__("_key");
	}

	@:native("SDL_SetSurfaceColorMod")
	static function setSurfaceColorMod(surface:Surface, r:UInt8, g:UInt8, b:UInt8):Int;

	/**
	 * Alpha in returned color will always be 255
	 */
	@:native("SDL_GetSurfaceColorMod")
	static inline function getSurfaceColorMod(surface:Surface):Color {
		var r:UInt8;
		var g:UInt8;
		var b:UInt8;
		untyped __cpp__("SDL_GetSurfaceColorMod({0}, {1}, {2}, {3})", surface, Pointer.addressOf(r), Pointer.addressOf(g), Pointer.addressOf(b));
		return Color.create(r, g, b, 255);
	}

	@:native("SDL_SetSurfaceAlphaMod")
	static function setSurfaceAlphaMod(surface:Surface, alpha:UInt8):Int;

	@:native("SDL_GetSurfaceAlphaMod")
	static inline function getSurfaceAlphaMod(surface:Surface):UInt8 {
		var a:UInt8;
		untyped __cpp__("SDL_GetSurfaceAlphaMod({0}, {1})", surface, Pointer.addressOf(a));
		return a;
	}

	@:native("SDL_SetSurfaceBlendMode")
	static function setSurfaceBlendMode(surface:Surface, blend:BlendMode):Int;

	@:native("SDL_GetSurfaceBlendMode")
	static inline function getSurfaceBlendMode(surface:Surface):BlendMode {
		var blend:BlendMode = INVALID;
		untyped __cpp__("SDL_GetSurfaceBlendMode({0}, {1})", surface, Pointer.addressOf(blend));
		return blend;
	}

	@:native("SDL_SetClipRect")
	static inline function setClipRect(surface:Surface, rect:Rectangle):Bool {
		return untyped __cpp__("SDL_SetClipRect({0}, {1})", surface, RawConstPointer.addressOf(rect)) == Boolean.TRUE;
	}

	@:native("SDL_GetClipRect")
	static inline function getClipRect(surface:Surface):Rectangle {
		var rect:Rectangle;
		untyped __cpp__("SDL_GetClipRect({0}, {1})", surface, Pointer.addressOf(rect));
		return rect;
	}

	@:native("SDL_DuplicateSurface")
	static function duplicateSurface(surface:Surface):Surface;

	@:native("SDL_ConvertSurface")
	static inline function convertSurface(surface:Surface, format:PixelFormat):Surface {
		return untyped __cpp__("SDL_ConvertSurface({0}, {1}, 0)", surface, RawConstPointer.addressOf(format));
	}

	@:native("SDL_ConvertSurfaceFormat")
	static inline function convertSurfaceFormat(surface:Surface, format:PixelFormatEnum):Surface {
		return untyped __cpp__("SDL_ConvertSurfaceFormat({0}, {1}, 0)", surface, format);
	}

	@:native("SDL_ConvertPixels")
	static inline function convertPixels(width:Int, height:Int, srcFormat:PixelFormatEnum, src:Array<Any>, srcPitch:Int, dstFormat:PixelFormatEnum, dst:Array<Any>, dstPitch:Int):Int {
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

		return untyped __cpp__("SDL_ConvertPixels({0}, {1}, _srcArr, {2}, {3}, _dstArr, {4})", width, height, srcFormat, srcPitch, dstFormat, dstPitch);
	}

	@:native("SDL_PremultiplyAlpha")
	static inline function premultiplyAlpha(width:Int, height:Int, srcFormat:PixelFormatEnum, src:Array<Any>, srcPitch:Int, dstFormat:PixelFormatEnum, dst:Array<Any>, dstPitch:Int):Int {
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

		return untyped __cpp__("SDL_PremultiplyAlpha({0}, {1}, _srcArr, {2}, {3}, _dstArr, {4})", width, height, srcFormat, srcPitch, dstFormat, dstPitch);
	}
	
	@:native("SDL_FillRect")
	static inline function fillRect(dst:Surface, rect:Rectangle, color:UInt32):Int {
		return untyped __cpp__("SDL_FillRect({0}, {1}, {2})", dst, RawConstPointer.addressOf(rect), color);
	}

	@:native("SDL_FillRects")
	static inline function fillRects(dst:Surface, rects:Array<Rectangle>, count:Int, color:UInt32):Int {
		untyped __cpp__("
		void** _rects = (void**)malloc(sizeof(void*) * {1});
		for (int i = 0; i < {1}; i++) {
			_rects[i] = {0}->__get(i);
		}", rects, rects.length);
		
		return untyped __cpp__("SDL_FillRects({0}, _rects, {1}, {2})", dst, count, color);
	}

	@:native("SDL_BlitSurface")
	static inline function blitSurface(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_BlitSurface({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawPointer.addressOf(dstRect));
	}

	@:native("SDL_LowerBlit")
	static inline function lowerBlit(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_LowerBlit({0}, {1}, {2}, {3})", src, RawPointer.addressOf(srcRect), dst, RawPointer.addressOf(dstRect));
	}

	@:native("SDL_SoftStretch")
	static inline function softStretch(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_SoftStretch({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawConstPointer.addressOf(dstRect));
	}

	@:native("SDL_SoftStretchLinear")
	static inline function softStretchLinear(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_SoftStretchLinear({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawConstPointer.addressOf(dstRect));
	}

	@:native("SDL_BlitScaled")
	static inline function blitScaled(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_BlitScaled({0}, {1}, {2}, {3})", src, RawConstPointer.addressOf(srcRect), dst, RawPointer.addressOf(dstRect));
	}

	@:native("SDL_LowerBlitScaled")
	static inline function lowerBlitScaled(src:Surface, srcRect:Rectangle, dst:Surface, dstRect:Rectangle):Int {
		return untyped __cpp__("SDL_LowerBlitScaled({0}, {1}, {2}, {3})", src, RawPointer.addressOf(srcRect), dst, RawPointer.addressOf(dstRect));
	}

	@:native("SDL_SetYUVConversionMode")
	static function setYUVConversionMode(mode:YUVConversionMode):Void;

	@:native("SDL_GetYUVConversionMode")
	static function getYUVConversionMode():YUVConversionMode;

	@:native("SDL_GetYUVConversionModeForResolution")
	static function getYUVConversionModeForResolution(width:Int, height:Int):YUVConversionMode;

	// haxe helper functions //
	// @:native("SDL_Event")
	// static inline function makeEvent():Event {
	// 	untyped __cpp__('SDL_Event* __sdl_ev__');
	// 	return untyped __cpp__('__sdl_ev__');
	// }
}