package cordova;

@:native("window.navigator.accelerometer")
extern class Accelerometer
{
	/**
	 * Stop watching the Acceleration referenced by the watchID parameter.
	 */
	static function clearWatch(watchID:WatchHandle) : Void;
	/**
	 * Get the current acceleration along the x, y, and z axes.
	 * These acceleration values are returned to the accelerometerSuccess callback function.
	 */
	static function getCurrentAcceleration(accelerometerSuccess:Acceleration->Void, accelerometerError:Void->Void) : Void;
	/**
	 * Retrieves the device's current Acceleration at a regular interval, executing the
	 * accelerometerSuccess callback function each time. Specify the interval in milliseconds
	 * via the acceleratorOptions object's frequency parameter.
	 * The returned watch ID references the accelerometer's watch interval, and can be used
	 * with navigator.accelerometer.clearWatch to stop watching the accelerometer.
	 */
	static function watchAcceleration(accelerometerSuccess:Acceleration->Void, accelerometerError:Void->Void, ?accelerometerOptions:AccelerometerOptions) : WatchHandle;
}