package sdl;

@:keep
@:native("SDL_RWops")
@:include("vendor/include/includeWorkaround.h")
extern class SDL_RWops {}

typedef RWops = Pointer<SDL_RWops>;