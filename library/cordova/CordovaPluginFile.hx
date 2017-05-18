package cordova;

@:native("window")
extern class CordovaPluginFile
{
	var TEMPORARY : Int;
	var PERSISTENT : Int;

	/**
	 * Requests a filesystem in which to store application data.
	 */
	function requestFileSystem(type:LocalFileSystem, size:Float, successCallback:FileSystem->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Look up file system Entry referred to by local URL.
	 */
	function resolveLocalFileSystemURL(url:String, successCallback:Entry->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Look up file system Entry referred to by local URI.
	 */
	function resolveLocalFileSystemURI(uri:String, successCallback:Entry->Void, ?errorCallback:FileError->Void) : Void;
}