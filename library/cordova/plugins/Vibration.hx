package cordova;

import js.html.*;

extern interface Navigator
{
	/**
	 * Vibrates the device for the specified amount of time.
	 * @param time Milliseconds to vibrate the device. 0 cancels the vibration. Ignored on iOS.
	 */
	function vibrate(time:Float) : Void;

	/**
	 * Vibrates the device with a given pattern.
	 * @param time Sequence of durations (in milliseconds) for which to turn on or off the vibrator. Ignored on iOS.
	 */
	function vibrate(time:Array<Float>) : Void;
}

extern interface Notification
{
	/**
	 * Vibrates the device for the specified amount of time.
	 * @param time Milliseconds to vibrate the device. Ignored on iOS.
	 * @deprecated
	 */
	function vibrate(time:Float) : Void;
	/**
	 * Vibrates the device with a given pattern.
	 * @param number[] pattern Pattern with which to vibrate the device.
	 *                         The first value - number of milliseconds to wait before turning the vibrator on.
	 *                         The next value - the number of milliseconds for which to keep the vibrator on before turning it off.
	 * @param number  repeat   Optional index into the pattern array at which to start repeating (will repeat until canceled),
	 *                         or -1 for no repetition (default).
	 * @deprecated
	 */
	function vibrateWithPattern(pattern:Array<Float>, repeat:Float) : Void;
	/**
	 * Immediately cancels any currently running vibration.
	 * @deprecated
	 */
	function cancelVibration() : Void;
}
