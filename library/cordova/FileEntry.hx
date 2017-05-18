package cordova;

extern interface FileEntry extends Entry
{
	/**
	 * Creates a new FileWriter associated with the file that this FileEntry represents.
	 */
	function createWriter(successCallback:FileWriter->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Returns a File that represents the current state of the file that this FileEntry represents.
	 */
	function file(successCallback:js.html.File->Void, ?errorCallback:FileError->Void) : Void;
}