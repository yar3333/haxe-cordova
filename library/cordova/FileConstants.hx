package cordova;

@:native("window.cordova.file")
extern class FileConstants
{
	static var applicationDirectory : String;
	static var applicationStorageDirectory : String;
	static var dataDirectory : String;
	static var cacheDirectory : String;
	static var externalApplicationStorageDirectory : String;
	static var externalDataDirectory : String;
	static var externalCacheDirectory : String;
	static var externalRootDirectory : String;
	static var tempDirectory : String;
	static var syncedDataDirectory : String;
	static var documentsDirectory : String;
	static var sharedDirectory : String;
}
