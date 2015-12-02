package cordova.plugins;

import js.*;
import js.html.*;


/** This plugin displays and hides a splash screen during application launch. */
@:noUsing
@:native("window.navigator.splashscreen") extern class Splashscreen
{
	/** Dismiss the splash screen. */
	static function hide() : Void;
	/** Displays the splash screen. */
	static function show() : Void;
	
}
