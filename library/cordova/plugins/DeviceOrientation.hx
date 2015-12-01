package cordova.plugins;

import js.html.*;

/** 
 * This plugin provides access to the device's compass. The compass is a sensor that detects
 * the direction or heading that the device is pointed, typically from the top of the device.
 * It measures the heading in degrees from 0 to 359.99, where 0 is north.
 */
typedef Compass =
{
	/**
	 * Get the current compass heading. The compass heading is returned via a CompassHeading
	 * object using the onSuccess callback function.
	 * @param onSuccess Success callback that passes CompassHeading object.
	 * @param onError Error callback that passes CompassError object.
	 */
	function getCurrentHeading(
		onSuccess:CompassHeading->Void,
		onError:CompassError->Void,
		?options:CompassOptions) : Void;
	/**
	 * Gets the device's current heading at a regular interval. Each time the heading is retrieved,
	 * the headingSuccess callback function is executed. The returned watch ID references the compass
	 * watch interval. The watch ID can be used with navigator.compass.clearWatch to stop watching
	 * the navigator.compass.
	 * @param onSuccess Success callback that passes CompassHeading object.
	 * @param onError   Error callback that passes CompassError object.
	 * @param options   CompassOptions object
	 */
	function watchHeading(
		onSuccess:CompassHeading->Void,
		onError:CompassError->Void,
		?options:CompassOptions) : Float;
	/**
	 * Stop watching the compass referenced by the watch ID parameter.
	 * @param id The ID returned by navigator.compass.watchHeading.
	 */
	function clearWatch(id:Float) : Void;
}

/** A CompassHeading object is returned to the compassSuccess callback function. */
typedef CompassHeading =
{
	/** The heading in degrees from 0-359.99 at a single moment in time. */
	var magneticHeading : Float;
	/** The heading relative to the geographic North Pole in degrees 0-359.99 at a single moment in time. A negative value indicates that the true heading can't be determined. */
	var trueHeading : Float;
	/** The deviation in degrees between the reported heading and the true heading. */
	var headingAccuracy : Float;
	/** The time at which this heading was determined. */
	var timestamp : Float;
}

typedef CompassOptions =
{
	@:optional var filter : Float;
	@:optional var frequency : Float;
}

/** A CompassError object is returned to the onError callback function when an error occurs. */
typedef CompassError =
{
	/**
	 * One of the predefined error codes
	 *     CompassError.COMPASS_INTERNAL_ERR
	 *     CompassError.COMPASS_NOT_SUPPORTED
	 */
	var code : Float;
}

declare var CompassError:
{
	/** Constructor for CompassError object */
	function new(code:Float) : Void;
	COMPASS_INTERNAL_ERR : Float,
	COMPASS_NOT_SUPPORTED: Float;
}