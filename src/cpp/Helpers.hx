package cpp;

import cpp.RawConstPointer;
import cpp.RawPointer;
import cpp.UInt64;

/**
 * C Arrays can be used somewhat like Haxe arrays,
 * Here's an example:
 * 
 * ```haxe
 * var keyStates:CArray<KeyState> = SDL.getKeyboardStates();
 * trace(keyStates[0]); // Prints out either `true` or `false`.
 */
typedef CArray<T> = RawPointer<T>;

/**
 * C Const Arrays are similar to C Arrays,
 * Except they cannot be modified.
 */
typedef CConstArray<T> = RawConstPointer<T>;

@:include("stdio.h")
extern class Helpers {
    static inline function lengthOfArray<T>(array:CArray<T>):Int {
        return untyped __cpp__("(int)(sizeof({0}) / sizeof({0}[0]))", array);
    }

    static inline function malloc<T>(count:Int, starClass:Any):T {
		return cast untyped __cpp__("malloc({0} * sizeof({1}))", count, starClass);
	}

    static inline function sizeof(a:Any):Int {
        return untyped __cpp__("(int)sizeof({0})", a);
    }

    static inline function lengthOfConstArray<T>(array:CConstArray<T>):Int {
        return untyped __cpp__("(int)(sizeof({0}) / sizeof({0}[0]))", array);
    }

    static inline function free(ptr:Any) {
        return untyped __cpp__("free({0})", ptr);
    }

    static inline function nativeTrace(toTrace:ConstCharStar, formatParams:cpp.Rest<Any>):Void {
		return untyped __cpp__("printf({0}, {1})", toTrace, formatParams);
	}

    static inline function tempPointer<T>(value:Any):T {
		return untyped __cpp__("&{0}", value);
	}
}