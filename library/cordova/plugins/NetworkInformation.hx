package cordova.plugins;

import js.html.*;

}

extern class Document
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
	NONE : Int
}