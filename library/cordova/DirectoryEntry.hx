package cordova;

extern interface DirectoryEntry extends Entry
{
	/**
	 * Creates a new DirectoryReader to read Entries from this Directory.
	 */
	function createReader() : DirectoryReader;
	/**
	 * Creates or looks up a file.
	 */
	function getFile(path:String, ?options:Flags, ?successCallback:FileEntry->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Creates or looks up a directory.
	 */
	function getDirectory(path:String, ?options:Flags, ?successCallback:DirectoryEntry->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Deletes a directory and all of its contents, if any. In the event of an error (e.g. trying
	 * to delete a directory that contains a file that cannot be removed), some of the contents
	 * of the directory may be deleted. It is an error to attempt to delete the root directory of a filesystem.
	 */
	function removeRecursively(successCallback:Void->Void, ?errorCallback:FileError->Void) : Void;
}