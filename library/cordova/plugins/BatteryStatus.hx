package cordova;

import js.html.*;

extern class Window
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
	static inline function addEventListener_batterystatus(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.addEventListener("batterystatus", listener, useCapture);
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
	static inline function addEventListener_batterycritical(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.addEventListener("batterycritical", listener, useCapture);
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
	static inline function addEventListener_batterylow(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.addEventListener("batterylow", listener, useCapture);
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
	static inline function removeEventListener_batterystatus(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.removeEventListener("batterystatus", listener, useCapture);
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
	static inline function removeEventListener_batterycritical(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.removeEventListener("batterycritical", listener, useCapture);
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
	static inline function removeEventListener_batterylow(window:js.html.Window, listener:BatteryStatusEvent->Dynamic, ?useCapture:Bool) : Void window.removeEventListener("batterylow", listener, useCapture);
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