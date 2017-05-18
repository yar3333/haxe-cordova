package cordova;

@:enum
abstract LocalFileSystem(Int)
{
	var PERSISTENT = 0;
	var TEMPORARY = 1;
}