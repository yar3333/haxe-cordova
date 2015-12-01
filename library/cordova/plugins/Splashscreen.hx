package cordova;

import js.html.*;

extern interface Navigator
{
	/** This plugin displays and hides a splash screen during application launch. */
	splashscreen:
	{
		/** Dismiss the splash screen. */
		function hide() : Void;
		/** Displays the splash screen. */
		function show() : Void;
	}
}