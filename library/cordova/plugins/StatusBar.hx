package cordova.plugins;

import js.*;
import js.html.*;

/**
* The StatusBar object provides some functions to customize the iOS and Android StatusBar.
*/
@:noUsing
@:native("window.StatusBar") extern class StatusBar
{
	/**
	* On iOS 7, make the statusbar overlay or not overlay the WebView.
	* @param isOverlay         On iOS 7, set to false to make the statusbar appear like iOS 6.
	*                              Set the style and background color to suit using the other functions.
	*/
	static var overlaysWebView : Bool->Void;

	/**
	* Use the default statusbar (dark text, for light backgrounds).
	*/
	static var styleDefault : Void->Void;

	/**
	* Use the lightContent statusbar (light text, for dark backgrounds).
	*/
	static var styleLightContent : Void->Void;

	/**
	* Use the blackTranslucent statusbar (light text, for dark backgrounds).
	*/
	static var styleBlackTranslucent : Void->Void;

	/**
	* Use the blackOpaque statusbar (light text, for dark backgrounds).
	*/
	static var styleBlackOpaque : Void->Void;

	/**
	* On iOS 7, when you set StatusBar.statusBarOverlaysWebView to false,
	* you can set the background color of the statusbar by color name.
	* @param color             Supported color names are:
	*                              black, darkGray, lightGray, white, gray, red, green, blue, cyan, yellow, magenta, orange, purple, brown
	*/
	static var backgroundColorByName : String->Void;

	/**
	* Sets the background color of the statusbar by a hex string.
	* @param color             CSS shorthand properties are also supported.
	*                              On iOS 7, when you set StatusBar.statusBarOverlaysWebView to false, you can set the background color of the statusbar by a hex string (#RRGGBB).
	*                              On WP7 and WP8 you can also specify values as #AARRGGBB, where AA is an alpha value
	*/
	static var backgroundColorByHexString : String->Void;

	/**
	* Hide the statusbar.
	*/
	static var hide : Void->Void;

	/**
	* Show the statusbar.
	*/
	static var show : Void->Void;

	/**
	* Read this property to see if the statusbar is visible or not.
	*/
	static var isVisible : Bool;
}
