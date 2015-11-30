// Type definitions for Apache Cordova Dialogs plugin.
// Project: https://github.com/apache/cordova-plugin-dialogs
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license. 

typedef Navigator =
{
	/** This plugin provides access to some native dialog UI elements. */
	notification: Notification
}

/** This plugin provides access to some native dialog UI elements. */
typedef Notification =
{
	/**
	 * Shows a custom alert or dialog box. Most Cordova implementations use a native dialog box for this feature,
	 * but some platforms use the browser's alert function, which is typically less customizable.
	 * @param message       Dialog message.
	 * @param alertCallback Callback to invoke when alert dialog is dismissed.
	 * @param title         Dialog title, defaults to 'Alert'.
	 * @param buttonName    Button name, defaults to OK.
	 */
	function alert(message:String,
		alertCallback: Void->Void,
		?title:String,
		?buttonName:String) : Void;
	/**
	 * The device plays a beep sound.
	 * @param times The number of times to repeat the beep. 
	 */
	function beep(times:Float) : Void;
	/**
	 * Displays a customizable confirmation dialog box.
	 * @param message           Dialog message.
	 * @param confirmCallback   Callback to invoke with index of button pressed (1, 2, or 3)
	 *                                   or when the dialog is dismissed without a button press (0).
	 * @param title             Dialog title, defaults to Confirm.
	 * @param buttonLabels      Array of strings specifying button labels, defaults to [OK,Cancel].
	 */
	function confirm(message:String,
		confirmCallback:Float->Void,
		?title:String,
		?buttonLabels:Array<String>) : Void;
	/**
	 * Displays a native dialog box that is more customizable than the browser's prompt function.
	 * @param message           Dialog message.
	 * @param promptCallback    Callback to invoke when a button is pressed.
	 * @param title             Dialog title, defaults to "Prompt".
	 * @param buttonLabels      Array of strings specifying button labels, defaults to ["OK","Cancel"].
	 * @param defaultText       Default textbox input value, default: "".
	 */
	function prompt(message:String,
		promptCallback:NotificationPromptResult->Void,
		?title:String,
		?buttonLabels:Array<String>,
		?defaultText:String) : Void;
}

/** Object, passed to promptCallback */
typedef NotificationPromptResult =
{
	/**
	 * The index of the pressed button. Note that the index uses one-based indexing, so the value is 1, 2, 3, etc.
	 * 0 is the result when the dialog is dismissed without a button press.
	 */
	var buttonIndex : Float;
	/** The text entered in the prompt dialog box. */
	var input1 : String;
}