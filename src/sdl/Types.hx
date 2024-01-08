package sdl;

import cpp.Int16;
import cpp.RawConstPointer;
import cpp.CastCharStar;
import cpp.Pointer;
import cpp.UInt8;
import cpp.UInt16;
import cpp.UInt32;
import cpp.UInt64;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Helpers;

class Types {}

enum abstract Boolean(Int) from Int to Int {
	var FALSE = 0;
	var TRUE = 1;
}

// SDL.h
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

// SDL_hints.h
enum abstract Hints(ConstCharStar) to ConstCharStar from ConstCharStar {
	var ACCELEROMETER_AS_JOYSTICK = cast "SDL_ACCELEROMETER_AS_JOYSTICK";
	var ALLOW_ALT_TAB_WHILE_GRABBED = cast "SDL_ALLOW_ALT_TAB_WHILE_GRABBED";
	var ALLOW_TOPMOST = cast "SDL_ALLOW_TOPMOST";
	var ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = cast "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION";
	var ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = cast "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION";
	var ANDROID_BLOCK_ON_PAUSE = cast "SDL_ANDROID_BLOCK_ON_PAUSE";
	var ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO = cast "SDL_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO";
	var ANDROID_TRAP_BACK_BUTTON = cast "SDL_ANDROID_TRAP_BACK_BUTTON";
	var APP_NAME = cast "SDL_APP_NAME";
	var APPLE_TV_CONTROLLER_UI_EVENTS = cast "SDL_APPLE_TV_CONTROLLER_UI_EVENTS";
	var APPLE_TV_REMOTE_ALLOW_ROTATION = cast "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION";
	var AUDIO_CATEGORY = cast "SDL_AUDIO_CATEGORY";
	var AUDIO_DEVICE_APP_NAME = cast "SDL_AUDIO_DEVICE_APP_NAME";
	var AUDIO_DEVICE_STREAM_NAME = cast "SDL_AUDIO_DEVICE_STREAM_NAME";
	var AUDIO_DEVICE_STREAM_ROLE = cast "SDL_AUDIO_DEVICE_STREAM_ROLE";
	var AUDIO_RESAMPLING_MODE = cast "SDL_AUDIO_RESAMPLING_MODE";
	var AUTO_UPDATE_JOYSTICKS = cast "SDL_AUTO_UPDATE_JOYSTICKS";
	var AUTO_UPDATE_SENSORS = cast "SDL_AUTO_UPDATE_SENSORS";
	var BMP_SAVE_LEGACY_FORMAT = cast "SDL_BMP_SAVE_LEGACY_FORMAT";
	var DISPLAY_USABLE_BOUNDS = cast "SDL_DISPLAY_USABLE_BOUNDS";
	var EMSCRIPTEN_ASYNCIFY = cast "SDL_EMSCRIPTEN_ASYNCIFY";
	var EMSCRIPTEN_KEYBOARD_ELEMENT = cast "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT";
	var ENABLE_SCREEN_KEYBOARD = cast "SDL_ENABLE_SCREEN_KEYBOARD";
	var ENABLE_STEAM_CONTROLLERS = cast "SDL_ENABLE_STEAM_CONTROLLERS";
	var EVENT_LOGGING = cast "SDL_EVENT_LOGGING";
	var FORCE_RAISEWINDOW = cast "SDL_HINT_FORCE_RAISEWINDOW";
	var FRAMEBUFFER_ACCELERATION = cast "SDL_FRAMEBUFFER_ACCELERATION";
	var GAMECONTROLLERCONFIG = cast "SDL_GAMECONTROLLERCONFIG";
	var GAMECONTROLLERCONFIG_FILE = cast "SDL_GAMECONTROLLERCONFIG_FILE";
	var GAMECONTROLLERTYPE = cast "SDL_GAMECONTROLLERTYPE";
	var GAMECONTROLLER_IGNORE_DEVICES = cast "SDL_GAMECONTROLLER_IGNORE_DEVICES";
	var GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = cast "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT";
	var GAMECONTROLLER_USE_BUTTON_LABELS = cast "SDL_GAMECONTROLLER_USE_BUTTON_LABELS";
	var GRAB_KEYBOARD = cast "SDL_GRAB_KEYBOARD";
	var HIDAPI_IGNORE_DEVICES = cast "SDL_HIDAPI_IGNORE_DEVICES";
	var IDLE_TIMER_DISABLED = cast "SDL_IOS_IDLE_TIMER_DISABLED";
	var IME_INTERNAL_EDITING = cast "SDL_IME_INTERNAL_EDITING";
	var IME_SHOW_UI = cast "SDL_IME_SHOW_UI";
	var IME_SUPPORT_EXTENDED_TEXT = cast "SDL_IME_SUPPORT_EXTENDED_TEXT";
	var IOS_HIDE_HOME_INDICATOR = cast "SDL_IOS_HIDE_HOME_INDICATOR";
	var JOYSTICK_ALLOW_BACKGROUND_EVENTS = cast "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS";
	var JOYSTICK_ARCADESTICK_DEVICES = cast "SDL_JOYSTICK_ARCADESTICK_DEVICES";
	var JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED";
	var JOYSTICK_BLACKLIST_DEVICES = cast "SDL_JOYSTICK_BLACKLIST_DEVICES";
	var JOYSTICK_BLACKLIST_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED";
	var JOYSTICK_FLIGHTSTICK_DEVICES = cast "SDL_JOYSTICK_FLIGHTSTICK_DEVICES";
	var JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED";
	var JOYSTICK_GAMECUBE_DEVICES = cast "SDL_JOYSTICK_GAMECUBE_DEVICES";
	var JOYSTICK_GAMECUBE_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED";
	var JOYSTICK_HIDAPI = cast "SDL_JOYSTICK_HIDAPI";
	var JOYSTICK_HIDAPI_GAMECUBE = cast "SDL_JOYSTICK_HIDAPI_GAMECUBE";
	var JOYSTICK_GAMECUBE_RUMBLE_BRAKE = cast "SDL_JOYSTICK_GAMECUBE_RUMBLE_BRAKE";
	var JOYSTICK_HIDAPI_JOY_CONS = cast "SDL_JOYSTICK_HIDAPI_JOY_CONS";
	var JOYSTICK_HIDAPI_COMBINE_JOY_CONS = cast "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS";
	var JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = cast "SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS";
	var JOYSTICK_HIDAPI_LUNA = cast "SDL_JOYSTICK_HIDAPI_LUNA";
	var JOYSTICK_HIDAPI_NINTENDO_CLASSIC = cast "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC";
	var JOYSTICK_HIDAPI_SHIELD = cast "SDL_JOYSTICK_HIDAPI_SHIELD";
	var JOYSTICK_HIDAPI_PS3 = cast "SDL_JOYSTICK_HIDAPI_PS3";
	var JOYSTICK_HIDAPI_PS4 = cast "SDL_JOYSTICK_HIDAPI_PS4";
	var JOYSTICK_HIDAPI_PS4_RUMBLE = cast "SDL_JOYSTICK_HIDAPI_PS4_RUMBLE";
	var JOYSTICK_HIDAPI_PS5 = cast "SDL_JOYSTICK_HIDAPI_PS5";
	var JOYSTICK_HIDAPI_PS5_PLAYER_LED = cast "SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED";
	var JOYSTICK_HIDAPI_PS5_RUMBLE = cast "SDL_JOYSTICK_HIDAPI_PS5_RUMBLE";
	var JOYSTICK_HIDAPI_STADIA = cast "SDL_JOYSTICK_HIDAPI_STADIA";
	var JOYSTICK_HIDAPI_STEAM = cast "SDL_JOYSTICK_HIDAPI_STEAM";
	var JOYSTICK_HIDAPI_STEAMDECK = cast "SDL_JOYSTICK_HIDAPI_STEAMDECK";
	var JOYSTICK_HIDAPI_SWITCH = cast "SDL_JOYSTICK_HIDAPI_SWITCH";
	var JOYSTICK_HIDAPI_SWITCH_HOME_LED = cast "SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED";
	var JOYSTICK_HIDAPI_JOYCON_HOME_LED = cast "SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED";
	var JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = cast "SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED";
	var JOYSTICK_HIDAPI_WII = cast "SDL_JOYSTICK_HIDAPI_WII";
	var JOYSTICK_HIDAPI_WII_PLAYER_LED = cast "SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED";
	var JOYSTICK_HIDAPI_XBOX = cast "SDL_JOYSTICK_HIDAPI_XBOX";
	var JOYSTICK_HIDAPI_XBOX_360 = cast "SDL_JOYSTICK_HIDAPI_XBOX_360";
	var JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = cast "SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED";
	var JOYSTICK_HIDAPI_XBOX_360_WIRELESS = cast "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS";
	var JOYSTICK_HIDAPI_XBOX_ONE = cast "SDL_JOYSTICK_HIDAPI_XBOX_ONE";
	var JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = cast "SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED";
	var JOYSTICK_IOKIT = cast "SDL_JOYSTICK_IOKIT";
	var JOYSTICK_MFI = cast "SDL_JOYSTICK_MFI";
	var JOYSTICK_RAWINPUT = cast "SDL_JOYSTICK_RAWINPUT";
	var JOYSTICK_RAWINPUT_CORRELATE_XINPUT = cast "SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT";
	var JOYSTICK_ROG_CHAKRAM = cast "SDL_JOYSTICK_ROG_CHAKRAM";
	var JOYSTICK_THREAD = cast "SDL_JOYSTICK_THREAD";
	var JOYSTICK_THROTTLE_DEVICES = cast "SDL_JOYSTICK_THROTTLE_DEVICES";
	var JOYSTICK_THROTTLE_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED";
	var JOYSTICK_WGI = cast "SDL_JOYSTICK_WGI";
	var JOYSTICK_WHEEL_DEVICES = cast "SDL_JOYSTICK_WHEEL_DEVICES";
	var JOYSTICK_WHEEL_DEVICES_EXCLUDED = cast "SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED";
	var JOYSTICK_ZERO_CENTERED_DEVICES = cast "SDL_JOYSTICK_ZERO_CENTERED_DEVICES";
	var KMSDRM_REQUIRE_DRM_MASTER = cast "SDL_KMSDRM_REQUIRE_DRM_MASTER";
	var JOYSTICK_DEVICE = cast "SDL_JOYSTICK_DEVICE";
	var LINUX_DIGITAL_HATS = cast "SDL_LINUX_DIGITAL_HATS";
	var LINUX_HAT_DEADZONES = cast "SDL_LINUX_HAT_DEADZONES";
	var LINUX_JOYSTICK_CLASSIC = cast "SDL_LINUX_JOYSTICK_CLASSIC";
	var LINUX_JOYSTICK_DEADZONES = cast "SDL_LINUX_JOYSTICK_DEADZONES";
	var MAC_BACKGROUND_APP = cast "SDL_MAC_BACKGROUND_APP";
	var MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = cast "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK";
	var MAC_OPENGL_ASYNC_DISPATCH = cast "SDL_MAC_OPENGL_ASYNC_DISPATCH";
	var MOUSE_DOUBLE_CLICK_RADIUS = cast "SDL_MOUSE_DOUBLE_CLICK_RADIUS";
	var MOUSE_DOUBLE_CLICK_TIME = cast "SDL_MOUSE_DOUBLE_CLICK_TIME";
	var MOUSE_FOCUS_CLICKTHROUGH = cast "SDL_MOUSE_FOCUS_CLICKTHROUGH";
	var MOUSE_NORMAL_SPEED_SCALE = cast "SDL_MOUSE_NORMAL_SPEED_SCALE";
	var MOUSE_RELATIVE_MODE_CENTER = cast "SDL_MOUSE_RELATIVE_MODE_CENTER";
	var MOUSE_RELATIVE_MODE_WARP = cast "SDL_MOUSE_RELATIVE_MODE_WARP";
	var MOUSE_RELATIVE_SCALING = cast "SDL_MOUSE_RELATIVE_SCALING";
	var MOUSE_RELATIVE_SPEED_SCALE = cast "SDL_MOUSE_RELATIVE_SPEED_SCALE";
	var MOUSE_RELATIVE_SYSTEM_SCALE = cast "SDL_MOUSE_RELATIVE_SYSTEM_SCALE";
	var MOUSE_RELATIVE_WARP_MOTION = cast "SDL_MOUSE_RELATIVE_WARP_MOTION";
	var MOUSE_TOUCH_EVENTS = cast "SDL_MOUSE_TOUCH_EVENTS";
	var MOUSE_AUTO_CAPTURE = cast "SDL_MOUSE_AUTO_CAPTURE";
	var NO_SIGNAL_HANDLERS = cast "SDL_NO_SIGNAL_HANDLERS";
	var OPENGL_ES_DRIVER = cast "SDL_OPENGL_ES_DRIVER";
	var ORIENTATIONS = cast "SDL_IOS_ORIENTATIONS";
	var POLL_SENTINEL = cast "SDL_POLL_SENTINEL";
	var PREFERRED_LOCALES = cast "SDL_PREFERRED_LOCALES";
	var QTWAYLAND_CONTENT_ORIENTATION = cast "SDL_QTWAYLAND_CONTENT_ORIENTATION";
	var QTWAYLAND_WINDOW_FLAGS = cast "SDL_QTWAYLAND_WINDOW_FLAGS";
	var RENDER_BATCHING = cast "SDL_RENDER_BATCHING";
	var RENDER_LINE_METHOD = cast "SDL_RENDER_LINE_METHOD";
	var RENDER_DIRECT3D11_DEBUG = cast "SDL_RENDER_DIRECT3D11_DEBUG";
	var RENDER_DIRECT3D_THREADSAFE = cast "SDL_RENDER_DIRECT3D_THREADSAFE";
	var RENDER_DRIVER = cast "SDL_RENDER_DRIVER";
	var RENDER_LOGICAL_SIZE_MODE = cast "SDL_RENDER_LOGICAL_SIZE_MODE";
	var RENDER_OPENGL_SHADERS = cast "SDL_RENDER_OPENGL_SHADERS";
	var RENDER_SCALE_QUALITY = cast "SDL_RENDER_SCALE_QUALITY";
	var RENDER_VSYNC = cast "SDL_RENDER_VSYNC";
	var RENDER_METAL_PREFER_LOW_POWER_DEVICE = cast "SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE";
	var ROG_GAMEPAD_MICE = cast "SDL_ROG_GAMEPAD_MICE";
	var ROG_GAMEPAD_MICE_EXCLUDED = cast "SDL_ROG_GAMEPAD_MICE_EXCLUDED";
	var PS2_DYNAMIC_VSYNC = cast "SDL_PS2_DYNAMIC_VSYNC";
	var RETURN_KEY_HIDES_IME = cast "SDL_RETURN_KEY_HIDES_IME";
	var RPI_VIDEO_LAYER = cast "SDL_RPI_VIDEO_LAYER";
	var SCREENSAVER_INHIBIT_ACTIVITY_NAME = cast "SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME";
	var THREAD_FORCE_REALTIME_TIME_CRITICAL = cast "SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL";
	var THREAD_PRIORITY_POLICY = cast "SDL_THREAD_PRIORITY_POLICY";
	var THREAD_STACK_SIZE = cast "SDL_THREAD_STACK_SIZE";
	var TIMER_RESOLUTION = cast "SDL_TIMER_RESOLUTION";
	var TOUCH_MOUSE_EVENTS = cast "SDL_TOUCH_MOUSE_EVENTS";
	var VITA_TOUCH_MOUSE_DEVICE = cast "SDL_HINT_VITA_TOUCH_MOUSE_DEVICE";
	var TV_REMOTE_AS_JOYSTICK = cast "SDL_TV_REMOTE_AS_JOYSTICK";
	var VIDEO_ALLOW_SCREENSAVER = cast "SDL_VIDEO_ALLOW_SCREENSAVER";
	var VIDEO_DOUBLE_BUFFER = cast "SDL_VIDEO_DOUBLE_BUFFER";
	var VIDEO_EGL_ALLOW_TRANSPARENCY = cast "SDL_VIDEO_EGL_ALLOW_TRANSPARENCY";
	var VIDEO_EXTERNAL_CONTEXT = cast "SDL_VIDEO_EXTERNAL_CONTEXT";
	var VIDEO_HIGHDPI_DISABLED = cast "SDL_VIDEO_HIGHDPI_DISABLED";
	var VIDEO_MAC_FULLSCREEN_SPACES = cast "SDL_VIDEO_MAC_FULLSCREEN_SPACES";
	var VIDEO_MINIMIZE_ON_FOCUS_LOSS = cast "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS";
	var VIDEO_WAYLAND_ALLOW_LIBDECOR = cast "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR";
	var VIDEO_WAYLAND_PREFER_LIBDECOR = cast "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR";
	var VIDEO_WAYLAND_MODE_EMULATION = cast "SDL_VIDEO_WAYLAND_MODE_EMULATION";
	var VIDEO_WAYLAND_EMULATE_MOUSE_WARP = cast "SDL_VIDEO_WAYLAND_EMULATE_MOUSE_WARP";
	var VIDEO_WINDOW_SHARE_PIXEL_FORMAT = cast "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT";
	var VIDEO_FOREIGN_WINDOW_OPENGL = cast "SDL_VIDEO_FOREIGN_WINDOW_OPENGL";
	var VIDEO_FOREIGN_WINDOW_VULKAN = cast "SDL_VIDEO_FOREIGN_WINDOW_VULKAN";
	var VIDEO_WIN_D3DCOMPILER = cast "SDL_VIDEO_WIN_D3DCOMPILER";
	var VIDEO_X11_FORCE_EGL = cast "SDL_VIDEO_X11_FORCE_EGL";
	var VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = cast "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR";
	var VIDEO_X11_NET_WM_PING = cast "SDL_VIDEO_X11_NET_WM_PING";
	var VIDEO_X11_WINDOW_VISUALID = cast "SDL_VIDEO_X11_WINDOW_VISUALID";
	var VIDEO_X11_XINERAMA = cast "SDL_VIDEO_X11_XINERAMA";
	var VIDEO_X11_XRANDR = cast "SDL_VIDEO_X11_XRANDR";
	var VIDEO_X11_XVIDMODE = cast "SDL_VIDEO_X11_XVIDMODE";
	var WAVE_FACT_CHUNK = cast "SDL_WAVE_FACT_CHUNK";
	var WAVE_RIFF_CHUNK_SIZE = cast "SDL_WAVE_RIFF_CHUNK_SIZE";
	var WAVE_TRUNCATION = cast "SDL_WAVE_TRUNCATION";
	var WINDOWS_DISABLE_THREAD_NAMING = cast "SDL_WINDOWS_DISABLE_THREAD_NAMING";
	var WINDOWS_ENABLE_MENU_MNEMONICS = cast "SDL_WINDOWS_ENABLE_MENU_MNEMONICS";
	var WINDOWS_ENABLE_MESSAGELOOP = cast "SDL_WINDOWS_ENABLE_MESSAGELOOP";
	var WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS = cast "SDL_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS";
	var WINDOWS_FORCE_SEMAPHORE_KERNEL = cast "SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL";
	var WINDOWS_INTRESOURCE_ICON = cast "SDL_WINDOWS_INTRESOURCE_ICON";
	var WINDOWS_INTRESOURCE_ICON_SMALL = cast "SDL_WINDOWS_INTRESOURCE_ICON_SMALL";
	var WINDOWS_NO_CLOSE_ON_ALT_F4 = cast "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4";
	var WINDOWS_USE_D3D9EX = cast "SDL_WINDOWS_USE_D3D9EX";
	var WINDOWS_DPI_AWARENESS = cast "SDL_WINDOWS_DPI_AWARENESS";
	var WINDOWS_DPI_SCALING = cast "SDL_WINDOWS_DPI_SCALING";
	var WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = cast "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN";
	var WINDOW_NO_ACTIVATION_WHEN_SHOWN = cast "SDL_WINDOW_NO_ACTIVATION_WHEN_SHOWN";
	var WINRT_HANDLE_BACK_BUTTON = cast "SDL_WINRT_HANDLE_BACK_BUTTON";
	var WINRT_PRIVACY_POLICY_LABEL = cast "SDL_WINRT_PRIVACY_POLICY_LABEL";
	var WINRT_PRIVACY_POLICY_URL = cast "SDL_WINRT_PRIVACY_POLICY_URL";
	var X11_FORCE_OVERRIDE_REDIRECT = cast "SDL_X11_FORCE_OVERRIDE_REDIRECT";
	var XINPUT_ENABLED = cast "SDL_XINPUT_ENABLED";
	var DIRECTINPUT_ENABLED = cast "SDL_DIRECTINPUT_ENABLED";
	var XINPUT_USE_OLD_JOYSTICK_MAPPING = cast "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING";
	var AUDIO_INCLUDE_MONITORS = cast "SDL_AUDIO_INCLUDE_MONITORS";
	var X11_WINDOW_TYPE = cast "SDL_X11_WINDOW_TYPE";
	var QUIT_ON_LAST_WINDOW_CLOSE = cast "SDL_QUIT_ON_LAST_WINDOW_CLOSE";
	var VIDEODRIVER = cast "SDL_VIDEODRIVER";
	var AUDIODRIVER = cast "SDL_AUDIODRIVER";
	var KMSDRM_DEVICE_INDEX = cast "SDL_KMSDRM_DEVICE_INDEX";
	var TRACKPAD_IS_TOUCH_ONLY = cast "SDL_TRACKPAD_IS_TOUCH_ONLY";
}

