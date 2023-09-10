package;

import sdl.Image;
import sdl.Texture;
import sdl.SDL;
import sdl.Window;
import sdl.Renderer;
import sdl.Event;

class Test {
	static function main() {
		SDL.init(InitFlags.VIDEO | InitFlags.AUDIO | InitFlags.EVENTS);

		var window:Window = SDL.createWindow(
			"SDL Test", 
			WindowPos.CENTERED, WindowPos.CENTERED, 
			1280, 720, 
			WindowInitFlags.RESIZABLE | WindowInitFlags.ALLOW_HIGHDPI
		);
		var renderer:Renderer = SDL.createRenderer(window, -1, RenderFlags.ACCELERATED);

		var running:Bool = true;
		var event:Event = SDL.createEventPtr(); // workaround function for making an empty pointer

		Image.init(ImageInitFlags.EVERYTHING);

		var tex:Texture = Image.loadTexture(renderer, "assets/suffering.jpg");
		var texSize:Point = SDL.getTextureSize(tex);

		while(running) {
			SDL.pollEvent(event);

			SDL.setRenderDrawColor(renderer, 0, 0, 0, 0);
			SDL.renderClear(renderer);
			
			SDL.renderCopy(renderer, tex, 
				Rectangle.create(0, 0, texSize.x, texSize.y),
				Rectangle.create(30, 30, texSize.x, texSize.y),
			);
			
			SDL.renderPresent(renderer);

			switch(event.ref.type) {
				case QUIT:
					running = false;

				default:
			}
		}

		SDL.destroyRenderer(renderer);
		SDL.destroyWindow(window);
		SDL.quit();
		Image.quit();
	}
}