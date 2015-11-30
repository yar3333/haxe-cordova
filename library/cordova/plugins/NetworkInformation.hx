// Type definitions for Apache Cordova Network Information plugin.
// Project: https://github.com/apache/cordova-plugin-network-information
// Definitions by: Microsoft Open Technologies, Inc. <http://msopentech.com>
// Definitions: https://github.com/borisyankov/DefinitelyTyped
// 
// Copyright (c) Microsoft Open Technologies, Inc.
// Licensed under the MIT license.

typedef Navigator =
{
	/**
	 * This plugin provides an implementation of an old version of the Network Information API.
	 * It provides information about the device's cellular and wifi connection, and whether the device has an internet connection.
	 */
	var connection : Connection;
	// see https://github.com/apache/cordova-plugin-network-information/blob/dev/doc/index.md#api-change
	// for 
	network:
	{
		/**
		 * This plugin provides an implementation of an old version of the Network Information API.
		 * It provides information about the device's cellular and wifi connection, and whether the device has an internet connection.
		 */
		connection: Connection
	}
}

typedef Document =
{
	function addEventListener(type: "online", connectionStateCallback:Void->Dynamic, ?useCapture:Bool) : Void;
	function addEventListener(type: "offline", connectionStateCallback:Void->Dynamic, ?useCapture:Bool) : Void;
}

/**
 * The connection object, exposed via navigator.connection, provides information
 * about the device's cellular and wifi connection.
 */
typedef Connection =
{
	/**
	 * This property offers a fast way to determine the device's network connection state, and type of connection.
	 * One of:
	 *     Connection.UNKNOWN
	 *     Connection.ETHERNET
	 *     Connection.WIFI
	 *     Connection.CELL_2G
	 *     Connection.CELL_3G
	 *     Connection.CELL_4G
	 *     Connection.CELL
	 *     Connection.NONE
	 */
	type: Float
}

declare var Connection:
{
	UNKNOWN : Float,
	ETHERNET : Float,
	WIFI : Float,
	CELL_2G : Float,
	CELL_3G : Float,
	CELL_4G : Float,
	CELL : Float,
	NONE : Float
}