extern enum abstract HintPriority(UInt32) from UInt32 to UInt32 {
    var DEFAULT = 0;
    var NORMAL;
    var OVERRIDE;
}

typedef HintCallback = cpp.Callable<(userdata:Pointer<cpp.Void>, name:ConstCharStar, oldValue:ConstCharStar, newValue:ConstCharStar) -> Void>;

// SDL_log.h
extern enum abstract LogCategory(UInt32) from UInt32 to UInt32 {
    @:native("SDL_LOG_CATEGORY_APPLICATION")
	var APPLICATION;
	@:native("SDL_LOG_CATEGORY_ERROR")
	var ERROR;
	@:native("SDL_LOG_CATEGORY_ASSERT")
	var ASSERT;
	@:native("SDL_LOG_CATEGORY_SYSTEM")
	var SYSTEM;
	@:native("SDL_LOG_CATEGORY_AUDIO")
	var AUDIO;
	@:native("SDL_LOG_CATEGORY_VIDEO")
	var VIDEO;
	@:native("SDL_LOG_CATEGORY_RENDER")
	var RENDER;
	@:native("SDL_LOG_CATEGORY_INPUT")
	var INPUT;
	@:native("SDL_LOG_CATEGORY_TEST")
	var TEST;
	@:native("SDL_LOG_CATEGORY_RESERVED1")
	var RESERVED1;
	@:native("SDL_LOG_CATEGORY_RESERVED2")
	var RESERVED2;
	@:native("SDL_LOG_CATEGORY_RESERVED3")
	var RESERVED3;
	@:native("SDL_LOG_CATEGORY_RESERVED4")
	var RESERVED4;
	@:native("SDL_LOG_CATEGORY_RESERVED5")
	var RESERVED5;
	@:native("SDL_LOG_CATEGORY_RESERVED6")
	var RESERVED6;
	@:native("SDL_LOG_CATEGORY_RESERVED7")
	var RESERVED7;
	@:native("SDL_LOG_CATEGORY_RESERVED8")
	var RESERVED8;
	@:native("SDL_LOG_CATEGORY_RESERVED9")
	var RESERVED9;
	@:native("SDL_LOG_CATEGORY_RESERVED10")
	var RESERVED10;
	@:native("SDL_LOG_CATEGORY_CUSTOM")
	var CUSTOM;
}

