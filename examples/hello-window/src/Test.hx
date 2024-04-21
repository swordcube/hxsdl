package;

import sdl.SDL;
import sdl.Types.InitFlags;
import sdl.Types.Window;
import sdl.Types.WindowPos;
import sdl.Types.WindowInitFlags;
import sdl.Types.Event;

class Test {
	static function main() {
		SDL.init(VIDEO | AUDIO | EVENTS);

		var window:Window = SDL.createWindow(
			"SDL Test", 
			WindowPos.CENTERED, WindowPos.CENTERED, 
			1280, 720, 
			RESIZABLE | ALLOW_HIGHDPI
		);

		var running:Bool = true;
		var event:Event = SDL.createEventPtr(); // workaround function for making an empty pointer

		while(running) {
			SDL.pollEvent(event);
			switch(event.ref.type) {
				case QUIT:
					running = false;

				default:
			}
		}

		SDL.destroyWindow(window);
		SDL.quit();
	}
}