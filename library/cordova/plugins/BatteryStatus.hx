// Type definitions for Apache Cordova BatteryStatus plugin.
// Project: https://github.com/apache/cordova-plugin-battery-status
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license. 

typedef Window =
{
	var onbatterystatus : BatteryStatusEvent->Void;
	var onbatterycritical : BatteryStatusEvent->Void;
	var onbatterylow : BatteryStatusEvent->Void;
	/**
	 * Adds a listener for an event from the BatteryStatus plugin.
	 * @param type      the event to listen for
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param listener  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function addEventListener(type: "batterystatus", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Adds a listener for an event from the BatteryStatus plugin.
	 * @param type      the event to listen for
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param listener  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function addEventListener(type: "batterycritical", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Adds a listener for an event from the BatteryStatus plugin.
	 * @param type      the event to listen for
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param listener  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function addEventListener(type: "batterylow", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Adds a listener for an event from the BatteryStatus plugin.
	 * @param type      the event to listen for
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param listener  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function addEventListener(type:String, listener:Event->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Removes a listener for an event from the BatteryStatus plugin.
	 * @param type      The event to stop listening for.
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function removeEventListener(type: "batterystatus", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Removes a listener for an event from the BatteryStatus plugin.
	 * @param type      The event to stop listening for.
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function removeEventListener(type: "batterycritical", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Removes a listener for an event from the BatteryStatus plugin.
	 * @param type      The event to stop listening for.
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function removeEventListener(type: "batterylow", listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Removes a listener for an event from the BatteryStatus plugin.
	 * @param type      The event to stop listening for.
	 *                  batterystatus: event fires when the percentage of battery charge
	 *                  changes by at least 1 percent, or if the device is plugged in or unplugged.
	 *                  batterycritical: event fires when the percentage of battery charge has reached
	 *                  the critical battery threshold. The value is device-specific.
	 *                  batterylow: event fires when the percentage of battery charge has
	 *                  reached the low battery threshold, device-specific value.
	 * @param callback  the function that executes when the event fires. The function is
	 *                  passed an BatteryStatusEvent object as a parameter.
	 */
	function removeEventListener(type:String, listener:Event->Dynamic, ?useCapture:Bool) : Void;
}

/** Object, that passed into battery event listener */
typedef BatteryStatusEvent =
{
	>Event,

	/* The percentage of battery charge (0-100). */
	var level : Float;
	/* A boolean that indicates whether the device is plugged in. */
	var isPlugged : Bool;
}