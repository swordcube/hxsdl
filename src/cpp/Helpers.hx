package cpp;

import cpp.RawConstPointer;
import cpp.RawPointer;

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

class Helpers {
    public static function lengthOfArray<T>(array:CArray<T>):Int {
        return untyped __cpp__("(int)(sizeof({0}) / sizeof({0}[0]))", array);
    }

    public static function lengthOfConstArray<T>(array:CConstArray<T>):Int {
        return untyped __cpp__("(int)(sizeof({0}) / sizeof({0}[0]))", array);
    }
}