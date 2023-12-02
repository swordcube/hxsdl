package sdl.ttf;

import sdl.SDL.Color;
import cpp.ConstCharStar;

@:keep
@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl}/include.xml\"/>")

// WARNING: This will not provide EVERY feature SDL image has!
// Instead we will have basic loading of images.

extern class TTF {
    @:native("TTF_Init")
    public extern static function init():Int;

    @:native("TTF_Quit")
    public extern static function quit():Void;

    @:native("TTF_SetFontOutline")
    public extern static function setFontOutline(font:Font, size:Int = 0):Void;

    @:native("TTF_RenderUTF8_Blended_Wrapped")
    public extern static function renderUTF8BlendedWrapped(font:Font, text:ConstCharStar, fg:Color, wrapLength:UInt32):Surface;
    
    @:native("TTF_RenderUTF8_Solid_Wrapped")
    public extern static function renderUTF8SolidWrapped(font:Font, text:ConstCharStar, fg:Color, wrapLength:UInt32):Surface;

    @:native("TTF_RenderText_Blended_Wrapped")
    public extern static function renderTextBlendedWrapped(font:Font, text:ConstCharStar, fg:Color, wrapLength:UInt32):Surface;
    
    @:native("TTF_RenderText_Solid_Wrapped")
    public extern static function renderTextSolidWrapped(font:Font, text:ConstCharStar, fg:Color, wrapLength:UInt32):Surface;

    @:native("TTF_OpenFont")
    public extern static function openFont(path:ConstCharStar, size:Int):Font;

    @:native("TTF_CloseFont")
    public extern static function closeFont(font:Font):Void;
}