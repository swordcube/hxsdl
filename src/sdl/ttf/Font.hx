package sdl.ttf;

@:keep
@:native("TTF_Font")
@:include("vendor/include/includeWorkaround.h")
extern class TTF_Font {}

typedef Font = Pointer<TTF_Font>;