extern enum abstract LogPriority(UInt32) from UInt32 to UInt32 {
	@:native("SDL_LOG_PRIORITY_VERBOSE")
	var VERBOSE;
	@:native("SDL_LOG_PRIORITY_DEBUG")
	var DEBUG;
	@:native("SDL_LOG_PRIORITY_INFO")
	var INFO;
	@:native("SDL_LOG_PRIORITY_WARN")
	var WARN;
	@:native("SDL_LOG_PRIORITY_ERROR")
	var ERROR;
	@:native("SDL_LOG_PRIORITY_CRITICAL")
	var CRITICAL;
    @:native("SDL_NUM_LOG_PRIORITIES")
    var NUM_LOG_PRIORITIES;
}

typedef LogOutputFunction = cpp.Callable<(userdata:Pointer<cpp.Void>, category:Int, priority:LogPriority, message:ConstCharStar) -> Void>;



// SDL_version.h
@:include("vendor/include/Headers.h")
@:native("SDL_version")
@:structAccess
extern class Version {
	@:native("major")
	public var major:cpp.UInt8;
	@:native("minor")
	public var minor:cpp.UInt8;
	@:native("patch")
	public var patch:cpp.UInt8;
}

// SDL_video.h
@:include("vendor/include/Headers.h")
@:native("SDL_DisplayMode")
@:structAccess
extern class DisplayMode {
	@:native("format")
	public var format:cpp.UInt32;
	@:native("w")
	public var width:Int;
	@:native("h")
	public var height:Int;
	@:native("refresh_rate")
	public var refreshRate:Int;
	@:native("driverdata")
	public var driverData:Pointer<cpp.Void>;
}

@:native("SDL_Window")
@:include("vendor/include/Headers.h")
extern class SDL_Window {}
typedef Window = Pointer<SDL_Window>;

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

enum abstract WindowPos(UInt32) from UInt32 to UInt32 {
	var CENTERED = 0x2FFF0000;
	var UNDEFINED = 0x1FFF0000;
}

enum abstract WindowEventID(UInt32) from UInt32 to UInt32 {
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
    var HIT_TEST;       /**< Window had a hit test that wasn't var NORMAL. */
    var ICCPROF_CHANGED; /**< The ICC profile of the window's display has changed. */
    var DISPLAY_CHANGED; /**< Window has been moved to display data1. */
}

enum abstract DisplayEventID(UInt32) from UInt32 to UInt32 {
	var NONE = 0;       /**< Never used */
    var ORIENTATION;   /**< Display orientation has changed to data1 */
    var CONNECTED;     /**< Display has been added to the system */
    var DISCONNECTED;  /**< Display has been removed from the system */
    var MOVED;          /**< Display has changed position */
}

enum abstract DisplayOrientation(UInt32) from UInt32 to UInt32 {
    var UNKNOWN = 0;            /**< The display orientation can't be determined */
    var LANDSCAPE;          /**< The display is in landscape mode, with the right side up, relative to portrait mode */
    var LANDSCAPE_FLIPPED;  /**< The display is in landscape mode, with the left side up, relative to portrait mode */
    var PORTRAIT;           /**< The display is in portrait mode */
    var PORTRAIT_FLIPPED;    /**< The display is in portrait mode, upside down */
}

enum abstract FlashOperation(UInt32) from UInt32 to UInt32 {
    var CANCEL = 0;                   /**< Cancel any window flash state */
    var BRIEFLY;                  /**< Flash the window briefly to get attention */
    var UNTIL_FOCUSED;             /**< Flash the window until it gets focus */
}

typedef GlContext = Pointer<cpp.Void>;

enum abstract GlAttribute(UInt32) from UInt32 to UInt32 {
	var RED_SIZE = 0;
    var GREEN_SIZE;
    var BLUE_SIZE;
    var ALPHA_SIZE;
    var BUFFER_SIZE;
    var DOUBLEBUFFER;
    var DEPTH_SIZE;
    var STENCIL_SIZE;
    var ACCUM_RED_SIZE;
    var ACCUM_GREEN_SIZE;
    var ACCUM_BLUE_SIZE;
    var ACCUM_ALPHA_SIZE;
    var STEREO;
    var MULTISAMPLEBUFFERS;
    var MULTISAMPLESAMPLES;
    var ACCELERATED_VISUAL;
    var RETAINED_BACKING;
    var CONTEXT_MAJOR_VERSION;
    var CONTEXT_MINOR_VERSION;
    var CONTEXT_EGL;
    var CONTEXT_FLAGS;
    var CONTEXT_PROFILE_MASK;
    var SHARE_WITH_CURRENT_CONTEXT;
    var FRAMEBUFFER_SRGB_CAPABLE;
    var CONTEXT_RELEASE_BEHAVIOR;
    var CONTEXT_RESET_NOTIFICATION;
    var CONTEXT_NO_ERROR;
    var FLOATBUFFERS;
}

enum abstract GlProfile(UInt32) from UInt32 to UInt32 {
	var CORE = 0x0001;
    var COMPATIBILITY = 0x0002;
    var ES = 0x0004; /**< GLX_CONTEXT_ES2_PROFILE_BIT_EXT */
}

enum abstract GlContextFlag(UInt32) from UInt32 to UInt32 {
    var DEBUG_FLAG = 0x0001;
    var FORWARD_COMPATIBLE_FLAG = 0x0002;
    var ROBUST_ACCESS_FLAG = 0x0004;
    var RESET_ISOLATION_FLAG = 0x0008;
}

enum abstract GlContextReleaseFlag(UInt32) from UInt32 to UInt32 {
    var NONE = 0x0000;
    var FLUSH = 0x0001;
}

enum abstract GlContextResetNotification(UInt32) from UInt32 to UInt32 {
    var NO_NOTIFICATION = 0x0000;
    var LOSE_CONTEXT = 0x0001;
}

enum abstract HitTestResult(UInt32) from UInt32 to UInt32 {
    var NORMAL = 0;  /**< Region is normal. No special properties. */
    var DRAGGABLE;  /**< Region can drag entire window. */
    var RESIZE_TOPLEFT;
    var RESIZE_TOP;
    var RESIZE_TOPRIGHT;
    var RESIZE_RIGHT;
    var RESIZE_BOTTOMRIGHT;
    var RESIZE_BOTTOM;
    var RESIZE_BOTTOMLEFT;
    var RESIZE_LEFT;
}

typedef HitTest = cpp.Callable<(window:Window, area:cpp.RawConstPointer<Point>, data:Any) -> HitTestResult>;



