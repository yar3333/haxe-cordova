package cordova;

extern interface Entry
{
	/**
	 * Entry is a file. 
	 */
	var isFile : Bool;
	/**
	 * Entry is a directory. 
	 */
	var isDirectory : Bool;
	/**
	 * The name of the entry, excluding the path leading to it. 
	 */
	var name : String;
	/**
	 * The full absolute path from the root to the entry. 
	 */
	var fullPath : String;
	/**
	 * The file system on which the entry resides. 
	 */
	var fileSystem : FileSystem;
	var nativeURL : String;

	/**
	 * Look up metadata about this entry.
	 */
	function getMetadata(successCallback:Metadata->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Move an entry to a different location on the file system. It is an error to try to:
	 *     move a directory inside itself or to any child at any depth;move an entry into its parent if a name different from its current one isn't provided;
	 *     move a file to a path occupied by a directory;
	 *     move a directory to a path occupied by a file;
	 *     move any element to a path occupied by a directory which is not empty.
	 * A move of a file on top of an existing file must attempt to delete and replace that file.
	 * A move of a directory on top of an existing empty directory must attempt to delete and replace that directory.
	 */
	function moveTo(parent:DirectoryEntry, ?newName:String, ?successCallback:Entry->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Copy an entry to a different location on the file system. It is an error to try to:
	 *     copy a directory inside itself or to any child at any depth;
	 *     copy an entry into its parent if a name different from its current one isn't provided;
	 *     copy a file to a path occupied by a directory;
	 *     copy a directory to a path occupied by a file;
	 *     copy any element to a path occupied by a directory which is not empty.
	 *     A copy of a file on top of an existing file must attempt to delete and replace that file.
	 *     A copy of a directory on top of an existing empty directory must attempt to delete and replace that directory.
	 * Directory copies are always recursive--that is, they copy all contents of the directory.
	 */
	function copyTo(parent:DirectoryEntry, ?newName:String, ?successCallback:Entry->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Returns a URL that can be used as the src attribute of a <video> or <audio> tag.
	 * If that is not possible, construct a cdvfile:// URL.
	 * @return string URL
	 */
	function toURL() : String;
	/**
	 * Return a URL that can be passed across the bridge to identify this entry.
	 * @return string URL that can be passed across the bridge to identify this entry
	 */
	function toInternalURL() : String;
	/**
	 * Deletes a file or directory. It is an error to attempt to delete a directory that is not empty. It is an error to attempt to delete the root directory of a filesystem.
	 */
	function remove(successCallback:Void->Void, ?errorCallback:FileError->Void) : Void;
	/**
	 * Look up the parent DirectoryEntry containing this Entry. If this Entry is the root of its filesystem, its parent is itself.
	 */
	function getParent(successCallback:Entry->Void, ?errorCallback:FileError->Void) : Void;
}