package sdl;

import sdl.events.*;

@:keep
@:include("vendor/include/sdl2/SDL.h")
@:native("SDL_Event")
@:structAccess
extern class SDL_Event {
	var type:EventType;
	var key:KeyboardEvent;
}

typedef Event = Pointer<SDL_Event>;

@:keep
enum abstract EventType(UInt) from UInt to UInt {
	var SDL_FIRSTEVENT = 0; /**< Unused (do not remove) */

	/* Application events */
	var SDL_QUIT = 0x100;
	var SDL_APP_TERMINATING = 0x101;
	var SDL_APP_LOWMEMORY = 0x102;
	var SDL_APP_WILLENTERBACKGROUND = 0x103;
	var SDL_APP_DIDENTERBACKGROUND = 0x104;
	var SDL_APP_WILLENTERFOREGROUND = 0x105;
	var SDL_APP_DIDENTERFOREGROUND = 0x106;

	/* Window events */
	var SDL_WINDOWEVENT = 0x200; /**< Window state change */
	var SDL_SYSWMEVENT = 0x201; /**< System specific event */

	/* Keyboard events */
	var SDL_KEYDOWN = 0x300; /**< Key pressed */
	var SDL_KEYUP = 0x301; /**< Key released */
	var SDL_TEXTEDITING = 0x302; /**< Keyboard text editing (composition) */
	var SDL_TEXTINPUT = 0x303; /**< Keyboard text input */

	/* Mouse events */
	var SDL_MOUSEMOTION = 0x400; /**< Mouse moved */
	var SDL_MOUSEBUTTONDOWN = 0x401; /**< Mouse button pressed */
	var SDL_MOUSEBUTTONUP = 0x402; /**< Mouse button released */
	var SDL_MOUSEWHEEL = 0x403; /**< Mouse wheel motion */

	/* Joystick events */
	var SDL_JOYAXISMOTION = 0x600; /**< Joystick axis motion */
	var SDL_JOYBALLMOTION = 0x601; /**< Joystick trackball motion */
	var SDL_JOYHATMOTION = 0x602; /**< Joystick hat position change */
	var SDL_JOYBUTTONDOWN = 0x603; /**< Joystick button pressed */
	var SDL_JOYBUTTONUP = 0x604; /**< Joystick button released */
	var SDL_JOYDEVICEADDED = 0x605; /**< A new joystick has been inserted into the system */
	var SDL_JOYDEVICEREMOVED = 0x606; /**< An opened joystick has been removed */

	/* Game controller events */
	var SDL_CONTROLLERAXISMOTION = 0x650; /**< Game controller axis motion */
	var SDL_CONTROLLERBUTTONDOWN = 0x651; /**< Game controller button pressed */
	var SDL_CONTROLLERBUTTONUP = 0x652; /**< Game controller button released */
	var SDL_CONTROLLERDEVICEADDED = 0x653; /**< A new Game controller has been inserted into the system */
	var SDL_CONTROLLERDEVICEREMOVED = 0x654; /**< An opened Game controller has been removed */
	var SDL_CONTROLLERDEVICEREMAPPED = 0x655; /**< The controller mapping was updated */

	/* Touch events */
	var SDL_FINGERDOWN = 0x700;
	var SDL_FINGERUP = 0x701;
	var SDL_FINGERMOTION = 0x702;

	/* Gesture events */
	var SDL_DOLLARGESTURE = 0x800;
	var SDL_DOLLARRECORD = 0x801;
	var SDL_MULTIGESTURE = 0x802;

	/* Clipboard events */
	var SDL_CLIPBOARDUPDATE = 0x900; /**< The clipboard changed */

	/* Drag and drop events */
	var SDL_DROPFILE = 0x1000; /**< The system requests a file open */

	/* Render events */
	var SDL_RENDER_TARGETS_RESET = 0x2000; /**< The render targets have been reset and their contents need to be updated */
	var SDL_RENDER_DEVICE_RESET = 0x2001; /**< The device has been reset and all textures need to be recreated */

	/** Events ::SDL_USEREVENT through ::SDL_LASTEVENT are for your use,
	 *  and should be allocated with SDL_RegisterEvents()
	 */
	var SDL_USEREVENT = 0x8000;

	/**
	 *  This last event is only for bounding internal arrays
	 */
	var SDL_LASTEVENT = 0xFFFF;
}

typedef QuitEvent = {
	var type:UInt32;
	var timestamp:UInt32;
}