// SDL_blendmode.h
enum abstract BlendMode(UInt32) to UInt32 from UInt32 {
	var NONE = 0x00000000;     /**< no blending
									dstRGBA = srcRGBA */
	var BLEND = 0x00000001;    /**< alpha blending
									dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA))
									dstA = srcA + (dstA * (1-srcA)) */
	var ADD = 0x00000002;      /**< additive blending
									dstRGB = (srcRGB * srcA) + dstRGB
									dstA = dstA */
	var MOD = 0x00000004;      /**< color modulate
									dstRGB = srcRGB * dstRGB
									dstA = dstA */
	var MUL = 0x00000008;      /**< color multiply
									dstRGB = (srcRGB * dstRGB) + (dstRGB * (1-srcA))
									dstA = dstA */
	var INVALID = 0x7FFFFFFF;
}

enum abstract BlendOperation(UInt32) to UInt32 from UInt32 {
	var ADD              = 0x1;  /**< dst + src: supported by all renderers */
    var SUBTRACT         = 0x2;  /**< dst - src : supported by D3D9, D3D11, OpenGL, OpenGLES */
    var REV_SUBTRACT     = 0x3;  /**< src - dst : supported by D3D9, D3D11, OpenGL, OpenGLES */
    var MINIMUM          = 0x4;  /**< min(dst, src) : supported by D3D9, D3D11 */
    var MAXIMUM          = 0x5;   /**< max(dst, src) : supported by D3D9, D3D11 */
}

enum abstract BlendFactor(UInt32) to UInt32 from UInt32 {
	var ZERO                = 0x1;  /**< 0, 0, 0, 0 */
    var ONE                 = 0x2;  /**< 1, 1, 1, 1 */
    var SRC_COLOR           = 0x3;  /**< srcR, srcG, srcB, srcA */
    var ONE_MINUS_SRC_COLOR = 0x4;  /**< 1-srcR, 1-srcG, 1-srcB, 1-srcA */
    var SRC_ALPHA           = 0x5;  /**< srcA, srcA, srcA, srcA */
    var ONE_MINUS_SRC_ALPHA = 0x6;  /**< 1-srcA, 1-srcA, 1-srcA, 1-srcA */
    var DST_COLOR           = 0x7;  /**< dstR, dstG, dstB, dstA */
    var ONE_MINUS_DST_COLOR = 0x8;  /**< 1-dstR, 1-dstG, 1-dstB, 1-dstA */
    var DST_ALPHA           = 0x9;  /**< dstA, dstA, dstA, dstA */
    var ONE_MINUS_DST_ALPHA = 0xA;  /**< 1-dstA, 1-dstA, 1-dstA, 1-dstA */
}



// SDL_render.h
enum abstract RendererFlags(UInt32) from UInt32 to UInt32 {
    var SOFTWARE = 0x00000001;         /**< The renderer is a software fallback */
    var ACCELERATED = 0x00000002;      /**< The renderer uses hardware
                                                     acceleration */
    var PRESENTVSYNC = 0x00000004;     /**< Present is synchronized
                                                     with the refresh rate */
    var TARGETTEXTURE = 0x00000008;     /**< The renderer supports
                                                     rendering to texture */
}

@:include("vendor/include/Headers.h")
@:native("SDL_RendererInfo")
@:structAccess
extern class RendererInfo {
	@:native("name")
	public var name:ConstCharStar;
	@:native("flags")
	public var flags:UInt32;
	@:native("num_texture_formats")
	public var numTextureFormats:UInt32;
	@:native("texture_formats")
	public var textureFormats:RawPointer<UInt32>;
	@:native("max_texture_width")
	public var maxTextureWidth:Int;
	@:native("max_texture_height")
	public var maxTextureHeight:Int;
}

@:native("SDL_Vertex")
@:include("vendor/include/Headers.h")
@:structAccess
extern class Vertex {
	@:native("position")
	public var position:FPoint;
	@:native("color")
	public var color:Color;
	@:native("tex_coord")
	public var texCoord:FPoint;

	public static inline function create(pos:FPoint, col:Color, tex:FPoint):Vertex {
		return cast untyped __cpp__("SDL_Vertex{{0}, {1}, {2}}", pos, col, tex);
	}
}

enum abstract TextureScaleMode(UInt32) from UInt32 to UInt32 {
	var NEAREST = 0;
	var LINEAR;
	var ANISOTROPIC;
}

enum abstract ScaleMode(UInt32) from UInt32 to UInt32 {
    var NEAREST = 0;
    var LINEAR;
    var BEST;
}

enum abstract TextureAccess(UInt32) from UInt32 to UInt32 {
    var STAIC = 0;
    var STREAMING;
    var TARGET;
}

enum abstract TextureModulate(UInt32) from UInt32 to UInt32 {
	var NONE = 0x00000000;     /**< No modulation */
    var COLOR = 0x00000001;    /**< srcC = srcC * color */
    var ALPHA = 0x00000002;     /**< srcA = srcA * alpha */
}

enum abstract RendererFlip(UInt32) to UInt32 from UInt32 {
	var NONE = 0x00000000;
    var HORIZONTAL = 0x00000001;
    var VERTICAL = 0x00000002;
}

@:native("SDL_Renderer")
@:include("vendor/include/Headers.h")
extern class SDL_Renderer {}
typedef Renderer = Pointer<SDL_Renderer>;

@:native("SDL_Texture")
@:include("vendor/include/Headers.h")
extern class SDL_Texture {}
typedef Texture = Pointer<SDL_Texture>;



// SDL_pixels.h
enum abstract TransparencyDefs(UInt32) from UInt32 to UInt32 {
	var OPAQUE = 255;
    var TRANSPARENT = 0;
}

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

enum abstract BitmapOrder(UInt32) from UInt32 to UInt32 {
	var ORDER_NONE = 0;
	var ORDER_4321;
	var ORDER_1234;
}

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

enum abstract ArrayOrder(UInt32) from UInt32 to UInt32 {
	var NONE = 0;
	var RGB;
	var RGBA;
	var ARGB;
	var BGR;
	var BGRA;
	var ABGR;
}

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
// hello sqwordccube
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

@:native("SDL_Color")
@:include("vendor/include/Headers.h")
@:structAccess
extern class Color {
	public var r:UInt8;
	public var g:UInt8;
	public var b:UInt8;
	public var a:UInt8;

	public static inline function create(r:UInt8, g:UInt8, b:UInt8, a:UInt8):Color {
		return cast untyped __cpp__("SDL_Color{ (unsigned char){0}, (unsigned char){1}, (unsigned char){2}, (unsigned char){3} }", r, g, b, a);
	}
}

@:native("SDL_Palette")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_Palette {
	@:native("ncolors")
	public var numColors:Int;
	@:native("colors")
	public var colors:RawPointer<Color>;
	@:native("version")
	public var version:UInt32;
	@:native("refcount")
	public var refCount:Int;
}
typedef Palette = Pointer<SDL_Palette>;

@:native("SDL_Palette")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_PixelFormat {
	@:native("format")
	public var format:UInt32;
	@:native("palette")
	public var palette:Palette;
	@:native("BitsPerPixel")
	public var bitsPerPixel:UInt8;
	@:native("BytesPerPixel")
	public var bytesPerPixel:UInt8;
	@:native("padding")
	public var padding:RawPointer<UInt8>;
	@:native("Rmask")
	public var Rmask:UInt32;
	@:native("Gmask")
	public var Gmask:UInt32;
	@:native("Bmask")
	public var Bmask:UInt32;
	@:native("Amask")
	public var Amask:UInt32;
	@:native("Rloss")
	public var Rloss:UInt8;
	@:native("Gloss")
	public var Gloss:UInt8;
	@:native("Bloss")
	public var Bloss:UInt8;
	@:native("Aloss")
	public var Aloss:UInt8;
	@:native("Rshift")
	public var Rshift:UInt8;
	@:native("Gshift")
	public var Gshift:UInt8;
	@:native("Bshift")
	public var Bshift:UInt8;
	@:native("Ashift")
	public var Ashift:UInt8;
	@:native("refcount")
	public var refCount:Int;
	@:native("next")
	public var next:PixelFormat;
}
typedef PixelFormat = Pointer<SDL_PixelFormat>;



// SDL_rect.h
@:native("SDL_Point")
@:include("vendor/include/Headers.h")
@:structAccess
extern class Point {
	public var x:Int;
	public var y:Int;

	public static inline function create(x:Int, y:Int):Point {
		return cast untyped __cpp__("SDL_Point{ (int){0}, (int){1} }", x, y);
	}
}

@:native("SDL_FPoint")
@:include("vendor/include/Headers.h")
@:structAccess
extern class FPoint {
	public var x:Float;
	public var y:Float;

	public static inline function create(x:Float, y:Float):FPoint {
		return cast untyped __cpp__("SDL_FPoint{ (float){0}, (float){1} }", x, y);
	}
}

@:native("SDL_Rect")
@:include("vendor/include/Headers.h")
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

@:native("SDL_Rect")
@:include("vendor/include/Headers.h")
@:structAccess
extern class FRectangle {
	public var x:Float;
	public var y:Float;
	public var w:Float;
	public var h:Float;

	public static inline function create(x:Float, y:Float, w:Float, h:Float):FRectangle {
		return cast untyped __cpp__("SDL_Rect{ (float){0}, (float){1}, (float){2}, (float){3} }", x, y, w, h);
	}
}

// SDL_surface.h
@:native("SDL_Surface")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_Surface {
	@:native("format")
	public var format:PixelFormat;
	@:native("w")
    public var w:Int;
	@:native("h")
    public var h:Int;
	@:native("pitch")
    public var pitch:Int;
	@:native("pixels")
	public var pixels:RawPointer<cpp.Void>;
}
typedef Surface = Pointer<SDL_Surface>;

enum abstract YUVConversionMode(Int) from Int to Int {
	var JPEG = 0;
    var BT601;
    var BT709;
    var AUTOMATIC;
}

// SDL_rwops.h
@:native("SDL_RWops")
@:include("vendor/include/Headers.h")
extern class SDL_RWops {}
typedef RWops = Pointer<SDL_RWops>;

// SDL_syswm.h
enum abstract SysWMType(Int) from Int to Int {
	var UNKNOWN = 0;
    var WINDOWS;
    var X11;
    var DIRECT_FB;
    var COCOA;
    var UI_KIT;
    var WAYLAND;
    var MIR;
    var WIN_RT;
    var ANDROID;
    var VIVANTE;
    var OS2;
    var HAIKU;
    var KMSDRM;
    var RISC_OS;
}

