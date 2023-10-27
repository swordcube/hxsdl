package sdl;

@:keep
@:unreflective
@:native("SDL_Texture")
@:include("vendor/include/sdl2/SDL.h")
extern class SDL_Texture {}

typedef Texture = Pointer<SDL_Texture>;