package cordova.plugins;

import js.*;
import js.html.*;

@:noUsing
@:native("window.navigator") extern class Vibration
{
	/**
	 * Vibrates the device for the specified amount of time.
	 * @param time Milliseconds to vibrate the device. 0 cancels the vibration. Ignored on iOS.
	 */
	@:overload(function(time:Array<Float>):Void{})
	static function vibrate(time:Float) : Void;

	/**
	 * Vibrates the device with a given pattern.
	 * @param time Sequence of durations (in milliseconds) for which to turn on or off the vibrator. Ignored on iOS.
	 */
	// static function vibrate(time:Array<Float>) : Void;
}