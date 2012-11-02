package cordova;

@:native("window.device") extern class Device
{
	static var name:String;
	static var cordova:String;
	static var platform:String;
	static var uuid:String;
	static var version:String;
}