@:native("SDL_SysWMinfo")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_SysWMinfo {
	@:native("version")
	public var version:Version;
	@:native("subsystem")
	public var subsystem:SysWMType;
}
typedef SysWMinfo = Pointer<SDL_SysWMinfo>;

// SDL_events.h
enum abstract EventType(UInt32) from UInt32 to UInt32 {
    var QUIT = 0x100;
    var APP_TERMINATING;
    var APP_LOWMEMORY;
    var APP_WILLENTERBACKGROUND;
    var APP_DIDENTERBACKGROUND;
    var APP_WILLENTERFOREGROUND;
    var APP_DIDENTERFOREGROUND;
    var LOCALECHANGED;
    var DISPLAYEVENT = 0x150;
    var WINDOWEVENT = 0x200;
    var SYSWMEVENT;
    var KEYDOWN = 0x300;
    var KEYUP;
    var TEXTEDITING;
    var TEXTINPUT;
    var KEYMAPCHANGED;
    var TEXTEDITING_EXT;
    var MOUSEMOTION = 0x400;
    var MOUSEBUTTONDOWN;
    var MOUSEBUTTONUP;
    var MOUSEWHEEL;
    var JOYAXISMOTION = 0x600;
    var JOYBALLMOTION;
    var JOYHATMOTION;
    var JOYBUTTONDOWN;
    var JOYBUTTONUP;
    var JOYDEVICEADDED;
    var JOYDEVICEREMOVED;
    var JOYBATTERYUPDATED;
    var CONTROLLERAXISMOTION = 0x650;
    var CONTROLLERBUTTONDOWN;
    var CONTROLLERBUTTONUP;
    var CONTROLLERDEVICEADDED;
    var CONTROLLERDEVICEREMOVED;
    var CONTROLLERDEVICEREMAPPED;
    var CONTROLLERTOUCHPADDOWN;
    var CONTROLLERTOUCHPADMOTION;
    var CONTROLLERTOUCHPADUP;
    var CONTROLLERSENSORUPDATE;
    var CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3;
    var CONTROLLERSTEAMHANDLEUPDATED;
    var FINGERDOWN = 0x700;
    var FINGERUP;
    var FINGERMOTION;
    var DOLLARGESTURE = 0x800;
    var DOLLARRECORD;
    var MULTIGESTURE;
    var CLIPBOARDUPDATE = 0x900;
    var DROPFILE = 0x1000;
    var DROPTEXT;
    var DROPBEGIN;
    var DROPCOMPLETE;
    var AUDIODEVICEADDED = 0x1100;
    var AUDIODEVICEREMOVED;
    var SENSORUPDATE = 0x1200;
    var RENDER_TARGETS_RESET = 0x2000;
    var RENDER_DEVICE_RESET;
    var POLLSENTINEL = 0x7F00;
    var USEREVENT    = 0x8000;
    var LASTEVENT    = 0xFFFF;
}

@:native("SDL_CommonEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_CommonEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
}
typedef CommonEvent = Pointer<SDL_CommonEvent>;

@:native("SDL_DisplayEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_DisplayEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("display")
	var display:UInt32;
	@:native("event")
	var event:UInt8;
	@:native("padding1")
	var padding1:UInt8;
	@:native("padding2")
	var padding2:UInt8;
	@:native("padding3")
	var padding3:UInt8;
	@:native("data")
	var data:Int;
}
typedef DisplayEvent = Pointer<SDL_DisplayEvent>;

@:native("SDL_WindowEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_WindowEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("event")
	var event:UInt8;
	@:native("padding1")
	var padding1:UInt8;
	@:native("padding2")
	var padding2:UInt8;
	@:native("padding3")
	var padding3:UInt8;
	@:native("data")
	var data:Int;
}
typedef WindowEvent = Pointer<SDL_WindowEvent>;

@:native("SDL_KeyboardEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_KeyboardEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("state")
	var state:UInt8;
	@:native("padding1")
	var padding1:UInt8;
	@:native("padding2")
	var padding2:UInt8;
	@:native("padding3")
	var padding3:UInt8;
	@:native("keysym")
	var keysym:KeySym;
}
typedef KeyboardEvent = Pointer<SDL_KeyboardEvent>;

@:native("SDL_TextEditingEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_TextEditingEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	/**
	 * This string can only be 32 characters long!
	 */
	@:native("text")
	var text:String;
	@:native("start")
	var start:Int;
	@:native("length")
	var length:Int;
}
typedef TextEditingEvent = Pointer<SDL_TextEditingEvent>;

@:native("SDL_TextEditingExtEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_TextEditingExtEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("text")
	var text:String;
	@:native("start")
	var start:Int;
	@:native("length")
	var length:Int;
}
typedef TextEditingExtEvent = Pointer<SDL_TextEditingExtEvent>;

@:native("SDL_TextInputEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_TextInputEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	/**
	 * This string can only be 32 characters long!
	 */
	@:native("text")
	var text:String;
}
typedef TextInputEvent = Pointer<SDL_TextInputEvent>;

@:native("SDL_MouseMotionEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_MouseMotionEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("which")
	var which:UInt32;
	@:native("state")
	var state:MouseButton;
	@:native("x")
    var x:Int;
	@:native("y")
    var y:Int;
    @:native("xrel")
    var xRel:Int;
	@:native("yrel")
    var yRel:Int;
}
typedef MouseMotionEvent = Pointer<SDL_MouseMotionEvent>;

@:native("SDL_MouseButtonEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_MouseButtonEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("which")
	var which:UInt32;
	@:native("button")
	var button:MouseButton;
	@:native("state")
    var state:KeyState;
    @:native("clicks")
    var clicks:UInt8;
    @:native("padding1")
    var padding1:UInt8;
    @:native("x")
    var x:Int;
	@:native("y")
    var y:Int;
    @:native("direction")
    var direction:MouseWheelDirection;
    @:native("preciseX")
    var preciseX:Single;
    @:native("preciseY")
    var preciseY:Single;
    @:native("mouseX")
    var mouseX:Int;
    @:native("mouseY")
    var mouseY:Int;
}
typedef MouseButtonEvent = Pointer<SDL_MouseButtonEvent>;

@:native("SDL_MouseWheelEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_MouseWheelEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("windowID")
	var windowID:UInt32;
	@:native("which")
	var which:UInt32;
    @:native("x")
    var x:Int;
	@:native("y")
    var y:Int;
}
typedef MouseWheelEvent = Pointer<SDL_MouseWheelEvent>;

@:native("SDL_JoyAxisEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_JoyAxisEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("which")
	var which:JoystickID;
    @:native("axis")
    var axis:UInt8;
    @:native("padding1")
    var padding1:UInt8;
    @:native("padding2")
    var padding2:UInt8;
    @:native("padding3")
    var padding3:UInt8;
    @:native("value")
    var value:Int16;
    @:native("padding4")
    var padding4:UInt16;
}
typedef JoyAxisEvent = Pointer<SDL_JoyAxisEvent>;

@:native("SDL_JoyHatEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_JoyHatEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("which")
	var which:JoystickID;
    @:native("hat")
    var hat:UInt8;
    @:native("value")
    var value:UInt8;
    @:native("padding1")
    var padding1:UInt8;
    @:native("padding2")
    var padding2:UInt8;
}
typedef JoyHatEvent = Pointer<SDL_JoyHatEvent>;

@:native("SDL_JoyButtonEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_JoyButtonEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("which")
	var which:JoystickID;
    @:native("button")
    var button:UInt8;
    @:native("state")
    var state:UInt8;
    @:native("padding1")
    var padding1:UInt8;
    @:native("padding2")
    var padding2:UInt8;
}
typedef JoyButtonEvent = Pointer<SDL_JoyButtonEvent>;

@:native("SDL_JoyDeviceEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_JoyDeviceEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("which")
	var which:JoystickID;
}
typedef JoyDeviceEvent = Pointer<SDL_JoyDeviceEvent>;

@:native("SDL_JoyBatteryEvent")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_JoyBatteryEvent {
	@:native("type")
	var type:UInt32;
	@:native("timestamp")
	var timestamp:UInt32;
	@:native("which")
	var which:JoystickID;
    @:native("level")
    var level:JoystickPowerLevel;
}
typedef JoyBatteryEvent = Pointer<SDL_JoyBatteryEvent>;

// SDL_keyboard.h
enum abstract ScanCode(UInt32) from UInt32 to UInt32 {
    var UNKNOWN = 0;
    var A = 4;
    var B = 5;
    var C = 6;
    var D = 7;
    var E = 8;
    var F = 9;
    var G = 10;
    var H = 11;
    var I = 12;
    var J = 13;
    var K = 14;
    var L = 15;
    var M = 16;
    var N = 17;
    var O = 18;
    var P = 19;
    var Q = 20;
    var R = 21;
    var S = 22;
    var T = 23;
    var U = 24;
    var V = 25;
    var W = 26;
    var X = 27;
    var Y = 28;
    var Z = 29;

