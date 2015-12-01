package cordova.plugins;

import js.*;
import js.html.*;

/**
 * This plugin provides access to the device's accelerometer. The accelerometer is a motion sensor
 * that detects the change (delta) in movement relative to the current device orientation,
 * in three dimensions along the x, y, and z axis.
 */
@:noUsing
@:native("window.navigator.accelerometer") extern class Accelerometer
{
	/**
	 * Stop watching the Acceleration referenced by the watchID parameter.
	 * @param watchID The ID returned by navigator.accelerometer.watchAcceleration.
	 */
	static function clearWatch(watchID:WatchHandle) : Void;
	/**
	 * Get the current acceleration along the x, y, and z axes.
	 * These acceleration values are returned to the accelerometerSuccess callback function.
	 * @param accelerometerSuccess Success callback that gets the Acceleration object.
	 * @param accelerometerError Success callback
	 */
	static function getCurrentAcceleration(
		accelerometerSuccess:Acceleration->Void,
		accelerometerError: Void->Void) : Void;
	/**
	 * Retrieves the device's current Acceleration at a regular interval, executing the
	 * accelerometerSuccess callback function each time. Specify the interval in milliseconds
	 * via the acceleratorOptions object's frequency parameter.
	 * The returned watch ID references the accelerometer's watch interval, and can be used
	 * with navigator.accelerometer.clearWatch to stop watching the accelerometer.
	 * @param  accelerometerSuccess Callback, that called at every time interval and passes an Acceleration object.
	 * @param  accelerometerError   Error callback.
	 * @param  accelerometerOptions Object with options for watchAcceleration
	 */
	static function watchAcceleration(
		accelerometerSuccess:Acceleration->Void,
		accelerometerError: Void->Void,
		?accelerometerOptions:AccelerometerOptions) : WatchHandle;
}

/**
 * Contains Accelerometer data captured at a specific point in time. Acceleration values include
 * the effect of gravity (9.81 m/s^2), so that when a device lies flat and facing up, x, y, and z
 * values returned should be 0, 0, and 9.81.
 */
typedef Acceleration =
{
	/** Amount of acceleration on the x-axis. (in m/s^2) */
	var x : Float;
	/** Amount of acceleration on the y-axis. (in m/s^2) */
	var y : Float;
	/** Amount of acceleration on the z-axis. (in m/s^2) */
	var z : Float;
	/** Creation timestamp in milliseconds. */
	var timestamp : Float;
}

/** Object with options for watchAcceleration */
typedef AccelerometerOptions =
{
	/** How often to retrieve the Acceleration in milliseconds. (Default: 10000) */
	@:optional var frequency : Float;
}

/** Abstract type for watch IDs used by Accelerometer. Values of these type are actually `number` at runtime.*/
typedef WatchHandle = Dynamic;

