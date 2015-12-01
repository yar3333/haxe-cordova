package cordova.plugins;

import js.*;
import js.html.*;

/**
 * This plugin defines a global device object, which describes the device's hardware and software.
 * Although the object is in the global scope, it is not available until after the deviceready event.
 */
@:noUsing
@:native("window.device") extern class Device
{
	/** Get the version of Cordova running on the device. */
	static var cordova : String;
	/**
	 * The device.model returns the name of the device's model or product. The value is set
	 * by the device manufacturer and may be different across versions of the same product.
	 */
	static var model : String;
	/** Get the device's operating system name. */
	static var platform : String;
	/** Get the device's Universally Unique Identifier (UUID). */
	static var uuid : String;
	/** Get the operating system version. */
	static var version : String;
	/** Get the device's manufacturer. */
	static var manufacturer : String;
}

