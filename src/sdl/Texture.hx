package sdl;

@:keep
@:native("SDL_Texture")
@:include("vendor/include/includeWorkaround.h")
extern class SDL_Texture {}

typedef Texture = Pointer<SDL_Texture>;