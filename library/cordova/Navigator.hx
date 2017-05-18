package cordova;

extern interface Navigator
{
	/**
	 * This plugin provides access to the device's accelerometer. The accelerometer is a motion sensor
	 * that detects the change (delta) in movement relative to the current device orientation,
	 * in three dimensions along the x, y, and z axis.
	 */
	var accelerometer : Accelerometer;
	/**
	 * This plugin provides an API for taking pictures and for choosing images from the system's image library.
	 */
	var camera : Camera;
}