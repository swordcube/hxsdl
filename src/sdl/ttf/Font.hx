package sdl.ttf;

@:keep
@:native("TTF_Font")
@:include("vendor/include/sdl2_ttf/SDL_ttf.h")
extern class TTF_Font {}

typedef Font = Pointer<TTF_Font>;