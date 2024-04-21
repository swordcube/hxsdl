package sdl.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Compiler;
import haxe.macro.Expr;

@:keep
class DefineMacro {
	public static function build():Array<Field> {
		if(Context.defined("32_BIT"))
			Compiler.define("HXCPP_M32", "1"); // force 32-bit compile
		else
			Compiler.define("HXCPP_M64", "1"); // force 64-bit compile
		
		if(!Context.defined("SHOW_CONSOLE"))
			Compiler.define("no_console", "1"); // force the console window to not show up when opening from file explorer
		
		return Context.getBuildFields();
	}
}
#end