    var ONE = 30;
    var TWO = 31;
    var THREE = 32;
    var FOUR = 33;
    var FIVE = 34;
    var SIX = 35;
    var SEVEN = 36;
    var EIGHT = 37;
    var NINE = 38;
    var ZERO = 39;
    var RETURN = 40;
    var ESCAPE = 41;
    var BACKSPACE = 42;
    var TAB = 43;
    var SPACE = 44;
    var MINUS = 45;
    var EQUALS = 46;
    var LEFTBRACKET = 47;
    var RIGHTBRACKET = 48;
    var BACKSLASH = 49;
    var NONUSHASH = 50;
    var SEMICOLON = 51;
    var APOSTROPHE = 52;
    var GRAVE = 53;
    var COMMA = 54;
    var PERIOD = 55;
    var SLASH = 56;
    var CAPSLOCK = 57;
    var F1 = 58;
    var F2 = 59;
    var F3 = 60;
    var F4 = 61;
    var F5 = 62;
    var F6 = 63;
    var F7 = 64;
    var F8 = 65;
    var F9 = 66;
    var F10 = 67;
    var F11 = 68;
    var F12 = 69;
    var PRINTSCREEN = 70;
    var SCROLLLOCK = 71;
    var PAUSE = 72;
    var INSERT = 73;
    var HOME = 74;
    var PAGEUP = 75;
    var DELETE = 76;
    var END = 77;
    var PAGEDOWN = 78;
    var RIGHT = 79;
    var LEFT = 80;
    var DOWN = 81;
    var UP = 82;
    var NUMLOCKCLEAR = 83;
    var KP_DIVIDE = 84;
    var KP_MULTIPLY = 85;
    var KP_MINUS = 86;
    var KP_PLUS = 87;
    var KP_ENTER = 88;
    var KP_ONE = 89;
    var KP_TWO = 90;
    var KP_THREE = 91;
    var KP_FOUR = 92;
    var KP_FIVE = 93;
    var KP_SIX = 94;
    var KP_SEVEN = 95;
    var KP_EIGHT = 96;
    var KP_NINE = 97;
    var KP_ZERO = 98;
    var KP_PERIOD = 99;
    var NONUSBACKSLASH = 100;
    var APPLICATION = 101;
    var POWER = 102;
    var KP_EQUALS = 103;
    var F13 = 104;
    var F14 = 105;
    var F15 = 106;
    var F16 = 107;
    var F17 = 108;
    var F18 = 109;
    var F19 = 110;
    var F20 = 111;
    var F21 = 112;
    var F22 = 113;
    var F23 = 114;
    var F24 = 115;
    var EXECUTE = 116;
    var HELP = 117;
    var MENU = 118;
    var SELECT = 119;
    var STOP = 120;
    var AGAIN = 121;
    var UNDO = 122;
    var CUT = 123;
    var COPY = 124;
    var PASTE = 125;
    var FIND = 126;
    var MUTE = 127;
    var VOLUMEUP = 128;
    var VOLUMEDOWN = 129;
    var KP_COMMA = 133;
    var KP_EQUALSAS400 = 134;
    var INTERNATIONAL1 = 135;
    var INTERNATIONAL2 = 136;
    var INTERNATIONAL3 = 137;
    var INTERNATIONAL4 = 138;
    var INTERNATIONAL5 = 139;
    var INTERNATIONAL6 = 140;
    var INTERNATIONAL7 = 141;
    var INTERNATIONAL8 = 142;
    var INTERNATIONAL9 = 143;
    var LANG1 = 144;
    var LANG2 = 145;
    var LANG3 = 146;
    var LANG4 = 147;
    var LANG5 = 148;
    var LANG6 = 149;
    var LANG7 = 150;
    var LANG8 = 151;
    var LANG9 = 152;
    var ALTERASE = 153;
    var SYSREQ = 154;
    var CANCEL = 155;
    var CLEAR = 156;
    var PRIOR = 157;
    var RETURN2 = 158;
    var SEPARATOR = 159;
    var OUT = 160;
    var OPER = 161;
    var CLEARAGAIN = 162;
    var CRSEL = 163;
    var EXSEL = 164;
    var KP_00 = 176;
    var KP_000 = 177;
    var THOUSANDSSEPARATOR = 178;
    var DECIMALSEPARATOR = 179;
    var CURRENCYUNIT = 180;
    var CURRENCYSUBUNIT = 181;
    var KP_LEFTPAREN = 182;
    var KP_RIGHTPAREN = 183;
    var KP_LEFTBRACE = 184;
    var KP_RIGHTBRACE = 185;
    var KP_TAB = 186;
    var KP_BACKSPACE = 187;
    var KP_A = 188;
    var KP_B = 189;
    var KP_C = 190;
    var KP_D = 191;
    var KP_E = 192;
    var KP_F = 193;
    var KP_XOR = 194;
    var KP_POWER = 195;
    var KP_PERCENT = 196;
    var KP_LESS = 197;
    var KP_GREATER = 198;
    var KP_AMPERSAND = 199;
    var KP_DBLAMPERSAND = 200;
    var KP_VERTICALBAR = 201;
    var KP_DBLVERTICALBAR = 202;
    var KP_COLON = 203;
    var KP_HASH = 204;
    var KP_SPACE = 205;
    var KP_AT = 206;
    var KP_EXCLAM = 207;
    var KP_MEMSTORE = 208;
    var KP_MEMRECALL = 209;
    var KP_MEMCLEAR = 210;
    var KP_MEMADD = 211;
    var KP_MEMSUBTRACT = 212;
    var KP_MEMMULTIPLY = 213;
    var KP_MEMDIVIDE = 214;
    var KP_PLUSMINUS = 215;
    var KP_CLEAR = 216;
    var KP_CLEARENTRY = 217;
    var KP_BINARY = 218;
    var KP_OCTAL = 219;
    var KP_DECIMAL = 220;
    var KP_HEXADECIMAL = 221;
    var LCTRL = 224;
    var LSHIFT = 225;
    var LALT = 226;
    var LGUI = 227;
    var RCTRL = 228;
    var RSHIFT = 229;
    var RALT = 230;
    var RGUI = 231;
    var MODE = 257;
    var AUDIONEXT = 258;
    var AUDIOPREV = 259;
    var AUDIOSTOP = 260;
    var AUDIOPLAY = 261;
    var AUDIOMUTE = 262;
    var MEDIASELECT = 263;
    var WWW = 264;
    var MAIL = 265;
    var CALCULATOR = 266;
    var COMPUTER = 267;
    var AC_SEARCH = 268;
    var AC_HOME = 269;
    var AC_BACK = 270;
    var AC_FORWARD = 271;
    var AC_STOP = 272;
    var AC_REFRESH = 273;
    var AC_BOOKMARKS = 274;
    var BRIGHTNESSDOWN = 275;
    var BRIGHTNESSUP = 276;
    var DISPLAYSWITCH = 277;
    var KBDILLUMTOGGLE = 278;
    var KBDILLUMDOWN = 279;
    var KBDILLUMUP = 280;
    var EJECT = 281;
    var SLEEP = 282;
    var APP1 = 283;
    var APP2 = 284;
    var AUDIOREWIND = 285;
    var AUDIOFASTFORWARD = 286;
    var SOFTLEFT = 287;
    var SOFTRIGHT = 288;
    var CALL = 289;
    var ENDCALL = 290;

    var NUM_SCANCODES = 512;
}

enum abstract KeyCode(UInt32) from UInt32 to UInt32 {
    private var K_SCANCODE_MASK = 1<<30;

    var UNKNOWN = 0 | K_SCANCODE_MASK;
    var A = 4 | K_SCANCODE_MASK;
    var B = 5 | K_SCANCODE_MASK;
    var C = 6 | K_SCANCODE_MASK;
    var D = 7 | K_SCANCODE_MASK;
    var E = 8 | K_SCANCODE_MASK;
    var F = 9 | K_SCANCODE_MASK;
    var G = 10 | K_SCANCODE_MASK;
    var H = 11 | K_SCANCODE_MASK;
    var I = 12 | K_SCANCODE_MASK;
    var J = 13 | K_SCANCODE_MASK;
    var K = 14 | K_SCANCODE_MASK;
    var L = 15 | K_SCANCODE_MASK;
    var M = 16 | K_SCANCODE_MASK;
    var N = 17 | K_SCANCODE_MASK;
    var O = 18 | K_SCANCODE_MASK;
    var P = 19 | K_SCANCODE_MASK;
    var Q = 20 | K_SCANCODE_MASK;
    var R = 21 | K_SCANCODE_MASK;
    var S = 22 | K_SCANCODE_MASK;
    var T = 23 | K_SCANCODE_MASK;
    var U = 24 | K_SCANCODE_MASK;
    var V = 25 | K_SCANCODE_MASK;
    var W = 26 | K_SCANCODE_MASK;
    var X = 27 | K_SCANCODE_MASK;
    var Y = 28 | K_SCANCODE_MASK;
    var Z = 29 | K_SCANCODE_MASK;

