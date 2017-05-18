package cordova;

extern interface DirectoryReader
{
	/**
	 * Read the next block of entries from this directory.
	 */
	function readEntries(successCallback:Array<Entry>->Void, ?errorCallback:FileError->Void) : Void;
}