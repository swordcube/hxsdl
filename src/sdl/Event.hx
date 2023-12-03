package sdl;

import sdl.events.*;

@:keep
@:include("vendor/include/Headers.h")
@:native("SDL_Event")
@:structAccess
extern class SDL_Event {
	var type:EventType;
	var key:KeyboardEvent;
	var window:WindowEvent;
}

typedef Event = Pointer<SDL_Event>;

@:keep
enum abstract EventType(UInt) from UInt to UInt {
	var FIRSTEVENT = 0; /**< Unused (do not remove) */

	/* Application events */
	var QUIT = 0x100;
	var APP_TERMINATING = 0x101;
	var APP_LOWMEMORY = 0x102;
	var APP_WILLENTERBACKGROUND = 0x103;
	var APP_DIDENTERBACKGROUND = 0x104;
	var APP_WILLENTERFOREGROUND = 0x105;
	var APP_DIDENTERFOREGROUND = 0x106;

	/* Window events */
	var WINDOWEVENT = 0x200; /**< Window state change */
	var SYSWMEVENT = 0x201; /**< System specific event */

	/* Keyboard events */
	var KEYDOWN = 0x300; /**< Key pressed */
	var KEYUP = 0x301; /**< Key released */
	var TEXTEDITING = 0x302; /**< Keyboard text editing (composition) */
	var TEXTINPUT = 0x303; /**< Keyboard text input */

	/* Mouse events */
	var MOUSEMOTION = 0x400; /**< Mouse moved */
	var MOUSEBUTTONDOWN = 0x401; /**< Mouse button pressed */
	var MOUSEBUTTONUP = 0x402; /**< Mouse button released */
	var MOUSEWHEEL = 0x403; /**< Mouse wheel motion */

	/* Joystick events */
	var JOYAXISMOTION = 0x600; /**< Joystick axis motion */
	var JOYBALLMOTION = 0x601; /**< Joystick trackball motion */
	var JOYHATMOTION = 0x602; /**< Joystick hat position change */
	var JOYBUTTONDOWN = 0x603; /**< Joystick button pressed */
	var JOYBUTTONUP = 0x604; /**< Joystick button released */
	var JOYDEVICEADDED = 0x605; /**< A new joystick has been inserted into the system */
	var JOYDEVICEREMOVED = 0x606; /**< An opened joystick has been removed */

	/* Game controller events */
	var CONTROLLERAXISMOTION = 0x650; /**< Game controller axis motion */
	var CONTROLLERBUTTONDOWN = 0x651; /**< Game controller button pressed */
	var CONTROLLERBUTTONUP = 0x652; /**< Game controller button released */
	var CONTROLLERDEVICEADDED = 0x653; /**< A new Game controller has been inserted into the system */
	var CONTROLLERDEVICEREMOVED = 0x654; /**< An opened Game controller has been removed */
	var CONTROLLERDEVICEREMAPPED = 0x655; /**< The controller mapping was updated */

	/* Touch events */
	var FINGERDOWN = 0x700;
	var FINGERUP = 0x701;
	var FINGERMOTION = 0x702;

	/* Gesture events */
	var DOLLARGESTURE = 0x800;
	var DOLLARRECORD = 0x801;
	var MULTIGESTURE = 0x802;

	/* Clipboard events */
	var CLIPBOARDUPDATE = 0x900; /**< The clipboard changed */

	/* Drag and drop events */
	var DROPFILE = 0x1000; /**< The system requests a file open */

	/* Render events */
	var RENDER_TARGETS_RESET = 0x2000; /**< The render targets have been reset and their contents need to be updated */
	var RENDER_DEVICE_RESET = 0x2001; /**< The device has been reset and all textures need to be recreated */

	/** Events ::USEREVENT through ::LASTEVENT are for your use,
	 *  and should be allocated with RegisterEvents()
	 */
	var USEREVENT = 0x8000;

	/**
	 *  This last event is only for bounding internal arrays
	 */
	var LASTEVENT = 0xFFFF;
}

typedef QuitEvent = {
	var type:UInt32;
	var timestamp:UInt32;
}