    var ONE = 30 | K_SCANCODE_MASK;
    var TWO = 31 | K_SCANCODE_MASK;
    var THREE = 32 | K_SCANCODE_MASK;
    var FOUR = 33 | K_SCANCODE_MASK;
    var FIVE = 34 | K_SCANCODE_MASK;
    var SIX = 35 | K_SCANCODE_MASK;
    var SEVEN = 36 | K_SCANCODE_MASK;
    var EIGHT = 37 | K_SCANCODE_MASK;
    var NINE = 38 | K_SCANCODE_MASK;
    var ZERO = 39 | K_SCANCODE_MASK;
    var RETURN = 40 | K_SCANCODE_MASK;
    var ESCAPE = 41 | K_SCANCODE_MASK;
    var BACKSPACE = 42 | K_SCANCODE_MASK;
    var TAB = 43 | K_SCANCODE_MASK;
    var SPACE = 44 | K_SCANCODE_MASK;
    var MINUS = 45 | K_SCANCODE_MASK;
    var EQUALS = 46 | K_SCANCODE_MASK;
    var LEFTBRACKET = 47 | K_SCANCODE_MASK;
    var RIGHTBRACKET = 48 | K_SCANCODE_MASK;
    var BACKSLASH = 49 | K_SCANCODE_MASK;
    var NONUSHASH = 50 | K_SCANCODE_MASK;
    var SEMICOLON = 51 | K_SCANCODE_MASK;
    var APOSTROPHE = 52 | K_SCANCODE_MASK;
    var GRAVE = 53 | K_SCANCODE_MASK;
    var COMMA = 54 | K_SCANCODE_MASK;
    var PERIOD = 55 | K_SCANCODE_MASK;
    var SLASH = 56 | K_SCANCODE_MASK;
    var CAPSLOCK = 57 | K_SCANCODE_MASK;
    var F1 = 58 | K_SCANCODE_MASK;
    var F2 = 59 | K_SCANCODE_MASK;
    var F3 = 60 | K_SCANCODE_MASK;
    var F4 = 61 | K_SCANCODE_MASK;
    var F5 = 62 | K_SCANCODE_MASK;
    var F6 = 63 | K_SCANCODE_MASK;
    var F7 = 64 | K_SCANCODE_MASK;
    var F8 = 65 | K_SCANCODE_MASK;
    var F9 = 66 | K_SCANCODE_MASK;
    var F10 = 67 | K_SCANCODE_MASK;
    var F11 = 68 | K_SCANCODE_MASK;
    var F12 = 69 | K_SCANCODE_MASK;
    var PRINTSCREEN = 70 | K_SCANCODE_MASK;
    var SCROLLLOCK = 71 | K_SCANCODE_MASK;
    var PAUSE = 72 | K_SCANCODE_MASK;
    var INSERT = 73 | K_SCANCODE_MASK;
    var HOME = 74 | K_SCANCODE_MASK;
    var PAGEUP = 75 | K_SCANCODE_MASK;
    var DELETE = 76 | K_SCANCODE_MASK;
    var END = 77 | K_SCANCODE_MASK;
    var PAGEDOWN = 78 | K_SCANCODE_MASK;
    var RIGHT = 79 | K_SCANCODE_MASK;
    var LEFT = 80 | K_SCANCODE_MASK;
    var DOWN = 81 | K_SCANCODE_MASK;
    var UP = 82 | K_SCANCODE_MASK;
    var NUMLOCKCLEAR = 83 | K_SCANCODE_MASK;
    var KP_DIVIDE = 84 | K_SCANCODE_MASK;
    var KP_MULTIPLY = 85 | K_SCANCODE_MASK;
    var KP_MINUS = 86 | K_SCANCODE_MASK;
    var KP_PLUS = 87 | K_SCANCODE_MASK;
    var KP_ENTER = 88 | K_SCANCODE_MASK;
    var KP_ONE = 89 | K_SCANCODE_MASK;
    var KP_TWO = 90 | K_SCANCODE_MASK;
    var KP_THREE = 91 | K_SCANCODE_MASK;
    var KP_FOUR = 92 | K_SCANCODE_MASK;
    var KP_FIVE = 93 | K_SCANCODE_MASK;
    var KP_SIX = 94 | K_SCANCODE_MASK;
    var KP_SEVEN = 95 | K_SCANCODE_MASK;
    var KP_EIGHT = 96 | K_SCANCODE_MASK;
    var KP_NINE = 97 | K_SCANCODE_MASK;
    var KP_ZERO = 98 | K_SCANCODE_MASK;
    var KP_PERIOD = 99 | K_SCANCODE_MASK;
    var NONUSBACKSLASH = 100 | K_SCANCODE_MASK;
    var APPLICATION = 101 | K_SCANCODE_MASK;
    var POWER = 102 | K_SCANCODE_MASK;
    var KP_EQUALS = 103 | K_SCANCODE_MASK;
    var F13 = 104 | K_SCANCODE_MASK;
    var F14 = 105 | K_SCANCODE_MASK;
    var F15 = 106 | K_SCANCODE_MASK;
    var F16 = 107 | K_SCANCODE_MASK;
    var F17 = 108 | K_SCANCODE_MASK;
    var F18 = 109 | K_SCANCODE_MASK;
    var F19 = 110 | K_SCANCODE_MASK;
    var F20 = 111 | K_SCANCODE_MASK;
    var F21 = 112 | K_SCANCODE_MASK;
    var F22 = 113 | K_SCANCODE_MASK;
    var F23 = 114 | K_SCANCODE_MASK;
    var F24 = 115 | K_SCANCODE_MASK;
    var EXECUTE = 116 | K_SCANCODE_MASK;
    var HELP = 117 | K_SCANCODE_MASK;
    var MENU = 118 | K_SCANCODE_MASK;
    var SELECT = 119 | K_SCANCODE_MASK;
    var STOP = 120 | K_SCANCODE_MASK;
    var AGAIN = 121 | K_SCANCODE_MASK;
    var UNDO = 122 | K_SCANCODE_MASK;
    var CUT = 123 | K_SCANCODE_MASK;
    var COPY = 124 | K_SCANCODE_MASK;
    var PASTE = 125 | K_SCANCODE_MASK;
    var FIND = 126 | K_SCANCODE_MASK;
    var MUTE = 127 | K_SCANCODE_MASK;
    var VOLUMEUP = 128 | K_SCANCODE_MASK;
    var VOLUMEDOWN = 129 | K_SCANCODE_MASK;
    var KP_COMMA = 133 | K_SCANCODE_MASK;
    var KP_EQUALSAS400 = 134 | K_SCANCODE_MASK;
    var INTERNATIONAL1 = 135 | K_SCANCODE_MASK;
    var INTERNATIONAL2 = 136 | K_SCANCODE_MASK;
    var INTERNATIONAL3 = 137 | K_SCANCODE_MASK;
    var INTERNATIONAL4 = 138 | K_SCANCODE_MASK;
    var INTERNATIONAL5 = 139 | K_SCANCODE_MASK;
    var INTERNATIONAL6 = 140 | K_SCANCODE_MASK;
    var INTERNATIONAL7 = 141 | K_SCANCODE_MASK;
    var INTERNATIONAL8 = 142 | K_SCANCODE_MASK;
    var INTERNATIONAL9 = 143 | K_SCANCODE_MASK;
    var LANG1 = 144 | K_SCANCODE_MASK;
    var LANG2 = 145 | K_SCANCODE_MASK;
    var LANG3 = 146 | K_SCANCODE_MASK;
    var LANG4 = 147 | K_SCANCODE_MASK;
    var LANG5 = 148 | K_SCANCODE_MASK;
    var LANG6 = 149 | K_SCANCODE_MASK;
    var LANG7 = 150 | K_SCANCODE_MASK;
    var LANG8 = 151 | K_SCANCODE_MASK;
    var LANG9 = 152 | K_SCANCODE_MASK;
    var ALTERASE = 153 | K_SCANCODE_MASK;
    var SYSREQ = 154 | K_SCANCODE_MASK;
    var CANCEL = 155 | K_SCANCODE_MASK;
    var CLEAR = 156 | K_SCANCODE_MASK;
    var PRIOR = 157 | K_SCANCODE_MASK;
    var RETURN2 = 158 | K_SCANCODE_MASK;
    var SEPARATOR = 159 | K_SCANCODE_MASK;
    var OUT = 160 | K_SCANCODE_MASK;
    var OPER = 161 | K_SCANCODE_MASK;
    var CLEARAGAIN = 162 | K_SCANCODE_MASK;
    var CRSEL = 163 | K_SCANCODE_MASK;
    var EXSEL = 164 | K_SCANCODE_MASK;
    var KP_00 = 176 | K_SCANCODE_MASK;
    var KP_000 = 177 | K_SCANCODE_MASK;
    var THOUSANDSSEPARATOR = 178 | K_SCANCODE_MASK;
    var DECIMALSEPARATOR = 179 | K_SCANCODE_MASK;
    var CURRENCYUNIT = 180 | K_SCANCODE_MASK;
    var CURRENCYSUBUNIT = 181 | K_SCANCODE_MASK;
    var KP_LEFTPAREN = 182 | K_SCANCODE_MASK;
    var KP_RIGHTPAREN = 183 | K_SCANCODE_MASK;
    var KP_LEFTBRACE = 184 | K_SCANCODE_MASK;
    var KP_RIGHTBRACE = 185 | K_SCANCODE_MASK;
    var KP_TAB = 186 | K_SCANCODE_MASK;
    var KP_BACKSPACE = 187 | K_SCANCODE_MASK;
    var KP_A = 188 | K_SCANCODE_MASK;
    var KP_B = 189 | K_SCANCODE_MASK;
    var KP_C = 190 | K_SCANCODE_MASK;
    var KP_D = 191 | K_SCANCODE_MASK;
    var KP_E = 192 | K_SCANCODE_MASK;
    var KP_F = 193 | K_SCANCODE_MASK;
    var KP_XOR = 194 | K_SCANCODE_MASK;
    var KP_POWER = 195 | K_SCANCODE_MASK;
    var KP_PERCENT = 196 | K_SCANCODE_MASK;
    var KP_LESS = 197 | K_SCANCODE_MASK;
    var KP_GREATER = 198 | K_SCANCODE_MASK;
    var KP_AMPERSAND = 199 | K_SCANCODE_MASK;
    var KP_DBLAMPERSAND = 200 | K_SCANCODE_MASK;
    var KP_VERTICALBAR = 201 | K_SCANCODE_MASK;
    var KP_DBLVERTICALBAR = 202 | K_SCANCODE_MASK;
    var KP_COLON = 203 | K_SCANCODE_MASK;
    var KP_HASH = 204 | K_SCANCODE_MASK;
    var KP_SPACE = 205 | K_SCANCODE_MASK;
    var KP_AT = 206 | K_SCANCODE_MASK;
    var KP_EXCLAM = 207 | K_SCANCODE_MASK;
    var KP_MEMSTORE = 208 | K_SCANCODE_MASK;
    var KP_MEMRECALL = 209 | K_SCANCODE_MASK;
    var KP_MEMCLEAR = 210 | K_SCANCODE_MASK;
    var KP_MEMADD = 211 | K_SCANCODE_MASK;
    var KP_MEMSUBTRACT = 212 | K_SCANCODE_MASK;
    var KP_MEMMULTIPLY = 213 | K_SCANCODE_MASK;
    var KP_MEMDIVIDE = 214 | K_SCANCODE_MASK;
    var KP_PLUSMINUS = 215 | K_SCANCODE_MASK;
    var KP_CLEAR = 216 | K_SCANCODE_MASK;
    var KP_CLEARENTRY = 217 | K_SCANCODE_MASK;
    var KP_BINARY = 218 | K_SCANCODE_MASK;
    var KP_OCTAL = 219 | K_SCANCODE_MASK;
    var KP_DECIMAL = 220 | K_SCANCODE_MASK;
    var KP_HEXADECIMAL = 221 | K_SCANCODE_MASK;
    var LCTRL = 224 | K_SCANCODE_MASK;
    var LSHIFT = 225 | K_SCANCODE_MASK;
    var LALT = 226 | K_SCANCODE_MASK;
    var LGUI = 227 | K_SCANCODE_MASK;
    var RCTRL = 228 | K_SCANCODE_MASK;
    var RSHIFT = 229 | K_SCANCODE_MASK;
    var RALT = 230 | K_SCANCODE_MASK;
    var RGUI = 231 | K_SCANCODE_MASK;
    var MODE = 257 | K_SCANCODE_MASK;
    var AUDIONEXT = 258 | K_SCANCODE_MASK;
    var AUDIOPREV = 259 | K_SCANCODE_MASK;
    var AUDIOSTOP = 260 | K_SCANCODE_MASK;
    var AUDIOPLAY = 261 | K_SCANCODE_MASK;
    var AUDIOMUTE = 262 | K_SCANCODE_MASK;
    var MEDIASELECT = 263 | K_SCANCODE_MASK;
    var WWW = 264 | K_SCANCODE_MASK;
    var MAIL = 265 | K_SCANCODE_MASK;
    var CALCULATOR = 266 | K_SCANCODE_MASK;
    var COMPUTER = 267 | K_SCANCODE_MASK;
    var AC_SEARCH = 268 | K_SCANCODE_MASK;
    var AC_HOME = 269 | K_SCANCODE_MASK;
    var AC_BACK = 270 | K_SCANCODE_MASK;
    var AC_FORWARD = 271 | K_SCANCODE_MASK;
    var AC_STOP = 272 | K_SCANCODE_MASK;
    var AC_REFRESH = 273 | K_SCANCODE_MASK;
    var AC_BOOKMARKS = 274 | K_SCANCODE_MASK;
    var BRIGHTNESSDOWN = 275 | K_SCANCODE_MASK;
    var BRIGHTNESSUP = 276 | K_SCANCODE_MASK;
    var DISPLAYSWITCH = 277 | K_SCANCODE_MASK;
    var KBDILLUMTOGGLE = 278 | K_SCANCODE_MASK;
    var KBDILLUMDOWN = 279 | K_SCANCODE_MASK;
    var KBDILLUMUP = 280 | K_SCANCODE_MASK;
    var EJECT = 281 | K_SCANCODE_MASK;
    var SLEEP = 282 | K_SCANCODE_MASK;
    var APP1 = 283 | K_SCANCODE_MASK;
    var APP2 = 284 | K_SCANCODE_MASK;
    var AUDIOREWIND = 285 | K_SCANCODE_MASK;
    var AUDIOFASTFORWARD = 286 | K_SCANCODE_MASK;
    var SOFTLEFT = 287 | K_SCANCODE_MASK;
    var SOFTRIGHT = 288 | K_SCANCODE_MASK;
    var CALL = 289 | K_SCANCODE_MASK;
    var ENDCALL = 290 | K_SCANCODE_MASK;

