package cordova;


@:native("navigator.network.Connection") extern class Connection
{
	static var UNKNOWN : Int;
	static var ETHERNET : Int;
	static var WIFI : Int;
	static var CELL_2G : Int;
	static var CELL_3G : Int;
	static var CELL_4G : Int;
	static var NONE : Int;
	
	static var type : Int;
}