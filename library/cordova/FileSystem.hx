package cordova;

extern interface FileSystem
{
	var name : String;
	/**
	 * The root directory of the file system. 
	 */
	var root : DirectoryEntry;
}