package cordova;

extern interface Acceleration
{
	/**
	 * Amount of acceleration on the x-axis. (in m/s^2) 
	 */
	var x : Float;
	/**
	 * Amount of acceleration on the y-axis. (in m/s^2) 
	 */
	var y : Float;
	/**
	 * Amount of acceleration on the z-axis. (in m/s^2) 
	 */
	var z : Float;
	/**
	 * Creation timestamp in milliseconds. 
	 */
	var timestamp : Float;
}