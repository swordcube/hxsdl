package sdl;

@:keep
@:native("SDL_Surface")
@:include("vendor/include/sdl2/SDL.h")
extern class SDL_Surface {
    public var w:Int;
    public var h:Int;
    public var pitch:Int;
}
typedef Surface = cpp.Pointer<SDL_Surface>;