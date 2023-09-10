package sdl;

@:keep
@:native("SDL_RWops")
@:include("vendor/include/sdl2/SDL.h")
extern class SDL_RWops {}

typedef RWops = Pointer<SDL_RWops>;