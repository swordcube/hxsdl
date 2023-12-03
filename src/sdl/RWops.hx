package sdl;

@:keep
@:native("SDL_RWops")
@:include("vendor/include/Headers.h")
extern class SDL_RWops {}

typedef RWops = Pointer<SDL_RWops>;