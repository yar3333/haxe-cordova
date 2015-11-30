// Type definitions for Apache Cordova Device plugin.
// Project: https://github.com/apache/cordova-plugin-device
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license. 

/**
 * This plugin defines a global device object, which describes the device's hardware and software.
 * Although the object is in the global scope, it is not available until after the deviceready event.
 */
typedef Device =
{
	/** Get the version of Cordova running on the device. */
	var cordova : String;
	/**
	 * The device.model returns the name of the device's model or product. The value is set
	 * by the device manufacturer and may be different across versions of the same product.
	 */
	var model : String;
	/** Get the device's operating system name. */
	var platform : String;
	/** Get the device's Universally Unique Identifier (UUID). */
	var uuid : String;
	/** Get the operating system version. */
	var version : String;
	/** Get the device's manufacturer. */
	var manufacturer : String;
}

declare var device : Device;