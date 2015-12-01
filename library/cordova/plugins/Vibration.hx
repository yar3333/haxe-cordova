package cordova.plugins;

import js.*;
import js.html.*;

extern class Notification
{
	/**
	 * Vibrates the device for the specified amount of time.
	 * @param time Milliseconds to vibrate the device. Ignored on iOS.
	 * @deprecated
	 */
	static function vibrate(time:Float) : Void;
	/**
	 * Vibrates the device with a given pattern.
	 * @param number[] pattern Pattern with which to vibrate the device.
	 *                         The first value - number of milliseconds to wait before turning the vibrator on.
	 *                         The next value - the number of milliseconds for which to keep the vibrator on before turning it off.
	 * @param number  repeat   Optional index into the pattern array at which to start repeating (will repeat until canceled),
	 *                         or -1 for no repetition (default).
	 * @deprecated
	 */
	static function vibrateWithPattern(pattern:Array<Float>, repeat:Float) : Void;
	/**
	 * Immediately cancels any currently running vibration.
	 * @deprecated
	 */
	static function cancelVibration() : Void;
}
