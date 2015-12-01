package cordova;

import js.html.*;

extern class Window
{
	/**
	 * Requests a filesystem in which to store application data.
	 * @param type              Whether the filesystem requested should be persistent, as defined above. Use one of TEMPORARY or PERSISTENT.
	 * @param size              This is an indicator of how much storage space, in bytes, the application expects to need.
	 * @param successCallback   The callback that is called when the user agent provides a filesystem.
	 * @param errorCallback     A callback that is called when errors happen, or when the request to obtain the filesystem is denied.
	 */
	function requestFileSystem(
		type: Float,
		size: Float,
		successCallback:FileSystem->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Look up file system Entry referred to by local URI.
	 * @param string uri       URI referring to a local file or directory
	 * @param successCallback  invoked with Entry object corresponding to URI
	 * @param errorCallback    invoked if error occurs retrieving file system entry
	 */
	function resolveLocalFileSystemURI(uri:String,
		successCallback:Entry->Void,
		?errorCallback:FileError->Void) : Void;
	var TEMPORARY : Float;
	var PERSISTENT : Float;
}

/** This interface represents a file system. */
extern interface FileSystem
{
	/* The name of the file system, unique across the list of exposed file systems. */
	var name : String;
	/** The root directory of the file system. */
	var root : DirectoryEntry;
}

/** 
 * An abstract interface representing entries in a file system,
 * each of which may be a File or DirectoryEntry.
 */
extern interface Entry
{
	/** Entry is a file. */
	var isFile : Bool;
	/** Entry is a directory. */
	var isDirectory : Bool;
	/** The name of the entry, excluding the path leading to it. */
	var name : String;
	/** The full absolute path from the root to the entry. */
	var fullPath : String;
	/** The file system on which the entry resides. */
	var fileSystem : FileSystem;
	var nativeURL : String;
	/**
	 * Look up metadata about this entry.
	 * @param successCallback A callback that is called with the time of the last modification.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function getMetadata(
		successCallback:Metadata->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Move an entry to a different location on the file system. It is an error to try to:
	 *     move a directory inside itself or to any child at any depth;move an entry into its parent if a name different from its current one isn't provided;
	 *     move a file to a path occupied by a directory;
	 *     move a directory to a path occupied by a file;
	 *     move any element to a path occupied by a directory which is not empty.
	 * A move of a file on top of an existing file must attempt to delete and replace that file.
	 * A move of a directory on top of an existing empty directory must attempt to delete and replace that directory.
	 * @param parent  The directory to which to move the entry.
	 * @param newName The new name of the entry. Defaults to the Entry's current name if unspecified.
	 * @param successCallback A callback that is called with the Entry for the new location.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function moveTo(parent:DirectoryEntry,
		?newName:String,
		?successCallback:Entry->Void,
		?errorCallback:FileError->Void) : Void;
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
	 * @param parent The directory to which to move the entry.
	 * @param newName The new name of the entry. Defaults to the Entry's current name if unspecified.
	 * @param successCallback A callback that is called with the Entry for the new object.
	 * @param errorCallback A callback that is called when errors happen.
	 */
	function copyTo(parent:DirectoryEntry,
		?newName:String,
		?successCallback:Entry->Void,
		?errorCallback:FileError->Void) : Void;
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
	 * @param successCallback A callback that is called on success.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function remove(successCallback:Void->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Look up the parent DirectoryEntry containing this Entry. If this Entry is the root of its filesystem, its parent is itself.
	 * @param successCallback A callback that is called with the time of the last modification.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function getParent(successCallback:Entry->Void,
		?errorCallback:FileError->Void) : Void;
}

/** This interface supplies information about the state of a file or directory. */
extern interface Metadata
{
	/** This is the time at which the file or directory was last modified. */
	var modificationTime : Date;
	/** The size of the file, in bytes. This must return 0 for directories. */
	var size : Float;
}

/** This interface represents a directory on a file system. */
extern interface DirectoryEntry extends Entry
{
	/**
	 * Creates a new DirectoryReader to read Entries from this Directory.
	 */
	function createReader() : DirectoryReader;
	/**
	 * Creates or looks up a file.
	 * @param path    Either an absolute path or a relative path from this DirectoryEntry
	 *                to the file to be looked up or created.
	 *                It is an error to attempt to create a file whose immediate parent does not yet exist.
	 * @param options If create and exclusive are both true, and the path already exists, getFile must fail.
	 *                If create is true, the path doesn't exist, and no other error occurs, getFile must create it as a zero-length file and return a corresponding FileEntry.
	 *                If create is not true and the path doesn't exist, getFile must fail.
	 *                If create is not true and the path exists, but is a directory, getFile must fail.
	 *                Otherwise, if no other error occurs, getFile must return a FileEntry corresponding to path.
	 * @param successCallback A callback that is called to return the File selected or created.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function getFile(path:String, ?options:Flags,
		?successCallback:FileEntry->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Creates or looks up a directory.
	 * @param path    Either an absolute path or a relative path from this DirectoryEntry
	 *                to the directory to be looked up or created.
	 *                It is an error to attempt to create a directory whose immediate parent does not yet exist.
	 * @param options If create and exclusive are both true and the path already exists, getDirectory must fail.
	 *                If create is true, the path doesn't exist, and no other error occurs, getDirectory must create and return a corresponding DirectoryEntry.
	 *                If create is not true and the path doesn't exist, getDirectory must fail.
	 *                If create is not true and the path exists, but is a file, getDirectory must fail.
	 *                Otherwise, if no other error occurs, getDirectory must return a DirectoryEntry corresponding to path.
	 * @param successCallback A callback that is called to return the Directory selected or created.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function getDirectory(path:String, ?options:Flags,
		?successCallback:DirectoryEntry->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Deletes a directory and all of its contents, if any. In the event of an error (e.g. trying
	 * to delete a directory that contains a file that cannot be removed), some of the contents
	 * of the directory may be deleted. It is an error to attempt to delete the root directory of a filesystem.
	 * @param successCallback A callback that is called on success.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function removeRecursively(successCallback:Void->Void,
		?errorCallback:FileError->Void) : Void;
}

/**
 * This dictionary is used to supply arguments to methods
 * that look up or create files or directories.
 */
extern interface Flags
{
	/** Used to indicate that the user wants to create a file or directory if it was not previously there. */
	@:optional var create : Bool;
	/** By itself, exclusive must have no effect. Used with create, it must cause getFile and getDirectory to fail if the target path already exists. */
	@:optional var exclusive : Bool;
}

/**
 * This interface lets a user list files and directories in a directory. If there are
 * no additions to or deletions from a directory between the first and last call to
 * readEntries, and no errors occur, then:
 *     A series of calls to readEntries must return each entry in the directory exactly once.
 *     Once all entries have been returned, the next call to readEntries must produce an empty array.
 *     If not all entries have been returned, the array produced by readEntries must not be empty.
 *     The entries produced by readEntries must not include the directory itself ["."] or its parent [".."].
 */
extern interface DirectoryReader
{
	/**
	 * Read the next block of entries from this directory.
	 * @param successCallback Called once per successful call to readEntries to deliver the next
	 *                        previously-unreported set of Entries in the associated Directory.
	 *                        If all Entries have already been returned from previous invocations
	 *                        of readEntries, successCallback must be called with a zero-length array as an argument.
	 * @param errorCallback   A callback indicating that there was an error reading from the Directory.
	 */
	function readEntries(
		successCallback:Array<Entry>->Void,
		?errorCallback:FileError->Void) : Void;
}

/** This interface represents a file on a file system. */
extern interface FileEntry extends Entry
{
	/**
	 * Creates a new FileWriter associated with the file that this FileEntry represents.
	 * @param successCallback A callback that is called with the new FileWriter.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function createWriter(successCallback:FileWriter->Void,
		?errorCallback:FileError->Void) : Void;
	/**
	 * Returns a File that represents the current state of the file that this FileEntry represents.
	 * @param successCallback A callback that is called with the File.
	 * @param errorCallback   A callback that is called when errors happen.
	 */
	function file(successCallback:File->Void,
		?errorCallback:FileError->Void) : Void;
}

/**
 * This interface provides methods to monitor the asynchronous writing of blobs
 * to disk using progress events and event handler attributes.
 */
extern interface FileSaver extends EventTarget
{
	/** Terminate file operation */
	function abort() : Void;
	/**
	 * The FileSaver object can be in one of 3 states. The readyState attribute, on getting,
	 * must return the current state, which must be one of the following values:
	 *     INIT
	 *     WRITING
	 *     DONE
	 */
	var readyState : Float;
	/** Handler for writestart events. */
	var onwritestart : ProgressEvent->Void;
	/** Handler for progress events. */
	var onprogress : ProgressEvent->Void;
	/** Handler for write events. */
	var onwrite : ProgressEvent->Void;
	/** Handler for abort events. */
	var onabort : ProgressEvent->Void;
	/** Handler for error events. */
	var onerror : ProgressEvent->Void;
	/** Handler for writeend events. */
	var onwriteend : ProgressEvent->Void;
	/** The last error that occurred on the FileSaver. */
	var error : Error;
}

/**
 * This interface expands on the FileSaver interface to allow for multiple write
 * actions, rather than just saving a single Blob.
 */
extern interface FileWriter extends FileSaver
{
	/**
	 * The byte offset at which the next write to the file will occur. This always less or equal than length.
	 * A newly-created FileWriter will have position set to 0.
	 */
	var position : Float;
	/**
	 * The length of the file. If the user does not have read access to the file,
	 * this will be the highest byte offset at which the user has written.
	 */
	var length : Float;
	/**
	 * Write the supplied data to the file at position.
	 * @param {Blob} data The blob to write.
	 */
	function write(data:Blob) : Void;
	/**
	 * The file position at which the next write will occur.
	 * @param offset If nonnegative, an absolute byte offset into the file.
	 *               If negative, an offset back from the end of the file.
	 */
	function seek(offset:Float) : Void;
	/**
	 * Changes the length of the file to that specified. If shortening the file, data beyond the new length
	 * will be discarded. If extending the file, the existing data will be zero-padded up to the new length.
	 * @param size The size to which the length of the file is to be adjusted, measured in bytes.
	 */
	function truncate(size:Float) : Void;
}

/* FileWriter states */
declare var FileWriter:
{
	INIT : Float,
	WRITING : Float,
	DONE: Float
};

extern interface FileError
{
	/** Error code */
	var code : Float;
}

declare FileError:
{
	function new(code:Float) : FileError;
	NOT_FOUND_ERR : Float,
	SECURITY_ERR : Float,
	ABORT_ERR : Float,
	NOT_READABLE_ERR : Float,
	ENCODING_ERR : Float,
	NO_MODIFICATION_ALLOWED_ERR : Float,
	INVALID_STATE_ERR : Float,
	SYNTAX_ERR : Float,
	INVALID_MODIFICATION_ERR : Float,
	QUOTA_EXCEEDED_ERR : Float,
	TYPE_MISMATCH_ERR : Float,
	PATH_EXISTS_ERR : Float
};

/*
 * Constants defined in fileSystemPaths
 */
extern interface Cordova
{
	file:
	{
		/* Read-only directory where the application is installed. */
		applicationDirectory : String,
		/* Root of app's private writable storage */
		applicationStorageDirectory : String,
		/* Where to put app-specific data files. */
		dataDirectory : String,
		/* Cached files that should survive app restarts. Apps should not rely on the OS to delete files in here. */
		cacheDirectory : String,
		/* Android: the application space on external storage. */
		externalApplicationStorageDirectory : String,
		/* Android: Where to put app-specific data files on external storage. */
		externalDataDirectory : String,
		/* Android: the application cache on external storage. */
		externalCacheDirectory : String,
		/* Android: the external storage (SD card) root. */
		externalRootDirectory : String,
		/* iOS: Temp directory that the OS can clear at will. */
		tempDirectory : String,
		/* iOS: Holds app-specific files that should be synced (e.g. to iCloud). */
		syncedDataDirectory : String,
		/* iOS: Files private to the app, but that are meaningful to other applciations (e.g. Office files) */
		documentsDirectory : String,
		/* BlackBerry10: Files globally available to all apps */
		sharedDirectory: String
	}
}

