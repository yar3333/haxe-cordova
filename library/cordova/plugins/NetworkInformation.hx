package cordova.plugins;

import js.*;
import js.html.*;

extern class Document
{
	static inline function addEventListener_online(document:js.html.Document, connectionStateCallback:Void->Dynamic, ?useCapture:Bool) : Void document.addEventListener("online", connectionStateCallback, useCapture);
	static inline function addEventListener_offline(document:js.html.Document, connectionStateCallback:Void->Dynamic, ?useCapture:Bool) : Void document.addEventListener("offline", connectionStateCallback, useCapture);
}

/**
 * The connection object, exposed via navigator.connection, provides information
 * about the device's cellular and wifi connection.
 */
@:native("window.navigator.connection") extern class Connection
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
	static var type: Float;

	static var UNKNOWN : Float;
	static var ETHERNET : Float;
	static var WIFI : Float;
	static var CELL_2G : Float;
	static var CELL_3G : Float;
	static var CELL_4G : Float;
	static var CELL : Float;
	static var NONE : Int;
}