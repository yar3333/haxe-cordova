package cordova;

@:native("window.navigator.compass")
extern class Compass
{
	/**
	 * Get the current compass heading. The compass heading is returned via a CompassHeading
	 * object using the onSuccess callback function.
	 */
	static function getCurrentHeading(onSuccess:CompassHeading->Void, onError:CompassError->Void, ?options:CompassOptions) : Void;
	/**
	 * Gets the device's current heading at a regular interval. Each time the heading is retrieved,
	 * the headingSuccess callback function is executed. The returned watch ID references the compass
	 * watch interval. The watch ID can be used with navigator.compass.clearWatch to stop watching
	 * the navigator.compass.
	 */
	static function watchHeading(onSuccess:CompassHeading->Void, onError:CompassError->Void, ?options:CompassOptions) : Float;
	/**
	 * Stop watching the compass referenced by the watch ID parameter.
	 */
	static function clearWatch(id:Float) : Void;
}