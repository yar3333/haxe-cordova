// Type definitions for Apache Cordova Splashscreen plugin.
// Project: https://github.com/apache/cordova-plugin-splashscreen
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license.

typedef Navigator =
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