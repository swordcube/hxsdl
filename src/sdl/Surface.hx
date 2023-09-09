package sdl;

@:keep
@:native("SDL_Surface")
@:include("vendor/include/sdl2/SDL.h")
extern class SDL_Surface {
    var w : Int;
    var h : Int;
    var pitch : Int;
}
typedef Surface = cpp.Pointer<SDL_Surface>;