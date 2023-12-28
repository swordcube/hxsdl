package sdl;

import cpp.UInt16;
import cpp.RawConstPointer;
import cpp.UInt64;
import cpp.ConstPointer;
import cpp.VarArg;
import cpp.CastCharStar;
import cpp.Rest;
import cpp.Pointer;
import cpp.ConstCharStar;
import cpp.UInt32;

import sdl.Types;

@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

extern class SDL {
	// SDL.h //
	/**
	 * Initialize the SDL library.
	 *
	 * SDL_Init() simply forwards to calling SDL_InitSubSystem(). Therefore, the
	 * two may be used interchangeably. Though for readability of your code
	 * SDL_InitSubSystem() might be preferred.
	 *
	 * The file I/O (for example: SDL_RWFromFile) and threading (SDL_CreateThread)
	 * subsystems are initialized by default. Message boxes
	 * (SDL_ShowSimpleMessageBox) also attempt to work without initializing the
	 * video subsystem, in hopes of being useful in showing an error dialog when
	 * SDL_Init fails. You must specifically initialize other subsystems if you
	 * use them in your application.
	 *
	 * Logging (such as SDL_Log) works without initialization, too.
	 *
	 * `flags` may be any of the following OR'd together:
	 *
	 * - `SDL_INIT_TIMER`: timer subsystem
	 * - `SDL_INIT_AUDIO`: audio subsystem
	 * - `SDL_INIT_VIDEO`: video subsystem; automatically initializes the events
	 *   subsystem
	 * - `SDL_INIT_JOYSTICK`: joystick subsystem; automatically initializes the
	 *   events subsystem
	 * - `SDL_INIT_HAPTIC`: haptic (force feedback) subsystem
	 * - `SDL_INIT_GAMECONTROLLER`: controller subsystem; automatically
	 *   initializes the joystick subsystem
	 * - `SDL_INIT_EVENTS`: events subsystem
	 * - `SDL_INIT_EVERYTHING`: all of the above subsystems
	 * - `SDL_INIT_NOPARACHUTE`: compatibility; this flag is ignored
	 *
	 * Subsystem initialization is ref-counted, you must call SDL_QuitSubSystem()
	 * for each SDL_InitSubSystem() to correctly shutdown a subsystem manually (or
	 * call SDL_Quit() to force shutdown). If a subsystem is already loaded then
	 * this call will increase the ref-count and return.
	 *
	 * @param flags subsystem initialization flags
	 * @returns 0 on success or a negative error code on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_Init")
	static function init(flags:InitFlags):Int;

	
	/**
	 * Compatibility function to initialize the SDL library.
	 *
	 * In SDL2, this function and SDL_Init() are interchangeable.
	 *
	 * @param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * @returns 0 on success or a negative error code on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_InitSubSystem")
	static function initSubSystem(flags:InitFlags):Int;

	/**
	 * Shut down specific SDL subsystems.
	 *
	 * If you start a subsystem using a call to that subsystem's init function
	 * (for example SDL_VideoInit()) instead of SDL_Init() or SDL_InitSubSystem(),
	 * SDL_QuitSubSystem() and SDL_WasInit() will not work. You will need to use
	 * that subsystem's quit function (SDL_VideoQuit()) directly instead. But
	 * generally, you should not be using those functions directly anyhow; use
	 * SDL_Init() instead.
	 *
	 * You still need to call SDL_Quit() even if you close all open subsystems
	 * with SDL_QuitSubSystem().
	 *
	 * @param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_QuitSubSystem")
	static function quitSubSystem(flags:InitFlags):Void;

	/**
	 * Get a mask of the specified subsystems which are currently initialized.
	 *
	 * @param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * @returns a mask of all initialized subsystems if `flags` is 0, otherwise it
	 *          returns the initialization status of the specified subsystems.
	 *
	 *          The return value does not include SDL_INIT_NOPARACHUTE.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_WasInit")
	static function wasInit(flags:InitFlags):InitFlags;

	/**
	 * Clean up all initialized subsystems.
	 *
	 * You should call this function even if you have already shutdown each
	 * initialized subsystem with SDL_QuitSubSystem(). It is safe to call this
	 * function even in the case of errors in initialization.
	 *
	 * If you start a subsystem using a call to that subsystem's init function
	 * (for example SDL_VideoInit()) instead of SDL_Init() or SDL_InitSubSystem(),
	 * then you must use that subsystem's quit function (SDL_VideoQuit()) to shut
	 * it down before calling SDL_Quit(). But generally, you should not be using
	 * those functions directly anyhow; use SDL_Init() instead.
	 *
	 * You can use this function with atexit() to ensure that it is run when your
	 * application is shutdown, but it is not wise to do this from a library or
	 * other dynamically loaded code.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_Quit")
	static function quit():Void;

	// SDL_hints.h //
	/**
	 * Set a hint with a specific priority.
	 *
	 * The priority controls the behavior when setting a hint that already has a
	 * value. Hints will replace existing hints of their priority and lower.
	 * Environment variables are considered to have override priority.
	 *
	 * @param name the hint to set
	 * @param value the value of the hint variable
	 * @param priority the SDL_HintPriority level for the hint
	 * @returns SDL_TRUE if the hint was set, SDL_FALSE otherwise.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_SetHintWithPriority")
	static function setHintWithPriority(name:ConstCharStar, value:ConstCharStar, priority:HintPriority):Boolean;

	/**
	 * Set a hint with normal priority.
	 *
	 * Hints will not be set if there is an existing override hint or environment
	 * variable that takes precedence. You can use SDL_SetHintWithPriority() to
	 * set the hint with override priority instead.
	 *
	 * @param name the hint to set
	 * @param value the value of the hint variable
	 * @returns SDL_TRUE if the hint was set, SDL_FALSE otherwise.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_SetHint")
	static function setHint(name:ConstCharStar, value:ConstCharStar):Boolean;
	
	/**
	 * Reset a hint to the default value.
	 *
	 * This will reset a hint to the value of the environment variable, or NULL if
	 * the environment isn't set. Callbacks will be called normally with this
	 * change.
	 *
	 * @param name the hint to set
	 * @returns SDL_TRUE if the hint was set, SDL_FALSE otherwise.
	 *
	 * @since SDL 2.24.0.
	 */
	@:native("SDL_ResetHint")
	static function resetHint(name:ConstCharStar):Boolean;
	
	/**
	 * Reset all hints to the default values.
	 *
	 * This will reset all hints to the value of the associated environment
	 * variable, or NULL if the environment isn't set. Callbacks will be called
	 * normally with this change.
	 *
	 * @since SDL 2.26.0.
	 */
	@:native("SDL_ResetHints")
	static function resetHints():Boolean;

	/**
	 * Get the value of a hint.
	 *
	 * @param name the hint to query
	 * @returns the string value of a hint or NULL if the hint isn't set.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_GetHint")
	static function getHint(name:ConstCharStar):ConstCharStar;

	/**
	 * Get the boolean value of a hint variable.
	 *
	 * @param name the name of the hint to get the boolean value from
	 * @param defaultValue the value to return if the hint does not exist
	 * @returns the boolean value of a hint or the provided default value if the
	 *          hint does not exist.
	 *
	 * @since SDL 2.0.5.
	 */
	@:native("SDL_GetHintBoolean")
	static function getHintBoolean(name:ConstCharStar, defaultValue:Boolean):Boolean;

	/**
	 * Add a function to watch a particular hint.
	 *
	 * @param name the hint to watch
	 * @param callback An SDL_HintCallback function that will be called when the
	 *                 hint value changes
	 * @param userdata a pointer to pass to the callback function
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_AddHintCallback")
	static function addHintCallback(name:ConstCharStar, callback:HintCallback, userdata:Pointer<Void>):Void;

	/**
	 * Remove a function watching a particular hint.
	 *
	 * @param name the hint being watched
	 * @param callback An SDL_HintCallback function that will be called when the
	 *                 hint value changes
	 * @param userdata a pointer being passed to the callback function
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_DelHintCallback")
	static function deleteHintCallback(name:ConstCharStar, callback:HintCallback, userdata:Pointer<Void>):Void;

	/**
	 * Clear all hints.
	 *
	 * This function is automatically called during SDL_Quit(), and deletes all
	 * callbacks without calling them and frees all memory associated with hints.
	 * If you're calling this from application code you probably want to call
	 * SDL_ResetHints() instead.
	 *
	 * This function will be removed from the API the next time we rev the ABI.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_ClearHints")
	static function clearHints():Void;

	// SDL_error.h //
	/**
	 * Set the SDL error message for the current thread.
	 *
	 * Calling this function will replace any previous error message that was set.
	 *
	 * This function always returns -1, since SDL frequently uses -1 to signify an
	 * failing result, leading to this idiom:
	 *
	 * ```haxe
	 * if (errorCode) {
	 *     return SDL.setError("This operation has failed: %d", errorCode);
	 * }
	 * ```
	 *
	 * @param fmt a printf()-style message format string
	 * @param args additional parameters matching % tokens in the `fmt` string, if
	 *            any
	 * @returns always -1.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_SetError")
	static function setError(fmt:ConstCharStar, args:Rest<Any>):Int;

	/**
	 * Retrieve a message about the last error that occurred on the current
	 * thread.
	 *
	 * It is possible for multiple errors to occur before calling SDL_GetError().
	 * Only the last error is returned.
	 *
	 * The message is only applicable when an SDL function has signaled an error.
	 * You must check the return values of SDL function calls to determine when to
	 * appropriately call SDL_GetError(). You should *not* use the results of
	 * SDL_GetError() to decide if an error has occurred! Sometimes SDL will set
	 * an error string even when reporting success.
	 *
	 * SDL will *not* clear the error string for successful API calls. You *must*
	 * check return values for failure cases before you can assume the error
	 * string applies.
	 *
	 * Error strings are set per-thread, so an error set in a different thread
	 * will not interfere with the current thread's operation.
	 *
	 * The returned string is internally allocated and must not be freed by the
	 * application.
	 *
	 * @returns a message with information about the specific error that occurred,
	 *          or an empty string if there hasn't been an error message set since
	 *          the last call to SDL_ClearError(). The message is only applicable
	 *          when an SDL function has signaled an error. You must check the
	 *          return values of SDL function calls to determine when to
	 *          appropriately call SDL_GetError().
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_GetError")
	static function getError():ConstCharStar;

	/**
	 * Get the last error message that was set for the current thread.
	 *
	 * This allows the caller to copy the error string into a provided buffer, but
	 * otherwise operates exactly the same as SDL_GetError().
	 *
	 * @param errStr A buffer to fill with the last error message that was set for
	 *               the current thread
	 * @param maxLen The size of the buffer pointed to by the errStr parameter
	 * @returns the pointer passed in as the `errStr` parameter.
	 *
	 * @since SDL 2.0.14.
	 */
	@:native("SDL_GetErrorMsg")
	static function getErrorMessage(errStr:CastCharStar, maxLen:Int):CastCharStar;

	/**
	 * Clear any previous error message for this thread.
	 *
	 * @since SDL 2.0.0.
	 */
	@:native("SDL_ClearError")
	static function clearError():Void;

	// SDL_log.h
	/**
	 * Set the priority of all log categories.
	 *
	 * @param priority the SDL_LogPriority to assign
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogAllSetPriority")
	static function logAllSetPriority(priority:LogPriority):Void;

	/**
	 * Set the priority of a particular log category.
	 *
	 * @param category the category to assign a priority to
	 * @param priority the SDL_LogPriority to assign
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogSetPriority")
	static function logSetPriority(category:LogCategory, priority:LogPriority):Void;

	/**
	 * Get the priority of a particular log category.
	 *
	 * @param category the category to query
	 * \returns the SDL_LogPriority for the requested category
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogGetPriority")
	static function logGetPriority(category:LogCategory):LogPriority;

	/**
	 * Reset all priorities to default.
	 *
	 * This is called by SDL_Quit().
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogResetPriorities")
	static function logResetPriorities():Void;

	/**
	 * Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
	 *
	 * @param fmt a printf() style message format string
	 *
	 * @param args additional parameters matching % tokens in the `fmt` string, if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_Log")
	static function log(fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_VERBOSE.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogVerbose")
	static function logVerbose(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_DEBUG.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogDebug")
	static function logDebug(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_INFO.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogInfo")
	static function logInfo(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_WARN.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogWarn")
	static function logWarn(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_ERROR.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogError")
	static function logError(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with SDL_LOG_PRIORITY_CRITICAL.
	 *
	 * @param category the category of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogCritical")
	static function logCritical(category:LogCategory, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with the specified category and priority.
	 *
	 * @param category the category of the message
	 * @param priority the priority of the message
	 * @param fmt a printf() style message format string
	 * @param args additional parameters matching % tokens in the **fmt** string,
	 *            if any
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogMessage")
	static function logMessage(category:LogCategory, priority:LogPriority, fmt:ConstCharStar, args:Rest<Any>):Void;

	/**
	 * Log a message with the specified category and priority.
	 *
	 * @param category the category of the message
	 * @param priority the priority of the message
	 * @param fmt a printf() style message format string
	 * @param ap a variable argument list
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogMessageV")
	static function logMessageV(category:LogCategory, priority:LogPriority, fmt:ConstCharStar, va:VarArg):Void;

	/**
	 * Get the current log output function.
	 *
	 * @param callback an SDL_LogOutputFunction filled in with the current log callback
	 * @param userdata custom data that is passed to `callback`
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
	@:native("SDL_LogGetOutputFunction")
	static inline function logGetOutputFunction(userdata:Any):LogOutputFunction {
		untyped __cpp__("SDL_LogOutputFunction _func; SDL_LogGetOutputFunction(&_func, &{0})", userdata);
		return untyped __cpp__("_func");
	}
	
	/**
	 * Replace the default log output function with one of your own.
	 *
	 * @param callback an SDL_LogOutputFunction to call instead of the default
	 * @param userdata custom data that is passed to `callback`
	 *
	 * @since This function is available since SDL 2.0.0.
	 */
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

	@:native("SDL_CreateRenderer")
	static function createRenderer(window:Window, index:Int, flags:RendererFlags):Renderer;

	// haxe helper functions //
	@:native("SDL_Event")
	static inline function makeEventPtr():Event {
		untyped __cpp__('SDL_Event __sdl_ev__');
		return untyped __cpp__('__sdl_ev__');
	}
}