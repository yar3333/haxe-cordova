package cordova;

import js.html.*;

@:native("device")
extern class Device
{
	/**
	 * Get the version of Cordova running on the device. 
	 */
	static var cordova : String;
	/**
	 * Indicates that Cordova initialize successfully. 
	 */
	static var available : Bool;
	/**
	 * The device.model returns the name of the device's model or product. The value is set
	 * by the device manufacturer and may be different across versions of the same product.
	 */
	static var model : String;
	/**
	 * Get the device's operating system name. 
	 */
	static var platform : String;
	/**
	 * Get the device's Universally Unique Identifier (UUID). 
	 */
	static var uuid : String;
	/**
	 * Get the operating system version. 
	 */
	static var version : String;
	/**
	 * Get the device's manufacturer. 
	 */
	static var manufacturer : String;
	/**
	 * Whether the device is running on a simulator. 
	 */
	static var isVirtual : Bool;
	/**
	 * Get the device hardware serial number. 
	 */
	static var serial : String;
}