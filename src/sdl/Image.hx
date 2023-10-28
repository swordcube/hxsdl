package sdl;

import sdl.SDL.Boolean;
import cpp.ConstCharStar;

@:keep
@:include("vendor/include/sdl2_image/SDL_image.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

// WARNING: This will not provide EVERY feature SDL image has!
// Instead we will have basic loading of images.

extern class Image {
    @:native("IMG_Init")
    public extern static function init(flags:UInt32):Int;

    @:native("IMG_Quit")
    public extern static function quit():Void;
    
    @:native("IMG_Load")
    public extern static function load(file:ConstCharStar):Surface;

    @:native("IMG_LoadTexture")
    public extern static function loadTexture(renderer:Renderer, file:ConstCharStar):Texture;

    @:native("IMG_LoadTyped_RW")
    public extern static function loadTypedRW(src:RWops, freeSrc:Boolean, type:ConstCharStar):Surface;
}

enum abstract ImageInitFlags(UInt32) from UInt32 to UInt32 {
	var JPG = 0x00000001;
	var PNG = 0x00000002;
	var TIF = 0x00000004;
	var WEBP = 0x00000008;
	var JXL = 0x00000010;
	var AVIF = 0x00000020;
    var EVERYTHING = 0x00000001 | 0x00000002 | 0x00000004 | 0x00000008 | 0x00000010 | 0x00000020;
}