    var NUM_KEYCODES = 512 | K_SCANCODE_MASK;
}

enum abstract KeyMod(UInt32) from UInt32 to UInt32 {
    var KMOD_NONE = 0x0000;
    var KMOD_LSHIFT = 0x0001;
    var KMOD_RSHIFT = 0x0002;
    var KMOD_LCTRL = 0x0040;
    var KMOD_RCTRL = 0x0080;
    var KMOD_LALT = 0x0100;
    var KMOD_RALT = 0x0200;
    var KMOD_LGUI = 0x0400;
    var KMOD_RGUI = 0x0800;
    var KMOD_NUM = 0x1000;
    var KMOD_CAPS = 0x2000;
    var KMOD_MODE = 0x4000;
    var KMOD_SCROLL = 0x8000;

    var KMOD_CTRL = KMOD_LCTRL | KMOD_RCTRL;
    var KMOD_SHIFT = KMOD_LSHIFT | KMOD_RSHIFT;
    var KMOD_ALT = KMOD_LALT | KMOD_RALT;
    var KMOD_GUI = KMOD_LGUI | KMOD_RGUI;

    var KMOD_RESERVED = KMOD_SCROLL;
}

enum abstract KeyState(UInt8) from UInt8 to UInt8 {
    var RELEASED = 0;
    var PRESSED = 1;
}

@:native("SDL_Keysym")
@:include("vendor/include/Headers.h")
@:structAccess
extern class KeySym {
	@:native("scancode")
    public var scancode:ScanCode; // physical keycode
	@:native("sym")
    public var sym:KeyCode; // virtual keycode
	@:native("mod")
    public var mod:KeyMod; // key mods
}

// SDL_mouse.h
@:native("SDL_Cursor")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_Cursor {}
typedef Cursor = Pointer<SDL_Cursor>;

enum abstract SystemCursor(UInt32) from UInt32 to UInt32 {
	var ARROW = 0;
    var IBEAM;
    var WAIT;
    var CROSSHAIR;
    var WAITARROW;
    var SIZENWSE;
    var SIZENESW;
    var SIZEWE;
    var SIZENS;
    var SIZEALL;
    var NO;
    var HAND;
    var NUM_SYSTEM_CURSORS;
}

enum abstract MouseWheelDirection(UInt32) from UInt32 to UInt32 {
	var NORMAL = 0;
	var FLIPPED;
}

enum abstract MouseButton(UInt32) from UInt32 to UInt32 {
	private static inline function mask(x:UInt32) {
		return (1 << ((x)-1));
	}

	var LEFT = 1;
	var MIDDLE;
	var RIGHT;
	var X1;
	var X2;
	var LMASK = mask(LEFT);
	var MMASK = mask(MIDDLE);
	var RMASK = mask(RIGHT);
	var X1MASK = mask(X1);
	var X2MASK = mask(X2);
}

// SDL_guid.h
@:native("SDL_GUID")
@:include("vendor/include/Headers.h")
@:structAccess
extern class GUID {
    @:native("data")
    var data:UInt8;
}

// SDL_joystick.h
@:native("SDL_Joystick")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_Joystick {}
typedef Joystick = Pointer<SDL_Joystick>;

@:native("SDL_VirtualJoystickDesc")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_VirtualJoystickDesc {
    @:native("version")
    var version:UInt16;
    @:native("type")
    var type:JoystickType;
    @:native("naxes")
    var nAxes:UInt16;
    @:native("nbuttons")
    var nButtons:UInt16;
    @:native("nhats")
    var nHats:UInt16;
    @:native("vendor_id")
    var vendorID:UInt16;
    @:native("product_id")
    var productID:UInt16;
    @:native("padding")
    var padding:UInt16;
    @:native("button_mask")
    var buttonMask:GameControllerButton;
    @:native("axis_mask")
    var axisMask:GameControllerAxis;
    @:native("name")
    var name:ConstCharStar;
    @:native("userdata")
    var userdata:Pointer<cpp.Void>;
}
typedef VirtualJoystickDesc = Pointer<SDL_VirtualJoystickDesc>;

typedef JoystickGUID = GUID;
typedef JoystickID = Int;

enum abstract JoystickType(UInt32) from UInt32 from UInt32 {
    var UNKNOWN = 0;
    var GAMECONTROLLER;
    var WHEEL;
    var ARCADE_STICK;
    var FLIGHT_STICK;
    var DANCE_PAD;
    var GUITAR;
    var DRUM_KIT;
    var ARCADE_PAD;
    var THROTTLE;
}

enum abstract JoystickPowerLevel(UInt32) from UInt32 to UInt32 {
    var UNKNOWN = -1;
    /** <= 5% */
    var EMPTY;
    /** <= 20% */
    var LOW;
    /** <= 70% */
    var MEDIUM;
    /** <= 100% */
    var FULL;
    var WIRED;
    var MAX;
}

enum abstract JoystickHatPosition(UInt32) from UInt32 to UInt32 {
    var CENTERED = 0x00;
    var UP = 0x01;
    var RIGHT = 0x02;
    var DOWN = 0x04;
    var LEFT = 0x08;
    var RIGHTUP = (RIGHT | UP);
    var RIGHTDOWN = (RIGHT | DOWN);
    var LEFTUP = (LEFT | UP);
    var LEFTDOWN = (LEFT | DOWN);
}

// SDL_gamecontroller.h
@:native("SDL_GameController")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_GameController {}
typedef GameController = Pointer<SDL_GameController>;

enum abstract GameControllerType(UInt32) from UInt32 to UInt32 {
    var UNKNOWN = 0;
    var XBOX360;
    var XBOXONE;
    var PS3;
    var PS4;
    var NINTENDO_SWITCH_PRO;
    var VIRTUAL;
    var PS5;
    var AMAZON_LUNA;
    var GOOGLE_STADIA;
    var NVIDIA_SHIELD;
    var NINTENDO_SWITCH_JOYCON_LEFT;
    var NINTENDO_SWITCH_JOYCON_RIGHT;
    var NINTENDO_SWITCH_JOYCON_PAIR;
    var MAX;
}

enum abstract GameControllerBindType(UInt32) from UInt32 to UInt32 {
    var NONE = 0;
    var BUTTON;
    var AXIS;
    var HAT;
}

@:native("SDL_GameControllerButtonBind")
@:include("vendor/include/Headers.h")
@:structAccess
extern class SDL_GameControllerButtonBind {
    @:native("bindType")
    var bindType:GameControllerBindType;
}
typedef GameControllerButtonBind = Pointer<SDL_GameControllerButtonBind>;

enum abstract GameControllerAxis(UInt32) from UInt32 to UInt32 {
    var INVALID = -1;
    var LEFTX;
    var LEFTY;
    var RIGHTX;
    var RIGHTY;
    var TRIGGERLEFT;
    var TRIGGERRIGHT;
    var MAX;
}

enum abstract GameControllerButton(UInt32) from UInt32 to UInt32 {
    var INVALID = -1;
    var A;
    var B;
    var X;
    var Y;
    var BACK;
    var GUIDE;
    var START;
    var LEFTSTICK;
    var RIGHTSTICK;
    var LEFTSHOULDER;
    var RIGHTSHOULDER;
    var DPAD_UP;
    var DPAD_DOWN;
    var DPAD_LEFT;
    var DPAD_RIGHT;
    var MISC1;    /* Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button */
    var PADDLE1;  /* Xbox Elite paddle P1 (upper left, facing the back) */
    var PADDLE2;  /* Xbox Elite paddle P3 (upper right, facing the back) */
    var PADDLE3;  /* Xbox Elite paddle P2 (lower left, facing the back) */
    var PADDLE4;  /* Xbox Elite paddle P4 (lower right, facing the back) */
    var TOUCHPAD; /* PS4/PS5 touchpad button */
    var MAX;
}

// SDL_sensor.h

typedef Double = cpp.Float64;